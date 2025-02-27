from django.utils import timezone
from django.utils.timezone import now
from django.http import JsonResponse
from django.db.models import Sum
from django.views.decorators.csrf import csrf_exempt
from rest_framework.decorators import api_view, authentication_classes, permission_classes
from rest_framework.authentication import SessionAuthentication, TokenAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework import status
from rest_framework.authtoken.models import Token
from django.contrib.auth.models import User
from django.contrib.auth import authenticate
import pandas as pd
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.core.files.storage import default_storage
from ims.models import (Item, BeginningBalance, Classification, Measurement, Section, Purpose, TransactionProduct, 
                        TransactionDetails,RunningBalance, Area, MonthlyConsumption, MonthlyConsumptionTotal )                     
from ims.serializers import (ItemListSerializer, UserSerializer,ItemSerializer, BeginningBalanceSerializer, ClassificationSerializer, MeasurementSerializer, 
                             SectionSerializer, PurposeSerializer, TransactionProductSerializer, TransactionDetailsSerializer, 
                             RunningBalanceSerializer, AreaSerializer, MonthlyConsumptionTotalSerializer, MonthlyConsumptionSerializer) 

@api_view(['GET'])
def item_list_all(request):
    items = Item.objects.all()
    serializer = ItemSerializer(items, many=True, context={'request': request})
    return Response(serializer.data)

@api_view(['GET'])
def item_list_detail(request, id):
    try:
        item = Item.objects.get(itemID=id)
    except Item.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    
    serializer = ItemSerializer(item, context={'request': request})
    return Response(serializer.data)


@api_view(['POST'])
def item_create(request):
    serializer = ItemSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['POST'])
def item_bulk_create(request):
    if request.method == 'POST':
        items_data = request.data
        created_items = []
        errors = []

        for item_data in items_data:
            item_id = item_data.get('itemID')
            if Item.objects.filter(itemID=item_id).exists():
                continue  # Skip existing items

            serializer = ItemSerializer(data=item_data)
            if serializer.is_valid():
                serializer.save()
                created_items.append(serializer.data)
            else:
                errors.append(serializer.errors)

        if errors:
            return Response({"created_items": created_items, "errors": errors}, status=status.HTTP_207_MULTI_STATUS)
        return Response(created_items, status=status.HTTP_201_CREATED)

@api_view(['PUT'])
def item_update(request, id):
    try:
        item = Item.objects.get(itemID=id)
    except Item.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    
    serializer = ItemSerializer(item, data=request.data, partial=True, context={'request': request})
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['DELETE'])
def item_delete(request, id):    
    try:
        items = Item.objects.get(itemID=id)
    except Item.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    
    items.delete()
    return Response(status=status.HTTP_204_NO_CONTENT)
            
@api_view(['GET'])
def get_beginning_bal(request):
    month = request.query_params.get('month')
    year = request.query_params.get('year')

    beginning_bal = BeginningBalance.objects.all()

    if month:
        beginning_bal = beginning_bal.filter(created_at__month=month)
    if year:
        beginning_bal = beginning_bal.filter(created_at__year=year)
    
    serializer = BeginningBalanceSerializer(beginning_bal, many=True)
    return Response(serializer.data)

@csrf_exempt
def copy_items_to_balance(request):
    if request.method == 'POST':
        current_month = timezone.now().month
        current_year = timezone.now().year

        # Check if BeginningBalance entries for the current month and year already exist
        if BeginningBalance.objects.filter(created_at__month=current_month, created_at__year=current_year).exists():
            return JsonResponse({'error': 'Items have already been copied for this month'}, status=400)

        items = Item.objects.all()

        # Create BeginningBalance entries in bulk
        beginning_balances = [
            BeginningBalance(
                itemID=item.itemID,
                itemName=item.itemName,
                measurementID=item.measurementID,
                itemQuantity=item.itemQuantity,
                unitCost=item.unitCost,
                totalCost=item.itemQuantity * item.unitCost,
                created_at=timezone.now()
            ) for item in items
        ]

        # Bulk insert for efficiency
        BeginningBalance.objects.bulk_create(beginning_balances)

        return JsonResponse({'message': 'Items copied successfully!'}, status=201)

    return JsonResponse({'error': 'Invalid request method'}, status=400)

