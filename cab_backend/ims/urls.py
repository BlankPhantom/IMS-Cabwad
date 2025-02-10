from django.urls import path
from ims import views

urlpatterns = [
    # path('', views.home, name='home'),
    #
    path('item/', views.item_list_all, name='get-item'),
    path('item/create/', views.item_create, name='create-item'),
    path('item/<str:id>/', views.item_update, name='update-delete-item'),
    path('item/<str:id>/', views.item_delete, name='update-delete-item'),

    path('section/', views.section_list_all, name='get-section'),
    path('purpose/', views.purpose_list_all, name='get-purpose'),
    path('measurement/', views.measurement_list_all, name='get-measurement'),
    path('classification/', views.classification_list_all, name='get-classification'),
]