from django.db import models
from django.utils import timezone
import os

class Backup(models.Model):
    """Model to track database backups"""
    filename = models.CharField(max_length=255)
    created_at = models.DateTimeField(default=timezone.now)
    size = models.BigIntegerField()  # Size in bytes
    comment = models.TextField(blank=True, null=True)
    path = models.CharField(max_length=500)
    is_auto = models.BooleanField(default=False)  # Whether it was created automatically
    
    class Meta:
        ordering = ['-created_at']
        
    def __str__(self):
        return f"{self.filename} ({self.created_at.strftime('%Y-%m-%d %H:%M')})"
    
    @property
    def size_formatted(self):
        """Return the size in a human-readable format"""
        units = ['B', 'KB', 'MB', 'GB']
        size = self.size
        unit_index = 0
        
        while size >= 1024 and unit_index < len(units) - 1:
            size /= 1024
            unit_index += 1
            
        return f"{size:.2f} {units[unit_index]}"
    
    def delete(self, *args, **kwargs):
        """Override delete to remove the actual file when model is deleted"""
        # Delete the actual file
        if os.path.exists(self.path):
            try:
                os.remove(self.path)
            except OSError:
                pass  # Log this instead of passing in production
        super().delete(*args, **kwargs)