from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from rest_framework.parsers import JSONParser
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status
from ims.models import Item, Classification, Measurement, Section, Purpose, Transaction, RunningBalance, MonthlyConsumption
from ims.serializers import ItemSerializer, ClassificationSerializer, MeasurementSerializer, SectionSerializer, PurposeSerializer, TransactionSerializer,RunningBalance, MonthlyConsumptionSerializer

@csrf_exempt
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
def item_list_all(request):
    items = Item.objects.all()
    serializer = ItemSerializer(items, many=True, context={'request': request})
    return Response(serializer.data)

@api_view(['GET'])
def item_list_detail(request, id):
    try:
        items = Item.objects.get(itemID=id)
    except Item.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    
    serializer = ItemSerializer(items, many=True, context={'request': request})
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
        items = Item.objects.get(itemID=id)
    except Item.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    
    serializer = ItemSerializer(items, data=request.data)
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