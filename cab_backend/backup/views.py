from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from utils import backup_database, restore_database
import os
class BackupDatabaseView(APIView):
    def get(self, request):
        try:
            backup_file = backup_database()  # Call the backup function
            return Response({"message": "Database backup successful.", "file": backup_file}, status=status.HTTP_200_OK)
        except Exception as e:
            return Response({"error": str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

class RestoreDatabaseView(APIView):
    def post(self, request, *args, **kwargs):
        backup_file = request.FILES.get("backup_file")  # Retrieve the uploaded file
        if not backup_file:
            return Response({"error": "Backup file not provided."}, status=400)

        # Save the file temporarily
        file_path = os.path.join("backups", backup_file.name)
        with open(file_path, "wb") as f:
            for chunk in backup_file.chunks():
                f.write(chunk)

        try:
            # Call the restore function with the saved file path
            restore_database(file_path)
            return Response({"message": "Database restored successfully."}, status=200)
        except Exception as e:
            return Response({"error": str(e)}, status=500)  