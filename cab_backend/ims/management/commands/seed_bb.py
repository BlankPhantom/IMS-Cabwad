from django.core.management.base import BaseCommand
from ims.models import Measurement,BeginningBalance
import json
import os
from django.conf import settings
from django.utils import timezone
from ims.models import BeginningBalance, Item
from django.utils.timezone import make_aware
import datetime

class Command(BaseCommand):
    help = 'Seed items from JSON file'

    def handle(self, *args, **kwargs):
        json_path = os.path.join(settings.BASE_DIR, 'ims', 'fixtures', 'beginning_data.json')
        
        with open(json_path, 'r') as file:
            items_data = json.load(file)
        
        created_bb = []
        errors = []

        specific_date = make_aware(datetime.datetime(2025, 2, 12, 9, 30))

        for item_data in items_data:
            try:
                measurement = Measurement.objects.get(
                    measureName=item_data['measurementName']
                )
                
                item_quantity = float(item_data.get('itemQuantity', 0) or 0)
                unit_cost = float(item_data.get('unitCost', 0) or 0)

                new_item = BeginningBalance(
                    itemID=item_data.get('itemID'),
                    itemName=item_data.get('itemName'),
                    measurementID=measurement,
                    itemQuantity=item_quantity,
                    unitCost=unit_cost,
                    created_at=specific_date  # Set specific date
                )
                # Update itemQuantity in the Items model
                Item.objects.filter(itemID=item_data.get('itemID')).update(itemQuantity=item_quantity)
                Item.objects.filter(itemID=item_data.get('itemID')).update(unitCost=unit_cost)
                
                new_item.save()
                created_bb.append(new_item.itemName)

            except Exception as e:
                error_msg = f"Error creating item {item_data['itemName']}: {str(e)}"
                errors.append(error_msg)
                self.stdout.write(self.style.ERROR(error_msg))

        self.stdout.write(self.style.SUCCESS(f'\nTotal items created: {len(created_bb)}'))
        if errors:
            self.stdout.write(self.style.WARNING(f'\nErrors encountered: {len(errors)}'))
            for error in errors:
                self.stdout.write(self.style.WARNING(error))
