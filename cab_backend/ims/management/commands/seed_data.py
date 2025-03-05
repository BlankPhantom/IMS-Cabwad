from django.core.management.base import BaseCommand
from ims.models import Item, Classification, Measurement, Section, Purpose, Area
from django.contrib.auth.models import User
import csv
import os
import json
from datetime import datetime
from django.conf import settings

class Command(BaseCommand):
    help = 'Seed the database with initial data'

    def handle(self, *args, **kwargs):
        #admin account
        if not User.objects.filter(username='admin').exists():
            User.objects.create_superuser('admin', 'admin@gmail.com', 'admin')
        
        #seed data for classification
        classif = ['Chemicals','Construction','Fittings','Pipes','Water Meters','Other Materials']
        for name in classif:
            Classification.objects.get_or_create(classification=name)

        #seed data for measurement
        measure = ['N/A','gal','bag','bags','box','bot','bundle','Can','drum','drums','Kgs','Lt','ltr','mtr','mtrs','pack','Pail','pc','pcs','roll','set','sets']
        for name in measure:
            Measurement.objects.get_or_create(measureName=name)

        # Seed items from JSON
        with open(os.path.join(settings.BASE_DIR, 'ims/fixtures/items_data.json'), 'r') as file:
            items_data = json.loads(file.read())
            
        items_to_create = []
        for item in items_data:
            try:
                classification = Classification.objects.get(classification=item['classificationName'])
                measurement = Measurement.objects.get(measureName=item['measurementName'])
                
                items_to_create.append(Item(
                    itemName=item['itemName'],
                    classificationID=classification,
                    measurementID=measurement,
                    itemQuantity=0,  # Default quantity if not specified
                    unitCost=0,  # Default unit cost if not specified
                ))
            except (Classification.DoesNotExist, Measurement.DoesNotExist) as e:
                self.stdout.write(self.style.WARNING(f"Skipping item {item['itemName']}: {str(e)}"))

        if items_to_create:
            Item.objects.bulk_create(items_to_create)
            self.stdout.write(self.style.SUCCESS(f'Successfully created {len(items_to_create)} items'))