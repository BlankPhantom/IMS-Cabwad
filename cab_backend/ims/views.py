from django.utils import timezone
from django.utils.timezone import now
from django.http import JsonResponse
from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from rest_framework.decorators import api_view, authentication_classes, permission_classes
from rest_framework.authentication import SessionAuthentication, TokenAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework import status
from rest_framework.authtoken.models import Token
from django.contrib.auth.models import User
from django.contrib.auth import authenticate
from ims.models import (Item, BeginningBalance, Classification, Measurement, Section, Purpose, TransactionProduct, TransactionDetails,RunningBalance, Area )
                        # Transaction, TransactionProduct, TransactionDetails, RunningBalance, MonthlyConsumption)
from ims.serializers import (UserSerializer,ItemSerializer, BeginningBalanceSerializer, ClassificationSerializer, MeasurementSerializer, SectionSerializer, PurposeSerializer, TransactionProductSerializer, TransactionDetailsSerializer, RunningBalanceSerializer, AreaSerializer) 
            # TransactionSerializer, TransactionProductSerializer, TransactionDetailsSerializer,RunningBalanceSerializer, MonthlyConsumptionSerializer
import logging

from django.shortcuts import get_object_or_404

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
    beginning_bal = BeginningBalance.objects.all()
    serializer = BeginningBalanceSerializer(beginning_bal, many=True, context={'request': request})
    return Response(serializer.data)

def create_update_runbal(request):
    if request.method == 'POST':
        items = Item.objects.all()
        transaction = TransactionProduct.objects.all()


@csrf_exempt
def copy_items_to_balance(request):
    if request.method == 'POST':
        items = Item.objects.all()

        # Create BeginningBalance entries in bulk
        beginning_balances = [
            BeginningBalance(
                itemID=item.itemID,
                itemName=item.itemName,
                measurementID=item.measurementID,
                itemQuantity=item.itemQuantity,
                unitCost=item.unitCost,
                totalCost=item.totalCost,
                created_at=timezone.now()
            ) for item in items
        ]
        # Bulk insert for efficiency
        BeginningBalance.objects.bulk_create(beginning_balances)
        return JsonResponse({'message': 'Items copied successfully!'}, status=201)
    return JsonResponse({'error': 'Invalid request method'}, status=400)

@api_view(['GET'])
def get_running_balance(request):
    running_bal = RunningBalance.objects.all()
    serializer = RunningBalanceSerializer(running_bal, many=True)
    return Response(serializer.data)

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

@api_view(['POST'])
def transaction_detail_create(request):
    serializer = TransactionDetailsSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
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
    running_balances = RunningBalance.objects.all()
    serializer = RunningBalanceSerializer(running_balances, many=True)
    return Response(serializer.data)

# end of transaction