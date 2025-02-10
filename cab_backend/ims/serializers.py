from rest_framework import serializers
from ims.models import Item, Classification, Measurement, Section, Purpose, Transaction, RunningBalance, MonthlyConsumption

class ItemSerializer(serializers.ModelSerializer):
    classificationName = serializers.CharField(source='classificationID.classification', read_only=True)
    measurementName = serializers.CharField(source='measurementID.measureName', read_only=True)
    
    class Meta:
        model = Item
        fields = ('itemID', 'classificationID', 'classificationName','measurementID','measurementName','itemName','itemQuantity','unitCost','totalCost')

    def validate(self, data):
        itemName = data.get('itemName')
        if Item.objects.filter(itemName=itemName).exists():
            raise serializers.ValidationError("An item with this name already exists.")
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
        fields = ('transactionID','classificationID','sectionID','purposeID','date','week','mris','supplier','requestedBy','Area','purchasedQty','returnToSupplier','transferFromWH','transferToWH','issuedQty','returnedQty','consumption','cost','totalCost')

class RunningBalance(serializers.ModelSerializer):
    class Meta:
        model = RunningBalance
        fields = ('runningBalID','classificationID','itemID','measurementID','beginningBalance','purchasedFromSupp','returnToSupplier','transferFromWH','transferToWH','issuedQty','consumption','cost','totalCost',)

class MonthlyConsumptionSerializer(serializers.ModelSerializer):
    class Meta:
        model = MonthlyConsumption
        fields = ('sectionID','date','week','itemID','transactionID',)