from django.db import models
from django.utils import timezone
from django.utils.timezone import now
from django.db.models.signals import pre_save
from django.dispatch import receiver    
from django.utils import dateformat

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
        if not self.itemID:
            max_id = Item.objects.filter(classificationID=self.classificationID).count() + 1
            self.itemID = f'{self.classificationID.classificationID:02d}-{max_id:03d}'
            self.totalCost = self.itemQuantity * self.unitCost  # Compute totalCost
        super(Item, self).save(*args, **kwargs)

@receiver(pre_save, sender=Item)
def create_custom_id(sender, instance, **kwargs):
    if not instance.itemID:
        max_id = Item.objects.filter(classificationID=instance.classificationID).count() + 1
        instance.itemID = f'{instance.classificationID.classificationID:02d}-{max_id:03d}'

class BeginningBalance(models.Model):
    id = models.AutoField(primary_key=True)
    itemID = models.CharField(max_length=20)  # Copy from Item
    itemName = models.CharField(max_length=500)
    measurementID = models.ForeignKey(Measurement, on_delete=models.CASCADE)
    itemQuantity = models.IntegerField(default=0)
    unitCost = models.FloatField(default=0.0)
    totalCost = models.FloatField(default=0.0)
    created_at = models.DateTimeField(default=timezone.now)
    
    def save(self, *args, **kwargs):
        self.totalCost = self.itemQuantity * self.unitCost  # Compute totalCost
        super().save(*args, **kwargs) 

class Section(models.Model):
    sectionID = models.AutoField(primary_key=True)
    sectionName = models.CharField(max_length=500)

class Purpose(models.Model):
    purposeID = models.AutoField(primary_key=True)
    purposeName = models.CharField(max_length=500)

class Area(models.Model):
    areaID = models.AutoField(primary_key=True)
    areaName = models.CharField(max_length=100)

class TransactionDetails(models.Model):
    formattedDate = dateformat.format(timezone.now(), 'Y-m-d')
    transactionDetailsID = models.AutoField(primary_key=True)
    date = models.DateField(default=formattedDate)
    week = models.IntegerField(default=0)
    mris = models.IntegerField(null=False)
    supplier = models.CharField(max_length=500, blank=True)
    requestedBy = models.CharField(max_length=500, blank=True)
    sectionID = models.ForeignKey('Section', on_delete=models.CASCADE, null=True)
    purposeID = models.ForeignKey('Purpose', on_delete=models.CASCADE, null=True)
    created_at = models.DateTimeField(default=timezone.now)

class TransactionProduct(models.Model):
    transactionProductID = models.AutoField(primary_key=True)
    transactionDetailsID = models.ForeignKey(TransactionDetails, on_delete=models.CASCADE)
    itemID = models.ForeignKey(Item, on_delete=models.CASCADE) 
    areaID = models.ForeignKey('Area', on_delete=models.CASCADE, null=True)
    purchasedFromSupp = models.IntegerField(blank=True, default=0)
    returnToSupplier = models.IntegerField(blank=True, default=0)
    transferFromWH = models.IntegerField(blank=True, default=0)
    transferToWH = models.IntegerField(blank=True, default=0)
    issuedQty = models.IntegerField(blank=True, default=0)
    returnedQty = models.IntegerField(blank=True, default=0)
    consumption = models.IntegerField(default=0)
    cost = models.FloatField(default=0.0)
    created_at = models.DateTimeField(default=timezone.now)

    def save(self, *args, **kwargs):
        if self.issuedQty == 0 and self.returnedQty > 0:
            self.consumption = 0
        else:
            self.consumption = self.returnedQty - self.issuedQty
        super(TransactionProduct, self).save(*args, **kwargs)

    @property
    def computed_consumption(self): 
        return self.returnedQty - self

class RunningBalance(models.Model):
    runningBalID = models.AutoField(primary_key=True)
    itemID =  models.ForeignKey(Item, on_delete=models.CASCADE) 
    itemName = models.CharField(max_length=500, default="")
    measurementID = models.ForeignKey(Measurement, on_delete=models.CASCADE, default=1)
    itemQuantity = models.IntegerField(default=0)
    unitCost = models.FloatField(default=0.0)
    beginningBalance = models.IntegerField(default=0)
    purchasedFromSupp = models.IntegerField(blank=True, default=0)
    returnToSupplier = models.IntegerField(blank=True, default=0)
    transferFromWH = models.IntegerField(blank=True, default=0)
    transferToWH = models.IntegerField(blank=True, default=0)
    issuedQty = models.IntegerField(blank=True, default=0)
    returnedQty = models.IntegerField(blank=True, default=0)
    consumption = models.IntegerField(default=0)
    unitCost = models.FloatField(default=0.0)
    totalCost = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    remarks = models.CharField(max_length=100, default="")
    created_at = models.DateTimeField(default= timezone.now)
    updated_at = models.DateTimeField(default= timezone.now)

