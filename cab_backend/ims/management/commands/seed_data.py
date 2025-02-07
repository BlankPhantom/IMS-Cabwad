from django.core.management.base import BaseCommand
from ims.models import Item, Classification, Measurement, Section, Purpose, Transaction, RunningBalance, MonthlyConsumption

class Command(BaseCommand):
    help = 'Seed the database with initial data'

    def handle(self, *args, **kwargs):
        #seed data for classification
        classif = ['Chemicals','Construction','Fittings','Pipes','Water Meters','Other Materials']
        for name in classif:
            Classification.objects.get_or_create(classification=name)

        #seed data for 

