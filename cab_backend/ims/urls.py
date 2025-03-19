from django.urls import path, include
from rest_framework.routers import DefaultRouter
from ims import views
from rest_framework.authtoken.views import obtain_auth_token 

urlpatterns = [
    path('login/', views.login, name='login'),
    path('users/', views.user_list, name='user_list'),
    path('create_user/', views.create_user, name='create_user'),  # Superadmin only
    path('update_user/<int:user_id>/', views.update_user, name='update_user'),  # Superadmin only
    path('update_password/', views.update_own_password, name='update_own_password'),  # User can update own password
    path('delete_user/<int:id>/', views.user_delete, name='delete-user'), # Superadmin only
    

    path('item/create/', views.item_create, name='create-item'),
    path('item/bulk-create/', views.item_bulk_create, name='bulk-create-item'),
    path('item/update/<str:id>/', views.item_update, name='update-item'),
    path('item/delete/<str:id>/', views.item_delete, name='delete-item'),
    path('item/', views.item_list_all, name='get-item'),
    path('item/<str:id>/', views.item_list_detail, name='get-item-detail'),

    path("beginning-bal/", views.get_beginning_bal, name="get-beginning-balance"),
    path('copy-items/', views.copy_items_to_balance, name='copy-items'),
    path('beginning-bal/create/', views.beginning_balance_bulk_create, name='create-beginning-balance'),

    path('run-bal/', views.get_running_balance, name='get-running-balance'),
    path('run-bal/create/', views.create_update_runbal, name='create-running-balance'),

    path('section/', views.section_list_all, name='get-section'),
    path('purpose/', views.purpose_list_all, name='get-purpose'),
    path('measurement/', views.measurement_list_all, name='get-measurement'),
    path('classification/', views.classification_list_all, name='get-classification'),
    path('area/', views.area_list_all, name='area-list-all'),

    path('transaction-detail/', views.get_all_transaction_details, name='create-transaction-detail'),
    path('transaction-product/', views.get_all_transaction_product, name='create-transaction-product'),

    path('transaction-detail/<int:id>/', views.get_transaction_details, name='create-transaction-detail'),
    path('transaction-product/<int:detailID>/<int:id>/', views.get_transaction_product, name='get-transaction-product'),
    
    path('transaction-detail/create/', views.transaction_detail_create, name='create-transaction-detail'),
    path('transaction-product/create/', views.transaction_product_create, name='create-transaction-product'),

    path('transaction-detail/update/<int:id>/', views.transaction_detail_update, name='update-transaction-detail'),
    path('transaction-product/update/<int:detailID>/<int:id>/', views.transaction_product_update, name='update-transaction-product'),

    path('transaction-detail/delete/<int:id>/', views.transaction_detail_delete, name='delete-transaction-detail'),
    path('transaction-product/delete/<int:detailID>/<int:id>/', views.transaction_product_delete, name='delete-transaction-product'),

    path('monthly-consumption/', views.get_monthly_consumption, name="get-monthly-consumption"),
    path('monthly-consumption-total/', views.get_monthly_total, name="get-monthly-total"),

    path('download-report/<int:year>/<int:month>/', views.download_report_doc, name='download-report'),
    
    path('getexcel/', views.xlsm_to_json)
]