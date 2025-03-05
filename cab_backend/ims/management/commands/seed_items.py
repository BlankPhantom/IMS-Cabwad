from django.core.management.base import BaseCommand
from ims.models import Item, Classification, Measurement
import json
import os
from django.conf import settings

class Command(BaseCommand):
    help = 'Seed items from JSON file'

    def handle(self, *args, **kwargs):
        # Path to the JSON file
        json_path = os.path.join(settings.BASE_DIR, 'ims', 'fixtures', 'items_data.json')
        
        # Read the JSON file
        with open(json_path, 'r') as file:
            items_data = json.load(file)
        
        # Track created items and any errors
        created_items = []
        errors = []

        # Iterate through the items
        for item_data in items_data:
            try:
                # Find the Classification
                classification = Classification.objects.get(
                    classification=item_data['classificationName']
                )

                # Find the Measurement
                measurement = Measurement.objects.get(
                    measureName=item_data['measurementName']
                )

                # Check if itemName and itemID exist in the data
                itemName = item_data.get('itemName')

                if not itemName:
                    raise Exception("Missing required fields: itemName or itemID")
                # Check if item doesn't already exist
                if Item.objects.filter(itemName=itemName):
                    raise Exception(f"Item with name {itemName} already exists")

                new_item = Item(
                    classificationID=classification,
                    measurementID=measurement,
                    itemName=itemName,
                )

                # Save the item
                new_item.save()
                created_items.append(new_item.itemName)
                self.stdout.write(self.style.SUCCESS(f'Successfully created item: {new_item.itemName}'))
            
            except Classification.DoesNotExist:
                error_msg = f"Classification not found for: {item_data['classificationName']}"
                errors.append(error_msg)
                self.stdout.write(self.style.ERROR(error_msg))
            
            except Measurement.DoesNotExist:
                error_msg = f"Measurement not found for: {item_data['measurementName']}"
                errors.append(error_msg)
                self.stdout.write(self.style.ERROR(error_msg))
            
            except Exception as e:
                error_msg = f"Error creating item {item_data['itemName']}: {str(e)}"
                errors.append(error_msg)
                self.stdout.write(self.style.ERROR(error_msg))
        
        # Summary
        self.stdout.write(self.style.SUCCESS(f'\nTotal items created: {len(created_items)}'))
        if errors:
            self.stdout.write(self.style.WARNING(f'\nErrors encountered: {len(errors)}'))
            for error in errors:
                self.stdout.write(self.style.WARNING(error))