class MonthlyConsumption(models.Model):
    transactionProductID = models.ForeignKey(TransactionProduct, null=True, blank=True, on_delete=models.CASCADE)
    monthlyConsumptionID = models.AutoField(primary_key=True)
    sectionID = models.ForeignKey(Section, null=True, blank=True, on_delete=models.CASCADE)
    date = models.DateField(blank=True, null=True)
    week = models.IntegerField(default=0)
    itemID = models.ForeignKey(Item, on_delete=models.CASCADE)
    itemName = models.CharField(max_length=255)
    consumption = models.FloatField()
    cost = models.FloatField()
    total = models.FloatField()
    created_at = models.DateTimeField(default= timezone.now)

class MonthlyConsumptionTotal(models.Model):
    id = models.AutoField(primary_key=True)
    totalNSC = models.IntegerField(default=0)
    totalProd = models.IntegerField(default=0)
    totalMeterMaintenance = models.IntegerField(default=0)
    totalSpecialProj = models.IntegerField(default=0)
    totalConstruction = models.IntegerField(default=0)
    totalCommercial = models.IntegerField(default=0)
    totalSales = models.IntegerField(default=0)
    totalGenService = models.IntegerField(default=0)
    totalConsumption = models.IntegerField(default=0)

    totalNSC1 = models.IntegerField(default=0)
    totalProd1 = models.IntegerField(default=0)
    totalMeterMaintenance1 = models.IntegerField(default=0)
    totalSpecialProj1 = models.IntegerField(default=0)
    totalConstruction1 = models.IntegerField(default=0)
    totalCommercial1 = models.IntegerField(default=0)
    totalSales1 = models.IntegerField(default=0)
    totalGenService1 = models.IntegerField(default=0)
    totalConsumption1 = models.IntegerField(default=0)

    totalNSC2 = models.IntegerField(default=0)
    totalProd2 = models.IntegerField(default=0)
    totalMeterMaintenance2 = models.IntegerField(default=0)
    totalSpecialProj2 = models.IntegerField(default=0)
    totalConstruction2 = models.IntegerField(default=0)
    totalCommercial2 = models.IntegerField(default=0)
    totalSales2 = models.IntegerField(default=0)
    totalGenService2 = models.IntegerField(default=0)
    totalConsumption2 = models.IntegerField(default=0)

    totalNSC3 = models.IntegerField(default=0)
    totalProd3 = models.IntegerField(default=0)
    totalMeterMaintenance3 = models.IntegerField(default=0)
    totalSpecialProj3 = models.IntegerField(default=0)
    totalConstruction3 = models.IntegerField(default=0)
    totalCommercial3 = models.IntegerField(default=0)
    totalSales3 = models.IntegerField(default=0)
    totalGenService3 = models.IntegerField(default=0)
    totalConsumption3 = models.IntegerField(default=0)

    totalNSC4 = models.IntegerField(default=0)
    totalProd4 = models.IntegerField(default=0)
    totalMeterMaintenance4 = models.IntegerField(default=0)
    totalSpecialProj4 = models.IntegerField(default=0)
    totalConstruction4 = models.IntegerField(default=0)
    totalCommercial4 = models.IntegerField(default=0)
    totalSales4 = models.IntegerField(default=0)
    totalGenService4 = models.IntegerField(default=0)
    totalConsumption4 = models.IntegerField(default=0)

    totalNSC5 = models.IntegerField(default=0)
    totalProd5 = models.IntegerField(default=0)
    totalMeterMaintenance5 = models.IntegerField(default=0)
    totalSpecialProj5 = models.IntegerField(default=0)
    totalConstruction5 = models.IntegerField(default=0)
    totalCommercial5 = models.IntegerField(default=0)
    totalSales5 = models.IntegerField(default=0)
    totalGenService5 = models.IntegerField(default=0)
    totalConsumption5 = models.IntegerField(default=0)

    created_at = models.DateTimeField(default= timezone.now)
    updated_at = models.DateTimeField(default= timezone.now)


    
    