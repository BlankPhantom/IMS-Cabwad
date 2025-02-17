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
from ims.models import (Item, Classification, Measurement, Section, Purpose,Transaction, TransactionProduct, TransactionDetails, )
                        # Transaction, TransactionProduct, TransactionDetails, RunningBalance, MonthlyConsumption)
from ims.serializers import (UserSerializer,ItemSerializer, ClassificationSerializer, MeasurementSerializer, SectionSerializer, PurposeSerializer,TransactionSerializer, TransactionProductSerializer, TransactionDetailsSerializer) 
            # TransactionSerializer, TransactionProductSerializer, TransactionDetailsSerializer,RunningBalance, MonthlyConsumptionSerializer
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

# start of transaction
@api_view(['GET'])
def get_all_transaction(request):
    transaction = Transaction.objects.all()
    serializer = TransactionSerializer(transaction, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def get_all_transaction_details(request):
    transactionDet = TransactionDetails.objects.all()
    serializer = TransactionSerializer(transactionDet, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def get_all_transaction_product(request):
    transactionProd = TransactionProduct.objects.all()
    serializer = TransactionSerializer(transactionProd, many=True)
    return Response(serializer.data)

@api_view(['POST'])
def transaction_create(request):
    serializer = TransactionSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['PUT'])
def transaction_update(request, id):
    try:
        transaction = Transaction.objects.get(transaction_id=id)
    except Transaction.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    serializer = TransactionSerializer(transaction, data=request.data, partial=True, context={'request': request})
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

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
        transaction_detail = TransactionDetails.objects.get(transaction_detail_id=id)
    except TransactionDetails.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    serializer = TransactionDetailsSerializer(transaction_detail, data=request.data, partial=True, context={'request': request})
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['POST'])
def transaction_product_create(request):
    serializer = TransactionProductSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data, status=status.HTTP_201_CREATED)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['PUT'])
def transaction_product_update(request, id):
    try:
        transaction_product = TransactionProduct.objects.get(transaction_product_id=id)
    except TransactionProduct.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    serializer = TransactionProductSerializer(transaction_product, data=request.data, partial=True, context={'request': request})
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['POST', 'PUT'])
def combined_transaction_view(request, model_name, id=None):
    if model_name == 'transaction':
        if request.method == 'POST':
            return transaction_create(request)
        elif request.method == 'PUT' and id is not None:
            return transaction_update(request, id)
    elif model_name == 'transaction_detail':
        if request.method == 'POST':
            return transaction_detail_create(request)
        elif request.method == 'PUT' and id is not None:
            return transaction_detail_update(request, id)
    elif model_name == 'transaction_product':
        if request.method == 'POST':
            return transaction_product_create(request)
        elif request.method == 'PUT' and id is not None:
            return transaction_product_update(request, id)
    return Response(status=status.HTTP_400_BAD_REQUEST)
# end of transaction