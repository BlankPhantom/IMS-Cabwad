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

class ClassificationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Classification
        fields = ('classificationID','classification')

class MeasurementSerializer(serializers.ModelSerializer):
    class Meta:
        model = Measurement
        fields = ('measurementID','measureName')

class ItemListSerializer(serializers.ListSerializer):
    def create(self, validated_data):
        items = [Item(**item_data) for item_data in validated_data]
        return Item.objects.bulk_create(items)
    
class ItemSerializer(serializers.ModelSerializer):
    classificationName = serializers.CharField(source='classificationID.classification', read_only=True)
    measurementName = serializers.CharField(source='measurementID.measureName', read_only=True)
    month = serializers.SerializerMethodField()
    year = serializers.SerializerMethodField()

    class Meta:
        model = Item
        fields = ('itemID', 'classificationID', 'classificationName','measurementID','measurementName','itemName','itemQuantity','unitCost','totalCost','month','year','created_at','updated_at')

    def to_internal_value(self, data):
        classification_name = data.pop('classificationName', None)
        measurement_name = data.pop('measurementName', None)
        
        if classification_name:
            try:
                classification = Classification.objects.get(classification=classification_name)
                data['classificationID'] = classification.pk
            except Classification.DoesNotExist:
                raise serializers.ValidationError({'classifiscationName': 'Invalid classification name'})
        
        if measurement_name:
            try:
                measurement = Measurement.objects.get(measureName=measurement_name)
                data['measurementID'] = measurement.pk
            except Measurement.DoesNotExist:
                raise serializers.ValidationError({'measurementName': 'Invalid measurement name'})
        
        return super().to_internal_value(data)

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
    measureName = MeasurementSerializer(source='measurementID')

    class Meta:
        model = BeginningBalance
        fields = '__all__'

class RunningBalanceSerializer(serializers.ModelSerializer):
    measureName = MeasurementSerializer(source='measurementID')
    
    class Meta:
        model = RunningBalance
        fields = ('__all__')

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
        
class MonthlyConsumptionSerializer(serializers.ModelSerializer):
    class Meta:
        model = MonthlyConsumption
        fields = '__all__'

class MonthlyConsumptionTotalSerializer(serializers.ModelSerializer):
    month = serializers.SerializerMethodField()
    class Meta:
        model = MonthlyConsumptionTotal
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
    areaName = serializers.CharField(source='areaID.areaName', read_only=True)
    cost = serializers.CharField(source='itemID.unitCost', read_only=True)
    total = serializers.SerializerMethodField()

    class Meta:
        model = TransactionProduct
        fields = (
            'transactionDetailsID', 'transactionProductID', 'itemID', 'itemName',
            'itemQuantity', 'areaID', 'areaName' , 'purchasedFromSupp', 'returnToSupplier',
            'transferFromWH', 'transferToWH', 'issuedQty', 'returnedQty', 'consumption',
            'cost', 'total'
        )

    def get_total(self, instance):
        total = instance.consumption * instance.itemID.unitCost
        return total
    
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
        issuedQty = data.get('issuedQty', 0)
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