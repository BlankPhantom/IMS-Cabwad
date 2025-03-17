from django.core.management.base import BaseCommand
from ims.models import Measurement,BeginningBalance
import json
import os
from django.conf import settings

class Command(BaseCommand):
    help = 'Seed items from JSON file'

    def handle(self, *args, **kwargs):
        # Path to the JSON file
        json_path = os.path.join(settings.BASE_DIR, 'ims', 'fixtures', 'beginning_data.json')
        
        # Read the JSON file
        with open(json_path, 'r') as file:
            items_data = json.load(file)
        
        # Track created items and any errors
        created_bb = []
        errors = []

        
        # Iterate through the items
        for item_data in items_data:
            
            try:
                measurement = Measurement.objects.get(
                    measureName=item_data['measurementName']
                )

                # Ensure itemQuantity and unitCost are numbers
                item_quantity = float(item_data.get('itemQuantity', 0) or 0)
                unit_cost = float(item_data.get('unitCost', 0) or 0)

                new_item = BeginningBalance(
                    itemID=item_data.get('itemID'),
                    itemName=item_data.get('itemName'),
                    measurementID=measurement,
                    itemQuantity=item_quantity,
                    unitCost=unit_cost,
                    totalCost=item_quantity * unit_cost,  # Computed safely
                )

                # Save the item
                new_item.save()
                created_bb.append(new_item.itemName)

            except Exception as e:
                error_msg = f"Error creating item {item_data['itemName']}: {str(e)}"
                errors.append(error_msg)
                self.stdout.write(self.style.ERROR(error_msg))

        # Summary
        self.stdout.write(self.style.SUCCESS(f'\nTotal items created: {len(created_bb)}'))
        if errors:
            self.stdout.write(self.style.WARNING(f'\nErrors encountered: {len(errors)}'))
            for error in errors:
                self.stdout.write(self.style.WARNING(error))