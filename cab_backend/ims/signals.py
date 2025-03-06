from django.db.models.signals import post_save
from django.dispatch import receiver
from django.utils.timezone import now
from django.db.models import Sum
from django.utils import timezone
from .models import TransactionProduct, MonthlyConsumption, MonthlyConsumptionTotal, Item, BeginningBalance

# ✅ Signal to add new items to BeginningBalance automatically
@receiver(post_save, sender=Item)
def add_new_item_to_balance(sender, instance, created, **kwargs):
    if created:  # Only run when a new item is created
        current_month = timezone.now().month
        current_year = timezone.now().year

        # Check if this item already exists in BeginningBalance for this month/year
        if not BeginningBalance.objects.filter(
            itemID=instance.itemID,
            created_at__month=current_month,
            created_at__year=current_year
        ).exists():
            BeginningBalance.objects.create(
                itemID=instance.itemID,
                itemName=instance.itemName,
                measurementID=instance.measurementID,
                itemQuantity=instance.itemQuantity,
                unitCost=instance.unitCost,
                totalCost=instance.totalCost,
                created_at=timezone.now()
            )

@receiver(post_save, sender=TransactionProduct)
def create_monthly_consumption(sender, instance, created, **kwargs):
    if not created:
        return
    try:
        # Get the related item
        item = Item.objects.get(itemID=instance.itemID.itemID)
 
        # Check if the MonthlyConsumption already exists
        if MonthlyConsumption.objects.filter(
            sectionID=instance.transactionDetailsID.sectionID,
            date=instance.transactionDetailsID.date,
            week=instance.transactionDetailsID.week,
            itemID=instance.itemID,
            created_at=instance.created_at
        ).exists():
            print(f"Skipping: MonthlyConsumption already exists for ItemID={instance.itemID}")
            return

        # Create a new MonthlyConsumption entry
        MonthlyConsumption.objects.create(
            transactionProductID=instance,
            sectionID=instance.transactionDetailsID.sectionID or None,
            date=instance.transactionDetailsID.date,
            week=instance.transactionDetailsID.week or 0,
            itemID=instance.itemID,
            itemName=item.itemName,
            consumption=instance.consumption,
            cost=item.unitCost,
            total=instance.consumption * item.unitCost,
            created_at=instance.created_at  # Use TransactionProduct's timestamp
        )
 

        print(f"MonthlyConsumption created for ItemID={instance.itemID}")
 
    except Item.DoesNotExist:
        print(f"Error: Item with itemID={instance.itemID} not found")
    except Exception as e:
        print(f"Error creating MonthlyConsumption: {e}")

@receiver(post_save, sender=TransactionProduct)
def update_monthly_consumption(sender, instance, **kwargs):
    """
    Signal to update existing MonthlyConsumption entries when TransactionProduct is updated.
    This complements the create_monthly_consumption signal which only handles new entries.
    """
    print(f"\n--- DEBUG: update_monthly_consumption signal triggered ---")
    print(f"TransactionProduct ID: {instance.pk}")
    print(f"Created: {kwargs.get('created', False)}")
    
    # Skip if this is a new record (already handled by create_monthly_consumption)
    if kwargs.get('created', False):
        print("This is a new record, skipping (should be handled by create_monthly_consumption)")
        return
    
    print(f"Processing existing TransactionProduct record: {instance}")
    print(f"Item ID: {instance.itemID}")
    print(f"Transaction Details ID: {instance.transactionDetailsID}")
    
    try:
        # Get the related item
        item = Item.objects.get(itemID=instance.itemID.itemID)
        print(f"Found related Item: {item.itemName} (ID: {item.itemID})")
        
        # Log transaction details values
        print(f"Transaction details - Section ID: {instance.transactionDetailsID.sectionID}")
        print(f"Transaction details - Date: {instance.transactionDetailsID.date}")
        print(f"Transaction details - Week: {instance.transactionDetailsID.week}")
        
        # Find the matching MonthlyConsumption entry
        query_params = {
            'sectionID': instance.transactionDetailsID.sectionID,
            'date': instance.transactionDetailsID.date,
            'week': instance.transactionDetailsID.week,
            'itemID': instance.itemID
        }
        print(f"Searching for MonthlyConsumption with params: {query_params}")
        
        monthly_consumption = MonthlyConsumption.objects.filter(
            sectionID=instance.transactionDetailsID.sectionID,
            date=instance.transactionDetailsID.date,
            week=instance.transactionDetailsID.week,
            itemID=instance.itemID
        ).first()
        
        if monthly_consumption:
            print(f"Found existing MonthlyConsumption record ID: {monthly_consumption.pk}")
            print(f"Previous values - Consumption: {monthly_consumption.consumption}, Total: {monthly_consumption.total}")
            
            # Update the record
            monthly_consumption.consumption = instance.consumption
            monthly_consumption.total = instance.consumption * item.unitCost
            monthly_consumption.updated_at = timezone.now()
            
            print(f"Updated values - Consumption: {monthly_consumption.consumption}, Total: {monthly_consumption.total}")
            
            monthly_consumption.save()
            print(f"MonthlyConsumption successfully updated for ItemID={instance.itemID}")
            
            # Make sure totals are recalculated
            print("Calling calculate_totals_for_week_and_month()")
            calculate_totals_for_week_and_month()
        else:
            print(f"No matching MonthlyConsumption record found, creating new one")
            
            # Check for potential None values before creating
            section_id = instance.transactionDetailsID.sectionID
            week = instance.transactionDetailsID.week
            print(f"Creating with - Section ID: {section_id} (None? {section_id is None})")
            print(f"Creating with - Week: {week} (None? {week is None})")
            
            # Create new record
            new_record = MonthlyConsumption.objects.create(
                transactionProductID=instance,
                sectionID=instance.transactionDetailsID.sectionID or None,
                date=instance.transactionDetailsID.date,
                week=instance.transactionDetailsID.week or 0,
                itemID=instance.itemID,
                itemName=item.itemName,
                consumption=instance.consumption,
                cost=item.unitCost,
                total=instance.consumption * item.unitCost,
                created_at=timezone.now()
            )
            
            print(f"New MonthlyConsumption created with ID: {new_record.pk}")
            print(f"MonthlyConsumption created for previously missing ItemID={instance.itemID}")
    
    except Item.DoesNotExist:
        print(f"ERROR: Item with itemID={instance.itemID} not found")
        print(f"Instance itemID value type: {type(instance.itemID)}")
        if hasattr(instance.itemID, 'itemID'):
            print(f"Instance itemID.itemID value: {instance.itemID.itemID}")
    except Exception as e:
        print(f"ERROR updating MonthlyConsumption: {e}")
        import traceback
        traceback.print_exc()
            
