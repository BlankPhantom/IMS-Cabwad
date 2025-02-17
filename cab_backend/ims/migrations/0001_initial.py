# Generated by Django 5.1.6 on 2025-02-17 05:38

import django.db.models.deletion
import django.utils.timezone
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
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
    ]
