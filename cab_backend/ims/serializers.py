from rest_framework import serializers
from django.contrib.auth.models import User
from ims.models import Item, Classification, Measurement, Section, Purpose, Transaction, RunningBalance, MonthlyConsumption

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
        if Item.objects.filter(itemName=itemName).exists():
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
        fields = ('transactionID','classificationID','sectionID','purposeID','date','week','mris','supplier','requestedBy','Area','purchasedQty','returnToSupplier','transferFromWH','transferToWH','issuedQty','returnedQty','consumption','cost','totalCost', 'created_at','updated_at')

class RunningBalance(serializers.ModelSerializer):
    class Meta:
        model = RunningBalance
        fields = ('runningBalID','classificationID','itemID','measurementID','beginningBalance','purchasedFromSupp','returnToSupplier','transferFromWH','transferToWH','issuedQty','consumption','cost','totalCost','created_at','updated_at')

class MonthlyConsumptionSerializer(serializers.ModelSerializer):
    class Meta:
        model = MonthlyConsumption
        fields = ('sectionID','date','week','itemID','transactionID','created_at','updated_at')