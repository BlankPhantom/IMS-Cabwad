import os
import mysql.connector
from datetime import datetime

def backup_database():
    # Database configuration
    db_config = {
        'host': 'localhost',
        'user': 'root',
        'password': 'Cloud5024',
        'database': 'ims_cabwad',
    }

    try:
        # Connect to the database
        connection = mysql.connector.connect(**db_config)
        cursor = connection.cursor()

        # Create backup folder if it doesn't exist
        backup_folder = 'backups'
        if not os.path.exists(backup_folder):
            os.makedirs(backup_folder)

        # Generate backup file name
        timestamp = datetime.now().strftime('%Y%m%d%H%M%S')
        backup_file = os.path.join(backup_folder, f"{db_config['database']}_backup_{timestamp}.sql")

        # Query to get all tables
        cursor.execute("SHOW TABLES")
        tables = cursor.fetchall()

        with open(backup_file, 'w') as f:
            for (table_name,) in tables:
                # Write table schema
                cursor.execute(f"SHOW CREATE TABLE {table_name}")
                create_table_query = cursor.fetchone()[1]
                f.write(f"{create_table_query};\n\n")

                # Write table data
                cursor.execute(f"SELECT * FROM {table_name}")
                rows = cursor.fetchall()
                for row in rows:
                    values = ', '.join([f"'{str(value).replace('\'', '\\\'')}'" if value is not None else 'NULL' for value in row])
                    insert_query = f"INSERT INTO {table_name} VALUES ({values});\n"
                    f.write(insert_query)

                f.write("\n")

        print(f"Backup successful! File saved at: {backup_file}")
        return backup_file

    except mysql.connector.Error as e:
        print(f"Error: {e}")
        raise e
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()


def restore_database(backup_file):
    # Database configuration
    db_config = {
        'host': 'localhost',
        'user': 'root',
        'password': '09392660241xolos',
        'database': 'ces_db',
    }

    try:
        # Connect to the database
        connection = mysql.connector.connect(**db_config)
        cursor = connection.cursor()

        # Read the backup file and execute the queries
        with open(backup_file, 'r') as f:
            sql_script = f.read()

        # Split the SQL script into individual statements and execute them
        for statement in sql_script.split(';'):
            if statement.strip():  # Skip empty statements
                cursor.execute(statement)

        connection.commit()
        print("Restore successful!")

    except mysql.connector.Error as e:
        print(f"Error: {e}")
        raise e
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()