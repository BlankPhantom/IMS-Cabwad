# Generated by Django 5.1.6 on 2025-03-05 03:17

import django.db.models.deletion
import django.utils.timezone
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Area',
            fields=[
                ('areaID', models.AutoField(primary_key=True, serialize=False)),
                ('areaName', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Classification',
            fields=[
                ('classificationID', models.AutoField(primary_key=True, serialize=False)),
                ('classification', models.CharField(max_length=500)),
            ],
        ),
        migrations.CreateModel(
            name='Measurement',
            fields=[
                ('measurementID', models.AutoField(primary_key=True, serialize=False)),
                ('measureName', models.CharField(max_length=500)),
            ],
        ),
        migrations.CreateModel(
            name='MonthlyConsumptionTotal',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('totalNSC', models.IntegerField(default=0)),
                ('totalProd', models.IntegerField(default=0)),
                ('totalMeterMaintenance', models.IntegerField(default=0)),
                ('totalSpecialProj', models.IntegerField(default=0)),
                ('totalConstruction', models.IntegerField(default=0)),
                ('totalCommercial', models.IntegerField(default=0)),
                ('totalSales', models.IntegerField(default=0)),
                ('totalGenService', models.IntegerField(default=0)),
                ('totalConsumption', models.IntegerField(default=0)),
                ('totalNSC1', models.IntegerField(default=0)),
                ('totalProd1', models.IntegerField(default=0)),
                ('totalMeterMaintenance1', models.IntegerField(default=0)),
                ('totalSpecialProj1', models.IntegerField(default=0)),
                ('totalConstruction1', models.IntegerField(default=0)),
                ('totalCommercial1', models.IntegerField(default=0)),
                ('totalSales1', models.IntegerField(default=0)),
                ('totalGenService1', models.IntegerField(default=0)),
                ('totalConsumption1', models.IntegerField(default=0)),
                ('totalNSC2', models.IntegerField(default=0)),
                ('totalProd2', models.IntegerField(default=0)),
                ('totalMeterMaintenance2', models.IntegerField(default=0)),
                ('totalSpecialProj2', models.IntegerField(default=0)),
                ('totalConstruction2', models.IntegerField(default=0)),
                ('totalCommercial2', models.IntegerField(default=0)),
                ('totalSales2', models.IntegerField(default=0)),
                ('totalGenService2', models.IntegerField(default=0)),
                ('totalConsumption2', models.IntegerField(default=0)),
                ('totalNSC3', models.IntegerField(default=0)),
                ('totalProd3', models.IntegerField(default=0)),
                ('totalMeterMaintenance3', models.IntegerField(default=0)),
                ('totalSpecialProj3', models.IntegerField(default=0)),
                ('totalConstruction3', models.IntegerField(default=0)),
                ('totalCommercial3', models.IntegerField(default=0)),
                ('totalSales3', models.IntegerField(default=0)),
                ('totalGenService3', models.IntegerField(default=0)),
                ('totalConsumption3', models.IntegerField(default=0)),
                ('totalNSC4', models.IntegerField(default=0)),
                ('totalProd4', models.IntegerField(default=0)),
                ('totalMeterMaintenance4', models.IntegerField(default=0)),
                ('totalSpecialProj4', models.IntegerField(default=0)),
                ('totalConstruction4', models.IntegerField(default=0)),
                ('totalCommercial4', models.IntegerField(default=0)),
                ('totalSales4', models.IntegerField(default=0)),
                ('totalGenService4', models.IntegerField(default=0)),
                ('totalConsumption4', models.IntegerField(default=0)),
                ('totalNSC5', models.IntegerField(default=0)),
                ('totalProd5', models.IntegerField(default=0)),
                ('totalMeterMaintenance5', models.IntegerField(default=0)),
                ('totalSpecialProj5', models.IntegerField(default=0)),
                ('totalConstruction5', models.IntegerField(default=0)),
                ('totalCommercial5', models.IntegerField(default=0)),
                ('totalSales5', models.IntegerField(default=0)),
                ('totalGenService5', models.IntegerField(default=0)),
                ('totalConsumption5', models.IntegerField(default=0)),
                ('created_at', models.DateTimeField(default=django.utils.timezone.now)),
                ('updated_at', models.DateTimeField(default=django.utils.timezone.now)),
            ],
        ),
        migrations.CreateModel(
            name='Purpose',
            fields=[
                ('purposeID', models.AutoField(primary_key=True, serialize=False)),
                ('purposeName', models.CharField(max_length=500)),
            ],
        ),
        migrations.CreateModel(
            name='Section',
            fields=[
                ('sectionID', models.AutoField(primary_key=True, serialize=False)),
                ('sectionName', models.CharField(max_length=500)),
            ],
        ),
        migrations.CreateModel(
            name='Item',
            fields=[
                ('itemID', models.CharField(editable=False, max_length=20, primary_key=True, serialize=False)),
                ('itemName', models.CharField(max_length=500)),
                ('itemQuantity', models.IntegerField(default=0)),
                ('unitCost', models.FloatField(default=0.0)),
                ('totalCost', models.FloatField(default=0.0)),
                ('created_at', models.DateTimeField(default=django.utils.timezone.now)),
                ('updated_at', models.DateTimeField(default=django.utils.timezone.now)),
                ('classificationID', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='ims.classification')),
                ('measurementID', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='ims.measurement')),
            ],
        ),
        migrations.CreateModel(
            name='BeginningBalance',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('itemID', models.CharField(max_length=20)),
                ('itemName', models.CharField(max_length=500)),
                ('itemQuantity', models.IntegerField(default=0)),
                ('unitCost', models.FloatField(default=0.0)),
                ('totalCost', models.FloatField(default=0.0)),
                ('created_at', models.DateTimeField(default=django.utils.timezone.now)),
                ('measurementID', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='ims.measurement')),
            ],
        ),
        migrations.CreateModel(
            name='RunningBalance',
            fields=[
                ('runningBalID', models.AutoField(primary_key=True, serialize=False)),
                ('itemName', models.CharField(default='', max_length=500)),
                ('itemQuantity', models.IntegerField(default=0)),
                ('beginningBalance', models.IntegerField(default=0)),
                ('purchasedFromSupp', models.IntegerField(blank=True, default=0)),
                ('returnToSupplier', models.IntegerField(blank=True, default=0)),
                ('transferFromWH', models.IntegerField(blank=True, default=0)),
                ('transferToWH', models.IntegerField(blank=True, default=0)),
                ('issuedQty', models.IntegerField(blank=True, default=0)),
                ('returnedQty', models.IntegerField(blank=True, default=0)),
                ('consumption', models.IntegerField(default=0)),
                ('unitCost', models.FloatField(default=0.0)),
                ('totalCost', models.DecimalField(blank=True, decimal_places=2, max_digits=10, null=True)),
                ('remarks', models.CharField(default='', max_length=100)),
                ('created_at', models.DateTimeField(default=django.utils.timezone.now)),
                ('updated_at', models.DateTimeField(default=django.utils.timezone.now)),
                ('itemID', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='ims.item')),
                ('measurementID', models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='ims.measurement')),
            ],
        ),
        migrations.CreateModel(
            name='MonthlyConsumption',
            fields=[
                ('monthlyConsumptionID', models.AutoField(primary_key=True, serialize=False)),
                ('date', models.DateField(blank=True, null=True)),
                ('week', models.IntegerField(default=0)),
                ('itemName', models.CharField(max_length=255)),
                ('consumption', models.FloatField()),
                ('cost', models.FloatField()),
                ('total', models.FloatField()),
                ('created_at', models.DateTimeField(default=django.utils.timezone.now)),
                ('itemID', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='ims.item')),
                ('sectionID', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='ims.section')),
            ],
        ),
        migrations.CreateModel(
            name='TransactionDetails',
            fields=[
                ('transactionDetailsID', models.AutoField(primary_key=True, serialize=False)),
                ('date', models.DateField(default='2025-03-05')),
                ('week', models.IntegerField(default=0)),
                ('mris', models.IntegerField()),
                ('supplier', models.CharField(blank=True, max_length=500)),
                ('requestedBy', models.CharField(blank=True, max_length=500)),
                ('purposeID', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='ims.purpose')),
                ('sectionID', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='ims.section')),
            ],
        ),
        migrations.CreateModel(
            name='TransactionProduct',
            fields=[
                ('transactionProductID', models.AutoField(primary_key=True, serialize=False)),
                ('purchasedFromSupp', models.IntegerField(blank=True, default=0)),
                ('returnToSupplier', models.IntegerField(blank=True, default=0)),
                ('transferFromWH', models.IntegerField(blank=True, default=0)),
                ('transferToWH', models.IntegerField(blank=True, default=0)),
                ('issuedQty', models.IntegerField(blank=True, default=0)),
                ('returnedQty', models.IntegerField(blank=True, default=0)),
                ('consumption', models.IntegerField(default=0)),
                ('created_at', models.DateTimeField(default=django.utils.timezone.now)),
                ('areaID', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='ims.area')),
                ('itemID', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='ims.item')),
                ('transactionDetailsID', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='ims.transactiondetails')),
            ],
        ),
    ]
