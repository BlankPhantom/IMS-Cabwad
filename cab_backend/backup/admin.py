from django.contrib import admin
from .models import Backup

@admin.register(Backup)
class BackupAdmin(admin.ModelAdmin):
    list_display = ('filename', 'created_at', 'size_formatted', 'is_auto', 'comment')
    list_filter = ('created_at', 'is_auto')
    search_fields = ('filename', 'comment')
    readonly_fields = ('filename', 'created_at', 'size', 'path', 'is_auto')
    
    def has_add_permission(self, request):
        # Backups should only be created through the API
        return False