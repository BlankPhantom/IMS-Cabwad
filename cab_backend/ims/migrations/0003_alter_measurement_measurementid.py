# Generated by Django 5.1.5 on 2025-02-07 03:34

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ims', '0002_alter_item_measurementid'),
    ]

    operations = [
        migrations.AlterField(
            model_name='measurement',
            name='measurementID',
            field=models.AutoField(default=0, primary_key=True, serialize=False),
        ),
    ]
