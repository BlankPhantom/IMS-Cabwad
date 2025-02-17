from django.urls import path, include
from rest_framework.routers import DefaultRouter
from ims import views
from rest_framework.authtoken.views import obtain_auth_token 

urlpatterns = [
    path('login/', views.login, name='login'),
    path('create_user/', views.create_user, name='create_user'),
    path('test_token/', views.test_token, name='test_token'),
    path('api-token-auth/', obtain_auth_token, name='api_token_auth'),

    path('item/create/', views.item_create, name='create-item'),
    path('item/update/<str:id>/', views.item_update, name='update-item'),
    path('item/delete/<str:id>/', views.item_delete, name='delete-item'),
    path('item/', views.item_list_all, name='get-item'),
    path('item/<str:id>/', views.item_list_detail, name='get-item-detail'),

    path('section/', views.section_list_all, name='get-section'),
    path('purpose/', views.purpose_list_all, name='get-purpose'),
    path('measurement/', views.measurement_list_all, name='get-measurement'),
    path('classification/', views.classification_list_all, name='get-classification'),
    
    path('transaction-detail/create/', views.transaction_detail_create, name='create-transaction-detail'),
    path('transaction-product/create/', views.transaction_product_create, name='create-transaction-product'),

]