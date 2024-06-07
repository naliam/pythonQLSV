import pyodbc
import socket

def connect_to_database(error_handler):
    try:
        # Lấy tên máy chủ hiện tại, dựa theo Window Authen
        server_name = socket.gethostname()

        # Tạo một chuỗi kết nối đến SQL Server
        conn_str = (
                'Driver={ODBC Driver 17 for SQL Server};'
                f'Server={server_name};'
                'Database=quanlySinhVien;'
                'Trusted_Connection=yes;'
            )
        conn = pyodbc.connect(conn_str)

        # Tạo một con trỏ (cursor)
        cursor = conn.cursor()            
        return conn, cursor
    except pyodbc.Error as e:
        # Xử lý lỗi truy vấn cơ sở dữ liệu
        error_handler("Sai thông tin đăng nhập", "Tên đăng nhập hoặc mật khẩu không đúng. Xin hãy thử lại.")
        return None, None

def verify_login(username, password, error_handler):
    # Kết nối đến cơ sở dữ liệu
    conn, cursor = connect_to_database(error_handler)
    if not conn or not cursor:
        return False
    
    try:
        # Truy vấn SQL để kiểm tra đăng nhập
        # Thông tin nằm trong bang NGUOIDUNG: TenDNhap, MatKhau
        query = "SELECT COUNT(*) FROM [NGUOIDUNG] WHERE TenDNhap = ? AND MatKhau = ?"
        cursor.execute(query, (username, password))
        result = cursor.fetchone()
        
        if result and result[0] == 1:
            return True
        else:
            return False
    except pyodbc.Error as e:
        # Xử lý lỗi truy vấn cơ sở dữ liệu
        error_handler("Lỗi truy vấn cơ sở dữ liệu", "Không thể thực hiện truy vấn kiểm tra đăng nhập.")
        return False
    finally:
        # Đóng kết nối và con trỏ (cursor)
        cursor.close()
        conn.close()

def fetch_data_from_sql_server(table_name, condition=None, error_handler=None):
    # Kết nối đến cơ sở dữ liệu
    conn, cursor = connect_to_database(error_handler)
    
    if conn and cursor:
        try:
            # Truy vấn SQL để lấy thông tin
            if condition:
                query = f"SELECT * FROM {table_name} WHERE {condition}"
            else:
                query = f"SELECT * FROM {table_name}"
            cursor.execute(query)

            # Lấy tất cả các hàng dữ liệu
            rows = cursor.fetchall()
            return rows
        except pyodbc.Error as e:
            # Xử lý lỗi truy vấn cơ sở dữ liệu
            error_handler("Lỗi truy vấn cơ sở dữ liệu", "Không thể thực hiện truy vấn này.")
            return False
        finally:
            # Đóng kết nối và con trỏ (cursor)
            cursor.close()
            conn.close()
