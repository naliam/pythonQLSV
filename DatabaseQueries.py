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
# CRUD operations for KHOA
# def add_khoa(ma_khoa, ten_khoa, so_dien_thoai):
#     conn, cursor = connect_to_database(show_message)
#     if not conn or not cursor:
#         return
#     query = "INSERT INTO [KHOA] (MaKhoa, TenKhoa, SDT) VALUES (?, ?, ?)"
#     cursor.execute(query, (ma_khoa, ten_khoa, so_dien_thoai))
#     conn.commit()
#     conn.close()
def add_khoa(khoa):
    conn, cursor = connect_to_database(show_message)
    if not conn or not cursor:
        return
    
    query = "INSERT INTO [KHOA] (MaKhoa, TenKhoa, SDT) VALUES (?, ?, ?)"
    cursor.execute(query, (khoa.ma_khoa, khoa.ten_khoa, khoa.so_dien_thoai))
    conn.commit()
    conn.close()

def edit_khoa(ma_khoa, ten_khoa, so_dien_thoai):
    conn, cursor = connect_to_database(show_message)
    if not conn or not cursor:
        return

    query = "UPDATE [KHOA] SET TenKhoa = ?, SDT = ? WHERE MaKhoa = ?"
    cursor.execute(query, (ten_khoa, so_dien_thoai, ma_khoa))
    conn.commit()
    conn.close()

def delete_khoa(ma_khoa):
    conn, cursor = connect_to_database(show_message)
    if not conn or not cursor:
        return
    
    query = "DELETE FROM [KHOA] WHERE MaKhoa = ?"
    cursor.execute(query, (ma_khoa,))
    conn.commit()
    conn.close()

def search_khoa(hoten, maso):
    # Kết nối tới cơ sở dữ liệu
    conn, cursor = connect_to_database(show_message)
    if not conn or not cursor:
        return
    query = f"SELECT * FROM [KHOA] WHERE TenKhoa LIKE ? AND MaKhoa LIKE ?"
    hoten_param = f"%{hoten}%"  # Thêm % vào trước và sau để tìm kiếm theo mẫu
    maso_param = f"%{maso}%"
    cursor.execute(query, (hoten_param, maso_param))
    rows = cursor.fetchall()
    conn.close()

    return rows

# CRUD operations for MONHOC
# def add_khoa(ma_mon_hoc, ten_mon_hoc, so_tiet, ma_khoa):
#     conn, cursor = connect_to_database(show_message)
#     if not conn or not cursor:
#         return
#     query = "INSERT INTO [MONHOC] (MaMonHoc, TenMonHoc, SoTiet, TenKhoa) VALUES (?, ?, ?)"
#     cursor.execute(query, (ma_mon_hoc, ten_mon_hoc, so_tiet, ma_khoa))
#     conn.commit()
#     conn.close()
def search_mon_hoc(monhoc, maso):
    # Kết nối tới cơ sở dữ liệu
    conn, cursor = connect_to_database(show_message)
    if not conn or not cursor:
        return
    query = f"SELECT * FROM [MONHOC] WHERE TenMonHoc LIKE ? AND MaMonHoc LIKE ?"
    ten_mon_param = f"%{monhoc}%"  # Thêm % vào trước và sau để tìm kiếm theo mẫu
    maso_param = f"%{maso}%"
    cursor.execute(query, (ten_mon_param, maso_param))
    rows = cursor.fetchall()
    conn.close()

    return rows

def add_mon_hoc(monhoc):
    conn, cursor = connect_to_database(show_message)
    if not conn or not cursor:
        return

    query = "INSERT INTO [MONHOC] (MaMonHoc, TenMonHoc, SoTiet, TenKhoa) VALUES (?, ?, ?, ?)"
    cursor.execute(query, (monhoc.ma_mon_hoc, monhoc.ten_mon_hoc, monhoc.so_tiet, monhoc.ten_khoa))
    conn.commit()
    conn.close()

def delete_mon_hoc(mamon):
    conn, cursor = connect_to_database(show_message)
    if not conn or not cursor:
        return

    query = "DELETE FROM [MONHOC] WHERE MaMonHoc = ?"
    cursor.execute(query, (mamon,))
    conn.commit()
    conn.close()

# Hiển thị message thông báo
def show_message(title, message):
    # Placeholder for the actual message display function
    print(f"{title}: {message}")