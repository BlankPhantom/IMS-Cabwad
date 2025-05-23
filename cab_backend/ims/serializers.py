from rest_framework import serializers
from django.contrib.auth.models import User
import math
from datetime import datetime
from ims.models import (Item, BeginningBalance, Classification, Measurement, Section, Purpose, TransactionDetails, TransactionProduct, RunningBalance, Area, MonthlyConsumption, MonthlyConsumptionTotal) 
from django.db.models import Sum
from django.db.models import F

class UserSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True)

    class Meta:
        model = User
        fields = ['id', 'username', 'email', 'first_name', 'last_name', 'password', 'is_superuser', 'is_staff', 'is_active']

    def create(self, validated_data):
        password = validated_data.pop('password')
        user = User(
            username=validated_data['username'],
            email=validated_data.get('email', ''),
            first_name=validated_data.get('first_name', ''),
            last_name=validated_data.get('last_name', ''),
            is_superuser=validated_data.get('is_superuser', False),
            is_staff=validated_data.get('is_staff', False)
        )
        user.set_password(password)
        user.save()
        return user
        
    # def update(self, instance, validated_data):
    #     password = validated_data.pop('password')
    #     for attr, value in validated_data.items():
    #         setattr(instance, attr, value)
    #     if password:
    #         instance.set_password(password)
    #     instance.save()
    #     return instance

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
        classification_name = data.pop('classification', None)
        measurement_name = data.pop('measurementName', None)
        
        if classification_name:
            try:
                classification = Classification.objects.get(classification=classification_name)
                data['classificationID'] = classification.pk
            except Classification.DoesNotExist:
                raise serializers.ValidationError({'classification': 'Invalid classification name'})
        
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
        return super().to_representation(instance)

    def get_month(self, instance):
        return instance.created_at.strftime('%B')
    
    def get_year(self, instance):
        return instance.created_at.strftime('%Y')

    def validate(self, data):
        itemName = data.get('itemName')
        itemN = str(itemName)
        itemID = self.instance.itemID if self.instance else None
        if Item.objects.filter(itemName=itemName).exclude(itemID=itemID).exists():
            raise serializers.ValidationError(f"An item with {itemN} name already exists")
        return data

class BeginningBalanceSerializer(serializers.ModelSerializer):
    measurementName = serializers.CharField(source='measurementID.measureName', read_only=True)
    totalCost = serializers.SerializerMethodField()  # Add this line
    class Meta:
        model = BeginningBalance
        fields = '__all__'
    
    def get_totalCost(self, instance):
        return instance.itemQuantity * instance.unitCost  # Compute dynamically

    def create(self, validated_data):
        validated_data['totalCost'] = validated_data['itemQuantity'] * validated_data['unitCost']
        return super().create(validated_data)
    
    def to_internal_value(self, data):
        measurement_name = data.pop('measurementName', None)
        try:
            if measurement_name:
                measurement = Measurement.objects.get(measureName=measurement_name)
                data['measurementID'] = measurement.pk
        except Measurement.DoesNotExist:
            raise serializers.ValidationError({'measurementName': 'Invalid measurement name'})
        return super().to_internal_value(data)

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
    sectionName = serializers.CharField(source='sectionID.sectionName', read_only=True)
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
        
    def update_section(self, instance, section_id):
        instance.sectionID = Section.objects.get(pk=section_id)
        instance.save(update_fields=['sectionID'])  

