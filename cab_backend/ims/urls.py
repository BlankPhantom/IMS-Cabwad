from django.urls import path
from ims import views

urlpatterns = [
    # path('', views.home, name='home'),
    path('item', views.itemApi),
    path('item/<int:id>', views.itemApi),
]