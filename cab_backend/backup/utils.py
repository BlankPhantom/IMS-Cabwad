import os
import mysql.connector
from datetime import datetime
import re
from django.conf import settings
import logging
from django.db import connection

# Set up logging
logger = logging.getLogger(__name__)

def get_db_config():
    """Get database configuration from environment variables or settings"""
    return {
        'host': os.environ.get('DB_HOST', 'localhost'),
        'user': os.environ.get('DB_USER', 'root'),
        'password': os.environ.get('DB_PASSWORD', 'Cloud5024'),
        'database': os.environ.get('DB_NAME', 'ims_cabwad'),
    }

def backup_database():
    # Get database configuration securely
    db_config = get_db_config()
    
    # Validate database configuration
    if not all(db_config.values()):
        raise ValueError("Database configuration is incomplete. Please check environment variables.")
    
    try:
        # Connect to the database
        connection = mysql.connector.connect(**db_config)
        cursor = connection.cursor()

        # Create backup folder if it doesn't exist
        backup_folder = os.path.join(settings.BASE_DIR, 'backups')
        if not os.path.exists(backup_folder):
            os.makedirs(backup_folder)

        # Generate backup file name with secure path handling
        timestamp = datetime.now().strftime('%Y%m%d%H%M%S')
        backup_filename = f"{db_config['database']}_backup_{timestamp}.sql"
        backup_file = os.path.join(backup_folder, backup_filename)

        # Query to get all tables
        cursor.execute("SHOW TABLES")
        tables = cursor.fetchall()

        with open(backup_file, 'w') as f:
            # Add a header with timestamp but no sensitive information
            f.write(f"-- Database backup created on {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
            f.write(f"-- Database: {db_config['database']}\n\n")
            
            for (table_name,) in tables:
                # Validate table name to prevent SQL injection
                if not re.match(r'^[a-zA-Z0-9_]+$', table_name):
                    logger.warning(f"Skipping table with suspicious name: {table_name}")
                    continue
                    
                # Write table schema
                cursor.execute(f"SHOW CREATE TABLE `{table_name}`")
                create_table_query = cursor.fetchone()[1]
                f.write(f"{create_table_query};\n\n")

                # Write table data
                cursor.execute(f"SELECT * FROM `{table_name}`")
                rows = cursor.fetchall()
                
                # Get column information for proper typing
                cursor.execute(f"DESCRIBE `{table_name}`")
                columns = cursor.fetchall()
                
                for row in rows:
                    # Handle different data types properly for SQL syntax
                    values = []
                    for i, value in enumerate(row):
                        if value is None:
                            values.append('NULL')
                        elif isinstance(value, (int, float)):
                            values.append(str(value))
                        elif isinstance(value, (datetime, )):
                            values.append(f"'{value.strftime('%Y-%m-%d %H:%M:%S')}'")
                        else:
                            # Escape string values
                            escaped_value = str(value).replace('\\', '\\\\').replace("'", "\\'")
                            values.append(f"'{escaped_value}'")
                            
                    insert_query = f"INSERT INTO `{table_name}` VALUES ({', '.join(values)});\n"
                    f.write(insert_query)

                f.write("\n")

        logger.info(f"Backup successful! File saved at: {backup_file}")
        return backup_filename  # Return only filename, not full path

    except mysql.connector.Error as e:
        logger.error(f"Database backup error: {str(e)}")
        raise ValueError("Database backup failed")
    finally:
        if 'connection' in locals() and connection.is_connected():
            cursor.close()
            connection.close()


def restore_database(backup_file):
    # Security check: Validate file extension
    if not backup_file.endswith('.sql'):
        raise ValueError("Invalid backup file format. Only .sql files are supported.")
        
    # Get database configuration securely
    db_config = get_db_config()
    
    # Validate database configuration
    if not all(db_config.values()):
        raise ValueError("Database configuration is incomplete. Please check environment variables.")

    try:
        with open(backup_file, "r") as f:
            sql_content = f.read()

        with connection.cursor() as cursor:
            cursor.execute("SET FOREIGN_KEY_CHECKS=0;")

            # Get all table names to truncate
            cursor.execute("SHOW TABLES;")
            tables = cursor.fetchall()

            for (table_name,) in tables:
                try:
                    cursor.execute(f"TRUNCATE TABLE `{table_name}`;")
                except Exception as e:
                    logger.warning(f"Failed to truncate table {table_name}: {e}")

            logger.info("All tables truncated successfully.")

            # Execute restore statements
            statements = sql_content.split(';')
            for statement in statements:
                cleaned_statement = statement.strip()
                if cleaned_statement:
                    try:
                        cursor.execute(cleaned_statement)
                    except Exception as e:
                        logger.warning(f"Error executing statement: {cleaned_statement[:100]}... Error: {e}")

            cursor.execute("SET FOREIGN_KEY_CHECKS=1;")

        logger.info("Database restore completed.")

    except mysql.connector.Error as e:
        logger.error(f"Database restore error: {str(e)}")
        raise ValueError("Database restore failed")
    except Exception as e:
        logger.error(f"Unexpected error during database restore: {str(e)}")
        raise ValueError("Database restore failed due to an unexpected error")