class TransactionProductSerializer(serializers.ModelSerializer):
    itemQuantity = serializers.SerializerMethodField()
    itemName = serializers.CharField(source='itemID.itemName', read_only=True)
    areaName = serializers.CharField(source='areaID.areaName', read_only=True)
    unitCost = serializers.FloatField(source='itemID.unitCost', read_only=True)
    total = serializers.SerializerMethodField()
    
    class Meta:
        model = TransactionProduct
        fields = (
            'transactionDetailsID', 'transactionProductID', 'itemID', 'itemName',
            'itemQuantity', 'areaID', 'areaName', 'purchasedFromSupp', 'returnToSupplier',
            'transferFromWH', 'transferToWH', 'issuedQty', 'returnedQty', 'consumption',
            'cost','unitCost', 'total'
        )

    def get_total(self, instance):
        if instance.purchasedFromSupp > 0:
            return instance.purchasedFromSupp * instance.cost
        else:
            return instance.consumption * instance.cost
    
    def get_itemQuantity(self, instance):
        item = Item.objects.get(pk=instance.itemID.pk)
        return item.itemQuantity

    def to_internal_value(self, data):
        # For updates, store the original object before any changes
        if self.instance and self.context.get('request').method == 'PUT':
            # Get a fresh copy from the database to ensure we have original values
            self.original_instance = TransactionProduct.objects.get(pk=self.instance.pk)
        return super().to_internal_value(data)

    def create(self, validated_data):
        # Extract cost if provided, otherwise use existing item cost
        cost = validated_data.pop('cost', None)
        
        # Create the transaction product
        instance = super().create(validated_data)
        
        # Update item cost if a new cost is provided
        if cost is not None:
            instance.cost = cost
            instance.save(update_fields=['cost'])
            self.update_unit_cost(instance, cost)
        
        # Calculate adjustment for a new transaction
        qty_adjustment = (
            instance.purchasedFromSupp +    # Items coming in
            instance.returnedQty +          # Items coming back
            instance.transferFromWH -       # Items coming in from warehouse
            instance.issuedQty -            # Items going out
            instance.returnToSupplier -     # Items going back to supplier
            instance.transferToWH           # Items going to warehouse
        )
        
        # Print debug information
        print(f"New transaction - Calculated adjustment: {qty_adjustment}")
        
        # Update the item quantity
        self.update_item_quantity(instance.itemID.pk, qty_adjustment)
        
        return instance
            
    def update_item_quantity(self, item_id, qty_adjustment):
        """
        Update item quantity by the given adjustment amount
        """
        item = Item.objects.get(pk=item_id)
        
        # Apply the adjustment
        item.itemQuantity += qty_adjustment
        item.save(update_fields=['itemQuantity'])
        
        # Refresh the item object from the database
        item.refresh_from_db()
        
        # Print debug information
        print(f"Item quantity after adjustment: {item.itemQuantity}")
        print(f"Item quantity after save (from database): {item.itemQuantity}")  
    
    def update_unit_cost(self, instance, cost):
        # Fetch the associated item
        item = Item.objects.get(pk=instance.itemID.pk)
        
        # Update the unit cost
        item.unitCost = cost
        
        # Recalculate total cost
        item.totalCost = item.itemQuantity * instance.cost
        
        # Save the item with updated cost and total cost
        item.save(update_fields=['unitCost', 'totalCost'])

    def update(self, instance, validated_data):
        # Extract cost if provided
        cost = validated_data.pop('cost', None)
        
        # Get the original values (using the original_instance stored in to_internal_value)
        original = self.original_instance
        
        # Print debug information for old values
        print(f"Previous values: purchasedFromSupp={original.purchasedFromSupp}, returnedQty={original.returnedQty},\n "
              f"transferFromWH={original.transferFromWH}, issuedQty={original.issuedQty}, \n"
              f"returnToSupplier={original.returnToSupplier}, transferToWH={original.transferToWH}\n")
        
        # Calculate the adjustment to revert the original transaction
        revert_qty_adjustment = (
            -original.purchasedFromSupp +
            -original.returnedQty +
            -original.transferFromWH -
            -original.issuedQty -
            -original.returnToSupplier -
            -original.transferToWH
        )
        
        # Print debug information for the revert adjustment
        print(f"Revert adjustment: {revert_qty_adjustment}")
        
        # Revert the original transaction values
        self.update_item_quantity(original.itemID.pk, revert_qty_adjustment)
        
        # Update the instance
        instance = super().update(instance, validated_data)
        
        # Print debug information for new values
        print(f"New values: purchasedFromSupp={instance.purchasedFromSupp}, returnedQty={instance.returnedQty}, \n"
              f"transferFromWH={instance.transferFromWH}, issuedQty={instance.issuedQty}, \n"
              f"returnToSupplier={instance.returnToSupplier}, transferToWH={instance.transferToWH}\n")
        
        # Calculate the adjustment using updated instance
        qty_adjustment = (
            instance.purchasedFromSupp +
            instance.returnedQty +
            instance.transferFromWH -
            instance.issuedQty -
            instance.returnToSupplier -
            instance.transferToWH
        )
        
        # Print debug information for the adjustment
        print(f"Calculated adjustment: {qty_adjustment}")
        
        # Update item cost if a new cost is provided
        if cost is not None:
            instance.cost = cost
            instance.save(update_fields=['cost'])
            self.update_unit_cost(instance, cost)
        
        # Update item quantity
        self.update_item_quantity(instance.itemID.pk, qty_adjustment)
        
        return instance
    
    def delete(self, instance):
        """
        Override delete method to update item quantity before deletion
        """
        try:
            # Calculate the adjustment to revert the transaction
            revert_qty_adjustment = (
                -instance.purchasedFromSupp +    # Revert items that came in
                -instance.returnedQty +          # Revert items that came back
                -instance.transferFromWH +       # Revert items that came in from warehouse
                instance.issuedQty +            # Add back items that went out
                instance.returnToSupplier +     # Add back items returned to supplier
                instance.transferToWH           # Add back items transferred to warehouse
            )
            
            # Print debug information
            print(f"Delete - Reverting quantity adjustment: {revert_qty_adjustment}")
            
            # Update the item quantity before deleting the transaction
            self.update_item_quantity(instance.itemID.pk, revert_qty_adjustment)
            
            # Perform the actual deletion
            instance.delete()
            
            return True
            
        except Exception as e:
            print(f"Error during deletion: {str(e)}")
            raise serializers.ValidationError(f"Failed to delete transaction: {str(e)}")
    
    def validate(self, data):
        request = self.context.get('request')
        if request and request.method == 'PUT':
            return data

        issuedQty = data.get('issuedQty', 0)
        item = Item.objects.get(pk=data['itemID'].pk)

        if issuedQty and issuedQty > item.itemQuantity:
            raise serializers.ValidationError("Insufficient itemQuantity to issue the requested quantity.")

        return data

    def compute_sums_by_itemID(self):
        return TransactionProduct.objects.filter(itemID=self).aggregate(
            purchasedFromSupp_sum=Sum('purchasedFromSupp'),
            returnToSupplier_sum=Sum('returnToSupplier'),
            transferFromWH_sum=Sum('transferFromWH'),
            transferToWH_sum=Sum('transferToWH'),
            issuedQty_sum=Sum('issuedQty'),
            returnedQty_sum=Sum('returnedQty'),
            consumption_sum=Sum('consumption')
        )

# Create a new serializer that includes the related products
class TransactionDetailsWithProductsSerializer(serializers.ModelSerializer):
    products = serializers.SerializerMethodField()
    
    class Meta:
        model = TransactionDetails
        fields = '__all__'  # Add all your existing fields
    
    def get_products(self, obj):
        # Get products from context that was passed in the view
        products_by_detail = self.context.get('products_by_detail', {})
        products = products_by_detail.get(obj.transactionDetailsID, [])
        return TransactionProductSerializer(products, many=True).data