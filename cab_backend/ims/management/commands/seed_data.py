from django.core.management.base import BaseCommand
from ims.models import Item, Classification, Measurement, Section, Purpose, Area
from django.contrib.auth.models import User
import csv
import os
import json
from datetime import datetime
from django.conf import settings

class Command(BaseCommand):
    help = 'Seed the database with initial data'

    def handle(self, *args, **kwargs):
        #admin account
        if not User.objects.filter(username='admin').exists():
            User.objects.create_superuser('admin', 'admin@gmail.com', 'admin')
        
        #seed data for classification
        classif = ['Chemicals','Construction','Fittings','Pipes','Water Meters','Other Materials']
        for name in classif:
            Classification.objects.get_or_create(classification=name)

        #seed data for measurement
        measure = ['N/A','gal','bag','bags','Box','bot','bundle','Can','drum','drums','Kgs','Lt','Ltr','mtr','mtrs','pack','Pail','pc','pcs','roll','set','sets']
        for name in measure:
            Measurement.objects.get_or_create(measureName=name)

        #seed data for section
        section = ['N/A',"NSC","Production","Meter Maintenance","Special Project","Construction","Commercial","Sales","Gen Services",]
        for name in section:
            Section.objects.get_or_create(sectionName=name)
        
        #seed data for purpose
        purpose = ["N/A","Construction","Disconnection","New Service Connection","Project","Repairs and Maintenance","Transfer,""Defective","Re-connect","Physical Count Adjustment","Sales","Repair of Service Vehicle",]
        for name in purpose:
            Purpose.objects.get_or_create(purposeName=name)

        #seed data for Area
        area = [
            "N/A", "Baclaran", "Banaybanay", "Banlic", "Butong", "Bigaa", "Casile", 
            "Gulod", "Mabuhay", "Mamatid", "Marinig", "Niugan", "Pittland", "Pulo", 
            "Sala", "San Isidro", "Diezmo", "Barangay Uno (Pob.)", "Barangay Dos (Pob.)", 
            "Barangay Tres (Pob.)", "PS1", "PS2", "PS3"
        ]
        for name in area:
            Area.objects.get_or_create(areaName=name)