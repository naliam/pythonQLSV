import pyodbc
import socket
def connect_to_database():
    try:
        #conn = pyodbc.connect('DRIVER={SQL Server};SERVER=ADMIN-PC;DATABASE=quanlySinhVien; Trusted_Connection=yes')
        
        # Lấy tên máy chủ hiện tại
        server_name = socket.gethostname()

        # Chuỗi kết nối đến SQL Server
        conn_str = (
                'Driver={ODBC Driver 17 for SQL Server};'
                f'Server={server_name};'
                'Database=quanlySinhVien;'
                'Trusted_Connection=yes;'
            )
        conn = pyodbc.connect(conn_str)

        # Create a cursor
        cursor = conn.cursor()            
        return conn, cursor
    except pyodbc.Error as e:
        print(f"Error accessing the database: {e}")
        return None, None

def fetch_data_from_sql_server(table_name, condition=None):
    # Connect to the database
    conn, cursor = connect_to_database()
    
    if conn and cursor:
        try:
            # Execute a query to fetch data from the specified table
            if condition:
                query = f"SELECT * FROM {table_name} WHERE {condition}"
            else:
                query = f"SELECT * FROM {table_name}"
            cursor.execute(query)

            # Fetch all rows
            rows = cursor.fetchall()
            return rows
        except pyodbc.Error as e:
            print(f"Error fetching data from the database: {e}")
            return None
        finally:
            # Close cursor and connection
            cursor.close()
            conn.close()

