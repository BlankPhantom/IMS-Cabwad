from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status, permissions
from rest_framework.parsers import MultiPartParser, FormParser
from .utils import backup_database, restore_database
import os
import logging
from django.conf import settings

# Set up logging
logger = logging.getLogger(__name__)

class BackupDatabaseView(APIView):
    # Add authentication and permission checks
    permission_classes = [permissions.IsAdminUser]  # Only allow admin users
    
    def get(self, request):
        try:
            backup_filename = backup_database()  # Call the backup function
            return Response(
                {"message": "Database backup successful.", "file": backup_filename}, 
                status=status.HTTP_200_OK
            )
        except ValueError as e:
            # Log the error but return a generic message
            logger.error(f"Backup error: {str(e)}")
            return Response(
                {"error": "Database backup failed. Please check server logs."}, 
                status=status.HTTP_500_INTERNAL_SERVER_ERROR
            )
        except Exception as e:
            # Log unexpected errors but don't expose details
            logger.error(f"Unexpected error during backup: {str(e)}")
            return Response(
                {"error": "An unexpected error occurred during backup."}, 
                status=status.HTTP_500_INTERNAL_SERVER_ERROR
            )

class RestoreDatabaseView(APIView):
    # Add authentication and permission checks
    permission_classes = [permissions.IsAdminUser]  # Only allow admin users
    # Add parsers for handling file uploads
    parser_classes = [MultiPartParser, FormParser]
    
    def post(self, request, *args, **kwargs):
        backup_file = request.FILES.get("backup_file")  # Retrieve the uploaded file
        
        if not backup_file:
            return Response(
                {"error": "Backup file not provided."}, 
                status=status.HTTP_400_BAD_REQUEST
            )

        # Validate file type
        if not backup_file.name.endswith('.sql'):
            return Response(
                {"error": "Invalid file format. Only .sql files are supported."}, 
                status=status.HTTP_400_BAD_REQUEST
            )
            
        # Validate file size (e.g., max 50MB)
        if backup_file.size > 50 * 1024 * 1024:  # 50MB
            return Response(
                {"error": "File too large. Maximum size is 50MB."}, 
                status=status.HTTP_400_BAD_REQUEST
            )

        # Create a secure filename
        timestamp = os.path.splitext(backup_file.name)[0]
        secure_filename = f"restore_{timestamp}.sql"
        
        # Save the file to a secure location
        backup_folder = os.path.join(settings.BASE_DIR, 'backups')
        if not os.path.exists(backup_folder):
            os.makedirs(backup_folder)
            
        file_path = os.path.join(backup_folder, secure_filename)
        
        # Save the uploaded file
        with open(file_path, "wb") as f:
            for chunk in backup_file.chunks():
                f.write(chunk)

        try:
            # Call the restore function with the saved file path
            restore_database(file_path)
            return Response(
                {"message": "Database restored successfully."}, 
                status=status.HTTP_200_OK
            )
        except ValueError as e:
            # Log the error but return a controlled message
            logger.error(f"Restore error: {str(e)}")
            return Response(
                {"error": "Database restore failed. Please check server logs."}, 
                status=status.HTTP_500_INTERNAL_SERVER_ERROR
            )
        except Exception as e:
            # Log unexpected errors but don't expose details
            logger.error(f"Unexpected error during restore: {str(e)}")
            return Response(
                {"error": "An unexpected error occurred during restore."}, 
                status=status.HTTP_500_INTERNAL_SERVER_ERROR
            )
        finally:
            # Clean up the uploaded file after processing
            if os.path.exists(file_path):
                try:
                    os.remove(file_path)
                except Exception as e:
                    logger.warning(f"Failed to remove temporary file: {str(e)}")