# Helper function to get the current week (1-5), month, and year
def get_current_week_month_year():
    today = now().date()
    week_number = (today.day - 1) // 7 + 1  # Week in a month (1 to 5)
    month = today.month
    year = today.year
    return week_number, month, year

# Helper function to calculate totals by sectionID for each week and month
def calculate_totals_for_week_and_month():
    current_week, current_month, current_year = get_current_week_month_year()

    # Map sectionID to model fields
    section_mapping = {
        2: 'totalNSC',
        3: 'totalProd',
        4: 'totalMeterMaintenance',
        5: 'totalSpecialProj',
        6: 'totalConstruction',
        7: 'totalCommercial',
        8: 'totalSales',
        9: 'totalGenService',
    }

    # Initialize totals for each week (1-5)
    weekly_totals = {
        f'{field}{week}': 0 for field in section_mapping.values() for week in range(1, 6)
    }

    # Calculate totals for each week
    for week in range(1, 6):
        # Get consumption totals for each sectionID for the current week and month
        totals = MonthlyConsumption.objects.filter(
            created_at__year=current_year,
            created_at__month=current_month,
            created_at__day__gte=(week - 1) * 7 + 1,
            created_at__day__lte=week * 7
        ).values('sectionID').annotate(total=Sum('total'))

        # Update weekly totals based on query results
        for item in totals:
            section_id = item['sectionID']
            if section_id in section_mapping:
                field_name = f"{section_mapping[section_id]}{week}"
                weekly_totals[field_name] = item['total']

    # Calculate totalConsumption for each week
    for week in range(1, 6):
        weekly_totals[f'totalConsumption{week}'] = sum(
            weekly_totals[f'{field}{week}'] for field in section_mapping.values()
        )

    # Calculate overall totals for the month
    overall_totals = {
        field: sum(weekly_totals[f'{field}{week}'] for week in range(1, 6))
        for field in section_mapping.values()
    }
    overall_totals['totalConsumption'] = sum(overall_totals.values())

    # Combine weekly and overall totals
    totals = {**weekly_totals, **overall_totals}

    # Ensure unique check uses month and year
    monthly_total, created = MonthlyConsumptionTotal.objects.get_or_create(
        created_at__year=current_year,
        created_at__month=current_month,
        defaults=totals
    )

    # If the record already exists, update ALL fields (including weekly and overall totals)
    if not created:
        for field, value in totals.items():
            setattr(monthly_total, field, value)
        monthly_total.updated_at = now()
        monthly_total.save()

    # Debugging information
    print(f"Monthly Total: {monthly_total}, Created: {created}, Week: {current_week}, Month: {current_month}, Year: {current_year}")

# Signal to update or create MonthlyConsumptionTotal when MonthlyConsumption is created
@receiver(post_save, sender=MonthlyConsumption)
def update_monthly_total(sender, instance, **kwargs):
    calculate_totals_for_week_and_month()
