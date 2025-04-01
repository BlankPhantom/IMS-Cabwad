import os
import mysql.connector
from datetime import datetime
import re
from django.conf import settings
import logging
from django.db import connection
from django.contrib.auth.hashers import make_password

# Set up logging
logger = logging.getLogger(__name__)

# def get_db_config():
#     """Get database configuration from environment variables or settings"""
#     return {
#         'host': os.environ.get('DB_HOST', 'imscabwad.mysql.pythonanywhere-services.com'),
#         'user': os.environ.get('DB_USER', 'imscabwad'),
#         'password': os.environ.get('DB_PASSWORD', 'cabwad123'),
#         'database': os.environ.get('DB_NAME', 'ims_cabwad'),
#     }
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

        # Generate a proper hashed password
        default_password = "cabwad123"
        hashed_password = make_password(default_password)

        # Generate backup file name
        timestamp = datetime.now().strftime('%Y%m%d%H%M%S')
        backup_filename = f"{db_config['database']}_backup_{timestamp}.sql"
        backup_file = os.path.join(backup_folder, backup_filename)

        # Query to get all tables
        cursor.execute("SHOW TABLES")
        tables = cursor.fetchall()

        with open(backup_file, 'w') as f:
            # Add header
            f.write(f"-- Database backup created on {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
            f.write(f"-- Database: {db_config['database']}\n")
            f.write(f"-- All user passwords reset to: {default_password}\n\n")
            
            # Add DROP TABLE statements before CREATE statements
            f.write("-- Disable foreign key checks for clean table drops\n")
            f.write("SET FOREIGN_KEY_CHECKS=0;\n\n")
            
            # Write DROP TABLE statements for all tables
            f.write("-- Drop all existing tables\n")
            for (table_name,) in tables:
                if not re.match(r'^[a-zA-Z0-9_]+$', table_name):
                    logger.warning(f"Skipping table with suspicious name: {table_name}")
                    continue
                f.write(f"DROP TABLE IF EXISTS `{table_name}`;\n")
            f.write("\n")
            
            for (table_name,) in tables:
                if not re.match(r'^[a-zA-Z0-9_]+$', table_name):
                    continue
                
                # Write table schema
                cursor.execute(f"SHOW CREATE TABLE `{table_name}`")
                create_table_query = cursor.fetchone()[1]
                f.write(f"{create_table_query};\n\n")

                # Get column information first
                cursor.execute(f"DESCRIBE `{table_name}`")
                columns = cursor.fetchall()
                column_names = [col[0] for col in columns]
                
                # Write table data
                cursor.execute(f"SELECT * FROM `{table_name}`")
                rows = cursor.fetchall()
                
                if rows:
                    # Write column names explicitly for clarity and to prevent column order issues
                    f.write(f"-- Data for table `{table_name}`\n")
                    column_list = ", ".join([f"`{col}`" for col in column_names])
                    
                    for row in rows:
                        row = list(row)  # Convert to list for modification
                        
                        # Handle password replacement for auth_user table
                        if table_name == 'auth_user' and 'password' in column_names:
                            password_index = column_names.index('password')
                            row[password_index] = hashed_password
                        
                        # Handle data types
                        values = []
                        for i, value in enumerate(row):
                            if value is None:
                                values.append('NULL')
                            elif isinstance(value, (int, float)):
                                values.append(str(value))
                            elif isinstance(value, (datetime, )):
                                values.append(f"'{value.strftime('%Y-%m-%d %H:%M:%S')}'")
                            else:
                                escaped_value = str(value).replace('\\', '\\\\').replace("'", "\\'")
                                values.append(f"'{escaped_value}'")
                                
                        insert_query = f"INSERT INTO `{table_name}` ({column_list}) VALUES ({', '.join(values)});\n"
                        f.write(insert_query)

                f.write("\n")
            
            # Re-enable foreign key checks at the end of the restore
            f.write("-- Re-enable foreign key checks after restore is complete\n")
            f.write("SET FOREIGN_KEY_CHECKS=1;\n")

        logger.info(f"Backup successful! File saved at: {backup_file}")
        logger.info(f"All user passwords in backup have been reset to: {default_password}")
        return backup_filename

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
        # Read the backup file
        with open(backup_file, "r") as f:
            sql_content = f.read()

        # Execute the SQL commands directly
        with connection.cursor() as cursor:
            # Split SQL by semicolons but preserve statements with multiple semicolons
            statements = []
            buffer = ""
            
            for line in sql_content.split("\n"):
                line = line.strip()
                # Skip comments
                if line.startswith("--") or not line:
                    continue
                
                buffer += line + " "
                
                if line.endswith(";"):
                    statements.append(buffer)
                    buffer = ""
            
            # Process each statement
            for statement in statements:
                statement = statement.strip()
                if statement:
                    try:
                        cursor.execute(statement)
                        connection.commit()
                    except Exception as e:
                        logger.warning(f"Error executing statement: {statement[:100]}... Error: {e}")
                        # Continue execution despite errors
        
        logger.info("Database restore completed successfully.")
        return True

    except Exception as e:
        logger.error(f"Database restore error: {str(e)}")
        raise ValueError(f"Database restore failed: {str(e)}")


# Function to fix existing backup files that might have column ordering issues
def fix_backup_file(backup_file_path):
    """
    Fix an existing backup file by explicitly including column names in INSERT statements
    """
    try:
        # Read the backup file
        with open(backup_file_path, "r") as f:
            content = f.read()
        
        # Create a new fixed file
        fixed_file_path = backup_file_path.replace('.sql', '_fixed.sql')
        
        # Process the file line by line
        lines = content.split('\n')
        fixed_lines = []
        
        table_name = None
        column_names = []
        
        i = 0
        while i < len(lines):
            line = lines[i]
            
            # Capture CREATE TABLE statements to extract column names
            if line.startswith('CREATE TABLE'):
                # Extract table name
                match = re.search(r'CREATE TABLE `([^`]+)`', line)
                if match:
                    table_name = match.group(1)
                    column_names = []
                    
                    # Collect column definitions
                    j = i + 1
                    while j < len(lines) and not lines[j].startswith(')'):
                        col_match = re.search(r'`([^`]+)`', lines[j])
                        if col_match and '(' not in lines[j] and 'KEY' not in lines[j] and 'CONSTRAINT' not in lines[j]:
                            column_names.append(col_match.group(1))
                        j += 1
                    
                fixed_lines.append(line)
            
            # Fix INSERT statements by adding column names
            elif line.startswith('INSERT INTO') and table_name and column_names:
                # Extract the values part
                match = re.search(r'VALUES\s+\((.*)\);', line)
                if match:
                    values = match.group(1)
                    column_list = ", ".join([f"`{col}`" for col in column_names])
                    fixed_line = f"INSERT INTO `{table_name}` ({column_list}) VALUES ({values});"
                    fixed_lines.append(fixed_line)
                else:
                    fixed_lines.append(line)
            else:
                fixed_lines.append(line)
            
            i += 1
        
        # Write the fixed content
        with open(fixed_file_path, "w") as f:
            f.write('\n'.join(fixed_lines))
        
        logger.info(f"Fixed backup file created at: {fixed_file_path}")
        return fixed_file_path
        
    except Exception as e:
        logger.error(f"Error fixing backup file: {str(e)}")
        raise ValueError(f"Failed to fix backup file: {str(e)}")

# Utility function to analyze a table structure for debugging
def analyze_table_structure(table_name):
    """Get detailed information about a table's structure for debugging"""
    try:
        with connection.cursor() as cursor:
            # Get column definitions
            cursor.execute(f"DESCRIBE `{table_name}`")
            columns = cursor.fetchall()
            
            # Get create table statement
            cursor.execute(f"SHOW CREATE TABLE `{table_name}`")
            create_statement = cursor.fetchone()[1]
            
            # Check for any sample data
            cursor.execute(f"SELECT * FROM `{table_name}` LIMIT 1")
            sample_row = cursor.fetchone()
            
            return {
                "columns": columns,
                "create_statement": create_statement,
                "sample_data": sample_row
            }
    except Exception as e:
        logger.error(f"Error analyzing table structure: {str(e)}")
        return {"error": str(e)}