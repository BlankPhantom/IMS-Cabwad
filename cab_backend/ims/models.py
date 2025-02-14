from django.db import models
from django.utils import timezone
from django.db.models.signals import pre_save
from django.dispatch import receiver    

class Classification(models.Model):
    classificationID = models.AutoField(primary_key=True)
    classification = models.CharField(max_length=500)

class Measurement(models.Model):
    measurementID = models.AutoField(primary_key=True)
    measureName = models.CharField(max_length=500)
    
class Item(models.Model):
    itemID = models.CharField(primary_key=True, max_length=20, editable=False)  # Custom ID field
    classificationID = models.ForeignKey(Classification, on_delete=models.CASCADE)
    measurementID = models.ForeignKey(Measurement, on_delete=models.CASCADE)
    itemName = models.CharField(max_length=500)
    itemQuantity = models.IntegerField(default=0)
    unitCost = models.FloatField(default=0.0)
    totalCost = models.FloatField(default=0.0)
    created_at = models.DateTimeField(default= timezone.now)
    updated_at = models.DateTimeField(default= timezone.now)

    def save(self, *args, **kwargs):
        # self.totalCost = self.itemQuantity * self.unitCost
        if not self.itemID:
            max_id = Item.objects.filter(classificationID=self.classificationID).count() + 1
            self.itemID = f'{self.classificationID.classificationID:02d}-{max_id:03d}'
        super(Item, self).save(*args, **kwargs)

@receiver(pre_save, sender=Item)
def create_custom_id(sender, instance, **kwargs):
    if not instance.itemID:
        max_id = Item.objects.filter(classificationID=instance.classificationID).count() + 1
        instance.itemID = f'{instance.classificationID.classificationID:02d}-{max_id:03d}'

class Section(models.Model):
    sectionID = models.AutoField(primary_key=True)
    sectionName = models.CharField(max_length=500)

class Purpose(models.Model):
    purposeID = models.AutoField(primary_key=True)
    purposeName = models.CharField(max_length=500)
   
# class Transaction(models.Model):
#     transactionID = models.AutoField(primary_key=True)
#     classificationID = models.ForeignKey(Classification, on_delete=models.CASCADE, default=1)
#     itemID = models.ForeignKey(Item, on_delete=models.CASCADE, default=1)
#     sectionID = models.ForeignKey(Section, on_delete=models.CASCADE, default=1)
#     purposeID = models.ForeignKey(Purpose, on_delete=models.CASCADE, default=1)
#     date = models.DateField()
#     week = models.CharField(max_length=25)
#     mris = models.IntegerField(null=False)
#     supplier = models.CharField(max_length=500)
#     requestedBy = models.CharField(max_length=500)
#     Area = models.CharField(max_length=500)
#     purchasedQty = models.IntegerField(blank=True, default=0)
#     returnToSupplier = models.CharField(max_length=500)
#     transferFromWH = models.CharField(max_length=500)
#     transferToWH = models.CharField(max_length=500)
#     issuedQty  = models.IntegerField(blank=True, null=True)
#     returnedQty  = models.IntegerField(blank=True, null=True)
#     consumption = models.IntegerField(blank=True, null=True)
#     cost = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
#     totalCost = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
#     created_at = models.DateTimeField(default= timezone.now)
#     updated_at = models.DateTimeField(default= timezone.now)

class Transaction(models.Model):
    transactionID = models.AutoField(primary_key=True)
    transactDetailsID = models.ForeignKey('TransactionDetails', on_delete=models.CASCADE)
    transactProductID = models.ForeignKey('TransactionProduct', on_delete=models.CASCADE)

class TransactionDetails(models.Model):
    transactDetailsID = models.AutoField(primary_key=True)
    date = models.DateField(default=timezone.now)
    week = models.CharField(max_length=25)
    mris = models.IntegerField(null=False)
    supplier = models.CharField(max_length=500)
    requestedBy = models.CharField(max_length=500)
    section = models.CharField(max_length=500)
    purpose = models.CharField(max_length=500)

class TransactionProduct(models.Model):
    transactionProductID = models.AutoField(primary_key=True)
    itemID = models.ForeignKey(Item, on_delete=models.CASCADE) 
    area = models.CharField(max_length=500)
    purchasedFromSupp = models.IntegerField()
    returnToSupplier = models.CharField(max_length=500)
    transferFromWH = models.CharField(max_length=500)
    transferToWH = models.CharField(max_length=500)
    issuedQty = models.IntegerField(blank=True, default=0)
    returnedQty = models.IntegerField(blank=True, default=0)
    consumption = models.IntegerField(blank=True, default=0, negative=True)

class RunningBalance(models.Model):
    runningBalID = models.AutoField(primary_key=True, default=1)
    classID = models.ForeignKey(Classification, on_delete=models.CASCADE, default=1)
    itemID = models.ForeignKey(Item, on_delete=models.CASCADE, default=1)
    measureID = models.ForeignKey(Measurement, on_delete=models.CASCADE, default=1)
    beginningBalance = models.IntegerField(null=True)
    purchasedFromSupp = models.IntegerField()
    returnToSupplier = models.CharField(max_length=500)
    transferFromWH = models.CharField(max_length=500)
    transferToWH = models.CharField(max_length=500)
    issuedQty = models.IntegerField(blank=True, null=True)
    consumption = models.IntegerField(blank=True, null=True)
    cost = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    totalCost = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    created_at = models.DateTimeField(default= timezone.now)
    updated_at = models.DateTimeField(default= timezone.now)

class MonthlyConsumption(models.Model):
    sectionID = models.ForeignKey(Section, on_delete=models.CASCADE, default=1)
    date = models.DateField(blank=True, null=True)
    week = models.CharField(max_length=500)
    classID = models.ForeignKey(Classification, on_delete=models.CASCADE, default=1)
    itemID = models.ForeignKey(Item, on_delete=models.CASCADE, default=1)
    transactionID = models.ForeignKey(Transaction, on_delete=models.CASCADE, default=1)
    created_at = models.DateTimeField(default= timezone.now)
    updated_at = models.DateTimeField(default= timezone.now)


    
    