@api_view(['POST'])
def login(request):
    username = request.data.get("username")
    password = request.data.get("password")

    user = authenticate(username=username, password=password)  # 🔥 Secure authentication

    if user:
        token, created = Token.objects.get_or_create(user=user)
        serializer = UserSerializer(user)
        return Response({"token": token.key, "user": serializer.data}, status=status.HTTP_200_OK)
    
    return Response({"error": "Invalid credentials"}, status=status.HTTP_401_UNAUTHORIZED)

@api_view(['POST'])
def create_user(request):
    serializer = UserSerializer(data=request.data)
    if serializer.is_valid():
        user = User(
            username=serializer.validated_data['username'],
            email=serializer.validated_data['email'],
            # Add other fields if necessary
        )
        user.set_password(request.data['password'])
        user.save()

        token, created = Token.objects.get_or_create(user=user)
        return Response({'token': token.key, 'user': serializer.data}, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

#test authentication token
@api_view(['GET'])
@authentication_classes([SessionAuthentication, TokenAuthentication])
@permission_classes([IsAuthenticated])
def test_token(request):
    return Response("passed! for {}".format(request.user.email), status=status.HTTP_200_OK)

@api_view(['GET'])
def classification_list_all(request):
    classifications = Classification.objects.all()
    serializer = ClassificationSerializer(classifications, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def measurement_list_all(request):
    measurements = Measurement.objects.all()
    serializer = MeasurementSerializer(measurements, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def section_list_all(request):
    sections = Section.objects.all()
    serializer = SectionSerializer(sections, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def purpose_list_all(request):
    purposes = Purpose.objects.all()
    serializer = PurposeSerializer(purposes, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def area_list_all(request):
    area = Area.objects.all()
    serializer = AreaSerializer(area, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def get_all_transaction_details(request):
    transactionDet = TransactionDetails.objects.all()
    serializer = TransactionDetailsSerializer(transactionDet, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def get_transaction_details(request,id):
    try:
        transactionDet = TransactionDetails.objects.get(transactionDetailsID=id)
    except TransactionDetails.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    
    serializer = TransactionDetailsSerializer(transactionDet, context={'request': request})
    return Response(serializer.data)

@api_view(['GET'])
def get_all_transaction_product(request):
    transactionProd = TransactionProduct.objects.all()
    serializer = TransactionProductSerializer(transactionProd, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def get_transaction_product(request, id, detailID):
    try:
        transactionProd = TransactionProduct.objects.get(transactionDetailsID_id=detailID, transactionProductID = id)
    except TransactionProduct.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    
    serializer = TransactionProductSerializer(transactionProd, context={'request': request})
    return Response(serializer.data)

def calculate_week(date_str):
    today = now().date()
    week_number = (today.day - 1) // 7 + 1 
    return int(week_number)

@api_view(['POST'])
def transaction_detail_create(request):
    if request.method == 'POST':
        serializer = TransactionDetailsSerializer(data=request.data)
        if serializer.is_valid():
            transaction_details = serializer.save()
            transaction_details.week = calculate_week(transaction_details.date)
            transaction_details.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['PUT'])
def transaction_detail_update(request, id):
    try:
        transactionDet = TransactionDetails.objects.get(transactionDetailsID=id)
    except TransactionDetails.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    serializer = TransactionDetailsSerializer(transactionDet, data=request.data, partial=True, context={'request': request})
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['DELETE'])
def transaction_detail_delete(request, id):
    try:
        transactionDet = TransactionDetails.objects.get(transactionDetailsID=id)
    except TransactionDetails.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    transactionDet.delete()
    return Response(status=status.HTTP_204_NO_CONTENT)

@api_view(['POST'])
def transaction_product_create(request):
    serializer = TransactionProductSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['PUT'])
def transaction_product_update(request, id, detailID):
    try:
        transactionProd = TransactionProduct.objects.get(transactionProductID=id, transactionDetailsID_id = detailID)
        
    except TransactionProduct.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    serializer = TransactionProductSerializer(transactionProd, data=request.data, partial=True, context={'request': request})
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['DELETE'])
def transaction_product_delete(request, id, detailID):
    try:
        transactionProd = TransactionProduct.objects.get(transactionProductID=id, transactionDetailsID_id = detailID)
    except TransactionDetails.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    transactionProd.delete()
    return Response(status=status.HTTP_204_NO_CONTENT)

@api_view(['GET'])
def get_running_balance(request):
    month = request.query_params.get('month')
    year = request.query_params.get('year')

    running_balances = RunningBalance.objects.all()

    if month:
        running_balances = running_balances.filter(created_at__month=month)
    if year:
        running_balances = running_balances.filter(created_at__year=year)

    serializer = RunningBalanceSerializer(running_balances, many=True)
    return Response(serializer.data)

@csrf_exempt
@api_view(['POST'])
def create_update_runbal(request):
    if request.method == 'POST':
        current_month = timezone.now().month
        current_year = timezone.now().year

        # Get all items
        items = Item.objects.all()

        for item in items:
            transactions = TransactionProduct.objects.filter(itemID=item.itemID)
            sums = transactions.aggregate(
                purchasedFromSupp_sum=Sum('purchasedFromSupp'),
                returnToSupplier_sum=Sum('returnToSupplier'),
                transferFromWH_sum=Sum('transferFromWH'),
                transferToWH_sum=Sum('transferToWH'),
                issuedQty_sum=Sum('issuedQty'),
                returnedQty_sum=Sum('returnedQty'),
                consumption_sum=Sum('consumption'),
            )

            # Check if there is an existing RunningBalance entry for the current month and year
            running_balance, created = RunningBalance.objects.get_or_create(
                itemID=item,
                created_at__month=current_month,
                created_at__year=current_year,
                defaults={
                    'itemName': item.itemName,
                    'measurementID': item.measurementID,
                    'itemQuantity': item.itemQuantity,
                    'unitCost': item.unitCost,
                    'beginningBalance': 0,  # This will be updated below if it is a new month
                    'purchasedFromSupp': 0,
                    'returnToSupplier': 0,
                    'transferFromWH': 0,
                    'transferToWH': 0,
                    'issuedQty': 0,
                    'returnedQty': 0,
                    'consumption': 0,
                    'totalCost': 0,
                }
            )

            if created:
                # Calculate the previous month and year
                if current_month == 1:
                    last_month = 12
                    last_year = current_year - 1
                else:
                    last_month = current_month - 1
                    last_year = current_year

                # Fetch the itemQuantity from the previous month in the BeginningBalance model
                last_month_bb = BeginningBalance.objects.filter(
                    itemID=item.itemID, 
                    created_at__month=last_month,
                    created_at__year=last_year
                ).order_by('-created_at').first()

                if last_month_bb:
                    running_balance.beginningBalance = last_month_bb.itemQuantity
                else:
                    running_balance.beginningBalance = 0
            else:
                # If updating an existing entry, set the aggregated sums
                running_balance.purchasedFromSupp = sums['purchasedFromSupp_sum'] or 0
                running_balance.returnToSupplier = sums['returnToSupplier_sum'] or 0
                running_balance.transferFromWH = sums['transferFromWH_sum'] or 0
                running_balance.transferToWH = sums['transferToWH_sum'] or 0
                running_balance.issuedQty = sums['issuedQty_sum'] or 0
                running_balance.returnedQty = sums['returnedQty_sum'] or 0
                running_balance.consumption = sums['consumption_sum'] or 0

            # Update the totalCost based on unitCost and itemQuantity
            running_balance.totalCost = running_balance.unitCost * running_balance.itemQuantity
            running_balance.save()

        return Response({"detail": "Running balance processed successfully."})

@api_view(['GET'])
def get_monthly_consumption(request):
    # Get query parameters
    month = request.query_params.get('month')
    year = request.query_params.get('year')
    section_id = request.query_params.get('sectionID')

    # Filter MonthlyConsumption based on the provided parameters
    monthly_consumption = MonthlyConsumption.objects.all()

    if month:
        monthly_consumption = monthly_consumption.filter(date__month=month)
    if year:
        monthly_consumption = monthly_consumption.filter(date__year=year)
    if section_id:
        monthly_consumption = monthly_consumption.filter(sectionID=section_id)

    # Serialize the filtered data
    serializer = MonthlyConsumptionSerializer(monthly_consumption, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def get_monthly_total(request):
    monthly_total = MonthlyConsumptionTotal.objects.all()
    serializer = MonthlyConsumptionTotalSerializer(monthly_total, many=True)
    return Response(serializer.data)

@csrf_exempt  # Remove in production; use proper authentication
def xlsm_to_json(request):
    if request.method == "POST" and request.FILES.get("file"):
        excel_file = request.FILES["file"]
        sheet_name = request.POST.get("sheet_name", "Masterlist")  # Default to "Sheet1"
        additional_sheet_name = request.POST.get("additional_sheet", "Beginning Balance")
        
        # Save file temporarily, overwrite if exists
        file_path = default_storage.save(f"temp/{excel_file.name}", excel_file)
        if default_storage.exists(file_path):
            default_storage.delete(file_path)
        file_path = default_storage.save(f"temp/{excel_file.name}", excel_file)

        try:
            # Read the specified sheet from the .xlsm file
            df = pd.read_excel(file_path, sheet_name=sheet_name, engine="openpyxl")
            df_additional = pd.read_excel(file_path, sheet_name=additional_sheet_name, engine="openpyxl") 
            
            column_mapping = {
                "PRODUCT NAME": "itemName",
                "CLASSIFICATION": "classificationName"
            } 
            
            # Specify the columns you want to extract
            selected_columns = ["PRODUCT NAME", "CLASSIFICATION"]
            df_selected = df[selected_columns].rename(columns=column_mapping)

            additional_col_map = {
                "PRODUCT NAME": "itemName", 
                "UNIT OF MEASURE": "measurementName"
            }
            # Extract Unit of Measurement from the additional sheet
            additional_columns = ["PRODUCT NAME", "UNIT OF MEASURE"]
            df_additional_selected = df_additional[additional_columns].rename(columns=additional_col_map)

            # Merge the dataframes on "itemName"
            df_merged = pd.merge(df_selected, df_additional_selected, on="itemName", how="left")

            # Trim whitespace from string columns
            df_merged = df_merged.applymap(lambda x: x.strip() if isinstance(x, str) else x)

            # Replace NaN with None (which becomes null in JSON)
            df_merged = df_merged.where(pd.notnull(df_merged), "N/A")

            # Convert to JSON
            json_data = df_merged.to_dict(orient="records")

            response = JsonResponse(json_data, safe=False)
            default_storage.delete(file_path)
            return response
                

        except ValueError as ve:
            return JsonResponse({"error": f"Sheet '{sheet_name}' not found"}, status=400)
        except KeyError as ke:
            return JsonResponse({"error": f"Missing columns: {ke}"}, status=400)
        except Exception as e:
            return JsonResponse({"error": str(e)}, status=500)

    return JsonResponse({"error": "Invalid request"}, status=400)
# end of transaction

from django.http import HttpResponse
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from .utils import generate_reports_doc, convert_docx_to_pdf # Assuming the function is in a utils.py file
import os
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.http import HttpResponse
from ims.models import MonthlyConsumptionTotal
import os

@csrf_exempt
@api_view(['GET'])
def download_report_doc(request, year, month):
    try:
        # Query the report by year and month
        report = MonthlyConsumptionTotal.objects.get(updated_at__year=year, updated_at__month=month)
    except MonthlyConsumptionTotal.DoesNotExist:
        return Response({"error": "Report not found for the specified year and month"}, status=404)
    
    # Generate the DOCX report
    doc_path = generate_reports_doc(report)
    
    # Convert the DOCX to PDF
    pdf_path = convert_docx_to_pdf(doc_path)
    
    # Serve the PDF file for download
    if os.path.exists(pdf_path):
        with open(pdf_path, 'rb') as pdf_file:
            response = HttpResponse(pdf_file.read(), content_type='application/pdf')
            response['Content-Disposition'] = f'attachment; filename="report_{year}_{month}.pdf"'
            response['Cache-Control'] = 'no-cache, no-store, must-revalidate'
            response['Pragma'] = 'no-cache'
            response['Expires'] = '0'
            
            return response
    else:
        return Response({"error": "Document generation failed"}, status=500)


