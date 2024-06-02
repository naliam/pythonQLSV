def connect_to_database(self):
    try:
        # Establish a connection to SQL Server
        conn = pyodbc.connect('DRIVER={SQL Server};SERVER=MKLAN;DATABASE=quanlySinhVien')

        # Create a cursor
        cursor = conn.cursor()
        
        return conn, cursor
    except pyodbc.Error as e:
        self.fn_showError("Database Error", f"Error accessing the database: {e}")
        return None, None
