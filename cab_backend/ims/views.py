from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from rest_framework.parsers import JSONParser
from django.http.response import JsonResponse

from ims.models import Item, Classification, Measurement, Section, Purpose, Transaction, RunningBalance, MonthlyConsumption
from ims.serializers import ItemSerializer, ClassificationSerializer, MeasurementSerializer, SectionSerializer, PurposeSerializer, TransactionSerializer,RunningBalance, MonthlyConsumptionSerializer

@csrf_exempt
def itemApi(request,id=0):
    if request.method=='GET':
        items = Item.objects.all()
        items_serializer=ItemSerializer(items,many=True)
        return JsonResponse(items_serializer.data,safe=False)
    
    elif request.method=='POST':
        item_data=JSONParser().parse(request)
        items_serializer=ItemSerializer(data=item_data)
        if items_serializer.is_valid():
            items_serializer.save()
            return JsonResponse("Added Successfully",safe=False)
        return JsonResponse("Failed to Add",safe=False)
    
    elif request.method=='PUT':
        item_data=JSONParser().parse(request)
        item=Item.objects.get(ItemID=item_data['ItemID'])
        items_serializer=ItemSerializer(item, data=item_data)
        if items_serializer.is_valid():
            items_serializer.save()
            return JsonResponse("Update Successfully", safe=False)
        return JsonResponse("Failed to Update")
    
    elif request.method=='DELETE':
        item=Item.objects.get(ItemID=id)
        item.delete()
        return JsonResponse("Deleted Successfully", safe=False)