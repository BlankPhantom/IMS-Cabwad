from rest_framework import serializers
from django.contrib.auth.models import User
import math
from datetime import datetime
from ims.models import (Item, BeginningBalance, Classification, Measurement, Section, Purpose, TransactionDetails, TransactionProduct, RunningBalance, Area, MonthlyConsumption, MonthlyConsumptionTotal) 
                        # , MonthlyConsumption)
from django.db.models import Sum

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
    
class BeginningBalanceSerializer(serializers.ModelSerializer):
    class Meta:
        model = BeginningBalance
        fields = '__all__'

class RunningBalanceSerializer(serializers.ModelSerializer):
    class Meta:
        model = RunningBalance
        fields = '__all__'

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

class AreaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Area
        fields = '__all__'

class TransactionDetailsSerializer(serializers.ModelSerializer):
    sectionName = serializers.CharField(source='sectionID.sectionName', read_only=True)
    purposeName = serializers.CharField(source='purposeID.purposeName', read_only=True)

    class Meta:
        model = TransactionDetails
        fields = ('transactionDetailsID', 'date', 'week', 'mris', 'supplier', 'requestedBy', 'sectionID', 'sectionName', 'purposeID', 'purposeName')  
        
class MonthlyConsumptionSerializer(serializers.ModelSerializer):
    class Meta:
        model = MonthlyConsumption
        fields = '__all__'

class MonthlyConsumptionTotalSerializer(serializers.ModelSerializer):
    class Meta:
        model = MonthlyConsumptionTotal
        fields = '__all__'

class TransactionProductSerializer(serializers.ModelSerializer):
    itemQuantity = serializers.SerializerMethodField()
    itemName = serializers.CharField(source='itemID.itemName', read_only=True)

    class Meta:
        model = TransactionProduct
        fields = ('transactionDetailsID','transactionProductID', 'itemID', 'itemName', 'itemQuantity', 'areaID', 'purchasedFromSupp', 'returnToSupplier', 'transferFromWH', 'transferToWH', 'issuedQty', 'returnedQty', 'consumption',)  

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


def compute_sums_by_itemID(item_id):
    sums = TransactionProduct.objects.filter(itemID=item_id).aggregate(
        purchasedFromSupp_sum=Sum('purchasedFromSupp'),
        returnToSupplier_sum=Sum('returnToSupplier'),
        transferFromWH_sum=Sum('transferFromWH'),
        transferToWH_sum=Sum('transferToWH'),
        issuedQty_sum=Sum('issuedQty'),
        returnedQty_sum=Sum('returnedQty'),
        consumption_sum=Sum('consumption')
    )
    return sums

# class RunningBalanceSerializer(serializers.ModelSerializer):
#     purchasedFromSupp_total = serializers.SerializerMethodField()
#     returnToSupplier_total = serializers.SerializerMethodField()
#     transferFromWH_total = serializers.SerializerMethodField()
#     transferToWH_total = serializers.SerializerMethodField()
#     issuedQty_total = serializers.SerializerMethodField()
#     returnedQty_total = serializers.SerializerMethodField()
#     consumption_total = serializers.SerializerMethodField()
#     beginningBalance = serializers.SerializerMethodField()
    
#     class Meta:
#         model = RunningBalance
#         fields = ('runningBalID','itemID','measureName','beginningBalance',
#                   'purchasedFromSupp', 'returnToSupplier', 'transferFromWH', 'transferToWH', 
#                   'issuedQty', 'returnedQty', 'consumption', 'cost', 'totalCost', 
#                   'created_at', 'updated_at',
#                   'purchasedFromSupp_total', 'returnToSupplier_total', 'transferFromWH_total', 
#                   'transferToWH_total', 'issuedQty_total', 'returnedQty_total', 'consumption_total')

#     def get_beginning_balance(self, instance):
#         item = Item.objects.get(pk=instance.itemID.pk)
#         return item.beginningBalance

#     def get_purchasedFromSupp_total(self, obj):
#         sums = compute_sums_by_itemID(obj.itemID)
#         return sums.get('purchasedFromSupp_sum')

#     def get_returnToSupplier_total(self, obj):
#         sums = compute_sums_by_itemID(obj.itemID)
#         return sums.get('returnToSupplier_sum')

#     def get_transferFromWH_total(self, obj):
#         sums = compute_sums_by_itemID(obj.itemID)
#         return sums.get('transferFromWH_sum')

#     def get_transferToWH_total(self, obj):
#         sums = compute_sums_by_itemID(obj.itemID)
#         return sums.get('transferToWH_sum')

#     def get_issuedQty_total(self, obj):
#         sums = compute_sums_by_itemID(obj.itemID)
#         return sums.get('issuedQty_sum')

#     def get_returnedQty_total(self, obj):
#         sums = compute_sums_by_itemID(obj.itemID)
#         return sums.get('returnedQty_sum')

#     def get_consumption_total(self, obj):
#         sums = compute_sums_by_itemID(obj.itemID)
#         return sums.get('consumption_sum')

# class MonthlyConsumptionSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = MonthlyConsumption
#         fields = ('sectionID','date','week','itemID','transactionID','created_at','updated_at')