from abc import ABC, abstractmethod
import pyodbc
import sys
sys.stdout.reconfigure(encoding='utf-8')
class SinhVien(ABC):
    def __init__(self):
        self.conn = None
        self.cursor = None

    def connect_to_database(self):
        try:
            # Chuỗi kết nối
            conn_str = (
                'Driver={ODBC Driver 17 for SQL Server};'
                'Server=MKLAN;'
                'Database=quanlySinhVien;'
                'Trusted_Connection=yes;'
            )

            # Thiết lập kết nối tới SQL Server
            self.conn = pyodbc.connect(conn_str)

            # Tạo một cursor
            self.cursor = self.conn.cursor()

        except pyodbc.Error as e:
            self.show_error("Lỗi cơ sở dữ liệu", f"Lỗi truy cập cơ sở dữ liệu: {e}")
            return None, None

    def show_error(self, title, message):
        print(f"{title}: {message}")

    def tim_kiem_sinh_vien_theo_ma_sinh_vien(self, ma_sinh_vien):
        try:
            query = "SELECT * FROM SINHVIEN WHERE MaSINHVIEN = ?"
            self.cursor.execute(query, (ma_sinh_vien,))
            result = self.cursor.fetchone()
            return result
        except pyodbc.Error as e:
            self.show_error("Lỗi truy vấn", f"Lỗi khi tìm kiếm sinh viên: {e}")
            return None

# Bạn có thể thêm các phương thức khác vào đây nếu cần

# Example usage
sinh_vien_manager = SinhVien()
sinh_vien_manager.connect_to_database()
ma_sinh_vien = "SV001"
sinh_vien_info = sinh_vien_manager.tim_kiem_sinh_vien_theo_ma_sinh_vien(ma_sinh_vien)

if sinh_vien_info:
    print("Thông tin sinh viên:")
    print(sinh_vien_info)
else:
    print("Không tìm thấy sinh viên có mã số sinh viên:", ma_sinh_vien)
