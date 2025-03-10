from django.db.models.signals import post_save, pre_save
from django.dispatch import receiver
from django.utils.timezone import now
from django.db.models import Sum
from django.utils import timezone
from .models import TransactionDetails, TransactionProduct, MonthlyConsumption, MonthlyConsumptionTotal, Item, BeginningBalance

# Signal to update MonthlyConsumption when TransactionDetails sectionID is updated
@receiver(pre_save, sender=TransactionDetails)
def update_monthly_consumption_section(sender, instance, **kwargs):
    """
    Update the sectionID in MonthlyConsumption when the sectionID in TransactionDetails is updated.
    """
    if not instance.pk:
        # This is a new instance, so no need to update MonthlyConsumption
        return

    try:
        # Get the original instance before the update
        original_instance = TransactionDetails.objects.get(pk=instance.pk)
        
        # Check if the sectionID has changed
        if original_instance.sectionID != instance.sectionID:
            # Update the sectionID in the corresponding MonthlyConsumption entries
            MonthlyConsumption.objects.filter(
                sectionID=original_instance.sectionID,
                date=original_instance.date,
                week=original_instance.week,
                itemID__in=instance.transactionproduct_set.values_list('itemID', flat=True)
            ).update(sectionID=instance.sectionID)
            
            print(f"Updated sectionID from {original_instance.sectionID} to {instance.sectionID} in MonthlyConsumption entries")
    except TransactionDetails.DoesNotExist:
        # The original instance does not exist, so no need to update MonthlyConsumption
        pass
    except Exception as e:
        print(f"Error updating sectionID in MonthlyConsumption: {e}")

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
    # Skip if this is a new record (already handled by create_monthly_consumption)
    if kwargs.get('created', False):
        print("This is a new record, skipping (should be handled by create_monthly_consumption)")
        return
    
    try:
        # Get the related item
        item = Item.objects.get(itemID=instance.itemID.itemID)
        
        # Find the matching MonthlyConsumption entry
        query_params = {
            'sectionID': instance.transactionDetailsID.sectionID,
            'date': instance.transactionDetailsID.date,
            'week': instance.transactionDetailsID.week,
            'itemID': instance.itemID
        }
        
        monthly_consumption = MonthlyConsumption.objects.filter(
            sectionID=instance.transactionDetailsID.sectionID,
            date=instance.transactionDetailsID.date,
            week=instance.transactionDetailsID.week,
            itemID=instance.itemID
        ).first()
        
        if monthly_consumption:
            
            # Update the record
            monthly_consumption.consumption = instance.consumption
            monthly_consumption.total = instance.consumption * item.unitCost
            monthly_consumption.updated_at = timezone.now()
            
            monthly_consumption.save()
            
            # Make sure totals are recalculated
            calculate_totals_for_week_and_month()
        else:
            print(f"No matching MonthlyConsumption record found, creating new one")
            
            # Check for potential None values before creating
            section_id = instance.transactionDetailsID.sectionID
            week = instance.transactionDetailsID.week
            
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
    # Get the current week, month, and year
    _, current_month, current_year = get_current_week_month_year()

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
        # Get consumption totals for each sectionID for the current week
        totals = MonthlyConsumption.objects.filter(
            date__year=current_year,
            date__month=current_month,
            week=week
        ).values('sectionID').annotate(total=Sum('total'))

        # Update weekly totals based on query results
        for item in totals:
            section_id = item['sectionID']
            if section_id in section_mapping:
                field_name = f"{section_mapping[section_id]}{week}"
                weekly_totals[field_name] = item['total'] or 0  # Handle None values

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

    try:
        # Get or create the monthly total record
        monthly_total, created = MonthlyConsumptionTotal.objects.get_or_create(
            created_at__year=current_year,
            created_at__month=current_month,
            defaults=totals
        )

        if not created:
            # Update all fields
            for field, value in totals.items():
                setattr(monthly_total, field, value or 0)  # Handle None values
            monthly_total.updated_at = now()
            monthly_total.save()

        print(f"Successfully updated MonthlyConsumptionTotal for {current_month}/{current_year}")
    except Exception as e:
        print(f"Error updating MonthlyConsumptionTotal: {e}")
        import traceback
        traceback.print_exc()

# Signal to update or create MonthlyConsumptionTotal when MonthlyConsumption is created
@receiver(post_save, sender=MonthlyConsumption)
def update_monthly_total(sender, instance, created, **kwargs):
    """Update MonthlyConsumptionTotal whenever MonthlyConsumption is created or updated"""
    try:
        calculate_totals_for_week_and_month()
    except Exception as e:
        print(f"Error in update_monthly_total signal: {e}")
        import traceback
        traceback.print_exc()