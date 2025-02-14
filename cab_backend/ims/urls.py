from django.urls import path, re_path
from ims import views
from rest_framework.authtoken.views import obtain_auth_token 

urlpatterns = [
    re_path('login/', views.login, name='login'),
    re_path('create_user/', views.create_user, name='create_user'),
    re_path('test_token/', views.test_token, name='test_token'),
    path('api-token-auth/', obtain_auth_token, name='api_token_auth'),

    path('item/', views.item_list_all, name='get-item'),
    path('item/<str:id>/', views.item_list_detail, name='get-item-detail'),
    path('item/create/', views.item_create, name='create-item'),
    path('item/update/<str:id>/', views.item_update, name='update-item'),
    path('item/delete/<str:id>/', views.item_delete, name='delete-item'),

    path('section/', views.section_list_all, name='get-section'),
    path('purpose/', views.purpose_list_all, name='get-purpose'),
    path('measurement/', views.measurement_list_all, name='get-measurement'),
    path('classification/', views.classification_list_all, name='get-classification'),
]