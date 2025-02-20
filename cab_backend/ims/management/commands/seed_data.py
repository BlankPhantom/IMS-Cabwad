from django.core.management.base import BaseCommand
from ims.models import Classification, Measurement, Section, Purpose, Area
# Transaction, RunningBalance, MonthlyConsumption

class Command(BaseCommand):
    help = 'Seed the database with initial data'

    def handle(self, *args, **kwargs):
        #seed data for classification
        classif = ['Chemicals','Construction','Fittings','Pipes','Water Meters','Other Materials']
        for name in classif:
            Classification.objects.get_or_create(classification=name)

        #seed data for measurement
        measure = ['gal','bag','box','bundle','can','drum','Kgs','Lt','Ltr','mtr','pack','pail','pcs','roll','set',]
        for name in measure:
            Measurement.objects.get_or_create(measureName=name)

        #seed data for section
        section = ['N/A',"NSC","Production","Meter Maintenance","Special Project","Construction","Commercial","Sales","Gen.Services",]
        for name in section:
            Section.objects.get_or_create(sectionName=name)
        
        #seed data for purpose
        purpose = ["N/A","Construction","Disconnection","New Service Connection","Project","Repairs and Maintenance","Transfer,""Defective","Re-connect","Physical Count Adjustment","Sales","Repair of Service Vehicle",]
        for name in purpose:
            Purpose.objects.get_or_create(purposeName=name)

        #seed data for Area
        area = ["N/A","Casile","Diezmo","PS1","PS2","PS3"]
        for name in area:
            Area.objects.get_or_create(areaName=name)

        


