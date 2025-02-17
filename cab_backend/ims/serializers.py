from rest_framework import serializers
from django.contrib.auth.models import User
from ims.models import (Item, Classification, Measurement, Section, Purpose, Transaction, TransactionDetails, TransactionProduct,) 
                        # RunningBalance, MonthlyConsumption)

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id','username','email')

class ItemSerializer(serializers.ModelSerializer):
    classificationName = serializers.CharField(source='classificationID.classification', read_only=True)
    measurementName = serializers.CharField(source='measurementID.measureName', read_only=True)
    month = serializers.SerializerMethodField()
    year = serializers.SerializerMethodField()

    class Meta:
        model = Item
        fields = ('itemID', 'classificationID', 'classificationName','measurementID','measurementName','itemName','itemQuantity','unitCost','totalCost','month','year','created_at','updated_at')

    def get_totalCost(self, instance):
        instance.totalCost = instance.itemQuantity * instance.unitCost
        instance.save(update_fields=['totalCost'])
        representation = super().to_representation(instance)
        return representation

    def get_month(self, instance):
        return instance.created_at.strftime('%B')
    
    def get_year(self, instance):
        return instance.created_at.strftime('%Y')

    def validate(self, data):
        itemName = data.get('itemName')
        itemID = self.instance.itemID if self.instance else None
        if Item.objects.filter(itemName=itemName).exclude(itemID=itemID).exists():
            raise serializers.ValidationError("An item with this name already exists")
        return data

class ClassificationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Classification
        fields = ('classificationID','classification')

class MeasurementSerializer(serializers.ModelSerializer):
    class Meta:
        model = Measurement
        fields = ('measurementID','measureName')

class SectionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Section
        fields = ('sectionID','sectionName')

class PurposeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Purpose
        fields = ('purposeID','purposeName')

class TransactionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Transaction
        fields = '__all__'

class TransactionDetailsSerializer(serializers.ModelSerializer):
    sectionName = serializers.CharField(source='sectionID.sectionName', read_only=True)
    purposeName = serializers.CharField(source='purposeID.purposeName', read_only=True)
    class Meta:
        model = TransactionDetails
        fields = ('transactionDetailsID', 'date', 'week', 'mris', 'supplier', 'requestedBy', 'sectionID', 'sectionName', 'purposeID', 'purposeName')  

class TransactionProductSerializer(serializers.ModelSerializer):
    itemQuantity = serializers.SerializerMethodField()
    itemName = serializers.CharField(source='itemID.itemName', read_only=True)

    class Meta:
        model = TransactionProduct
        fields = ('transactionDetailsID','transactionProductID', 'itemID', 'itemName', 'itemQuantity', 'area', 'purchasedFromSupp', 'returnToSupplier', 'transferFromWH', 'transferToWH', 'issuedQty', 'returnedQty', 'consumption',)  

    def get_itemQuantity(self, instance):
        item = Item.objects.get(pk=instance.itemID.pk)
        return item.itemQuantity

    def create(self, validated_data):
        instance = super().create(validated_data)
        self.update_item_quantity(instance)
        return instance

    def update(self, instance, validated_data):
        instance = super().update(instance, validated_data)
        self.update_item_quantity(instance)
        return instance

    def update_item_quantity(self, instance):
        item = Item.objects.get(pk=instance.itemID.pk)
        item.itemQuantity += instance.purchasedFromSupp - instance.issuedQty + instance.returnedQty
        item.save(update_fields=['itemQuantity'])
    
    def validate(self, data):
        issuedQty = data.get('issuedQty')
        item = Item.objects.get(pk=data['itemID'].pk)
        
        if issuedQty and issuedQty > item.itemQuantity:
            raise serializers.ValidationError("Insufficient itemQuantity to issue the requested quantity.")
        
        return data

# class RunningBalance(serializers.ModelSerializer):
#     class Meta:
#         model = RunningBalance
#         fields = ('runningBalID','classificationID','itemID','measurementID','beginningBalance','purchasedFromSupp','returnToSupplier','transferFromWH','transferToWH','issuedQty','consumption','cost','totalCost','created_at','updated_at')

# class MonthlyConsumptionSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = MonthlyConsumption
#         fields = ('sectionID','date','week','itemID','transactionID','created_at','updated_at')