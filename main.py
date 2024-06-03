import sys
import os
import pyodbc
import configparser
from PyQt6.QtWidgets import QApplication, QMainWindow, QMessageBox
from PyQt6 import QtWidgets
from ui_login import Ui_windowUI_login
from ui_main import Ui_windowUI_main
import sqlite3

class MainWindow:
    def __init__(self):
        self.login_win = QMainWindow()
        self.uic = Ui_windowUI_login()
        self.uic.setupUi(self.login_win)

        # Load saved credentials if they exist
        self.load_saved_credentials()

        #Khai báo các nút tác vụ
        self.uic.pushButton_close.clicked.connect(self.login_win.close)
        self.uic.pushButton_max.clicked.connect(self.login_win.showMaximized)
        self.uic.pushButton_minimize.clicked.connect(self.login_win.showMinimized)
        
        #Khai báo nút nhấn login ra màn hình thứ 2
        #self.uic.pushButton_login.clicked.connect(self.fn_openMainWindow)
        self.uic.pushButton_login.clicked.connect(self.fn_cloudConnect)

        self.uic.pushButton_forgot.clicked.connect(self.fn_forgotPassword)
        self.uic.checkBox_remember.clicked.connect(self.fn_rememberPassword)

    def fn_openMainWindow(self, textID):
        #Lệnh mở màn hình thứ hai
        self.second_window = QtWidgets.QMainWindow()
        self.uic2 = Ui_windowUI_main()
        self.uic2.setupUi(self.second_window)
        self.second_window.show()

        #Lấy thông tin người dùng đăng nhập
        self.uic2.lab_user_2.setText(textID)

        #Khai báo các nút tác vụ
        self.uic2.pushButton_close.clicked.connect(self.second_window.close)
        self.uic2.pushButton_max.clicked.connect(self.second_window.showMaximized)
        self.uic2.pushButton_minimize.clicked.connect(self.second_window.showMinimized)

        #Khai báo các nút hiện page
        self.uic2.pushButton_home.clicked.connect(self.fn_showpage_1_Home)
        self.uic2.pushButton_sinhvien.clicked.connect(self.fn_showpage_2_QLSinhVien)
        self.uic2.pushButton_giangvien.clicked.connect(self.fn_showpage_3_QLGiangVien)
        self.uic2.pushButton_lop.clicked.connect(self.fn_showpage_4_QLLop)
        self.uic2.pushButton_khoa.clicked.connect(self.fn_showpage_5_QLKhoa)
        self.uic2.pushButton_monhoc.clicked.connect(self.fn_showpage_6_QLMonHoc)

    def fn_forgotPassword(self):
        msg = QMessageBox()
        msg.setIcon(QMessageBox.Icon.Information)
        msg.setWindowTitle("Quên mật khẩu")
        msg.setText("Hãy liên hệ với người quản trị để giải quyết.")
        msg.setStandardButtons(QMessageBox.StandardButton.Ok)
        msg.exec()

    def fn_rememberPassword(self):
        textID = self.uic.lineEdit_username.text()
        textPASSWORD = self.uic.lineEdit_password.text()
        config = configparser.ConfigParser()
        config['CREDENTIALS'] = {'username': textID, 'password': textPASSWORD}
        with open('credentials.ini', 'w') as configfile:
            config.write(configfile)

    def load_saved_credentials(self):
        config = configparser.ConfigParser()
        if os.path.exists('credentials.ini'):
            config.read('credentials.ini')
            if 'CREDENTIALS' in config:
                self.uic.lineEdit_username.setText(config['CREDENTIALS']['username'])
                self.uic.lineEdit_password.setText(config['CREDENTIALS']['password'])
                #self.uic.checkBox_remember.setChecked(True)

    def fn_showError(self, title, message):
        msg = QMessageBox()
        msg.setIcon(QMessageBox.Icon.Critical)
        msg.setWindowTitle(title)
        msg.setText(message)
        msg.setStandardButtons(QMessageBox.StandardButton.Retry)
        msg.exec()

    def fn_showpage_1_Home(self):
        self.uic2.stackedWidget.setCurrentWidget(self.uic2.page_1_Home)

    def fn_showpage_2_QLSinhVien(self):
        self.uic2.stackedWidget.setCurrentWidget(self.uic2.page_2_QLSinhVien)   
        self.fetch_data_from_sql_server('SINHVIEN')
    def fn_showpage_3_QLGiangVien(self):
        self.uic2.stackedWidget.setCurrentWidget(self.uic2.page_3_QLGiangVien)
        self.fetch_data_from_sql_server('GIANGVIEN')
    def fn_showpage_4_QLLop(self):
        self.uic2.stackedWidget.setCurrentWidget(self.uic2.page_4_QLLop)
        self.fetch_data_from_sql_server('LOP')
    def fn_showpage_5_QLKhoa(self):
        self.uic2.stackedWidget.setCurrentWidget(self.uic2.page_4_QLKhoa)
        self.fetch_data_from_sql_server('KHOA')
    def fn_showpage_6_QLMonHoc(self):
        self.uic2.stackedWidget.setCurrentWidget(self.uic2.page_4_QLMonHoc)
        self.fetch_data_from_sql_server('MONHOC')
    def show(self):
        self.login_win.show()

    
    def fn_cloudConnect(self):
        textID = self.uic.lineEdit_username.text()
        textPASSWORD = self.uic.lineEdit_password.text()
        if textID=='linhlan' and textPASSWORD=='2324':
            self.uic.lineEdit_username.setText("")
            self.uic.lineEdit_password.setText("")
            self.fn_openMainWindow(textID)  # Open the main window if credentials are correct
            self.login_win.close()
        else:
            self.fn_showError("Sai thông tin đăng nhập", "Tên đăng nhập hoặc mật khẩu không đúng. Xin hãy thử lại.")

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
       
    def fetch_data_from_sql_server(self, table_name):
        # Connect to the database
        conn, cursor = self.connect_to_database()
        
        if conn and cursor:
            try:
                # Execute a query to fetch data from the specified table
                cursor.execute(f"SELECT * FROM {table_name}")

                # Fetch all rows
                rows = cursor.fetchall()

                # Display data in the table widget
                if table_name == 'SINHVIEN':
                    self.display_data_in_table(rows, self.uic2.tableWidget_QLSinhVien)
                if table_name == 'GIANGVIEN':
                    self.display_data_in_table(rows, self.uic2.tableWidget_QLGiangVien)
                if table_name == 'LOP':
                    self.display_data_in_table(rows, self.uic2.tableWidget_QLLop)
                if table_name == 'KHOA':
                    self.display_data_in_table(rows, self.uic2.tableWidget_QLKhoa)
                if table_name == 'MONHOC':
                    self.display_data_in_table(rows, self.uic2.tableWidget_QLMonHoc)

                # Close cursor and connection
                cursor.close()
                conn.close()
            except pyodbc.Error as e:
                self.fn_showError("Database Error", f"Error accessing the database: {e}")

    def display_data_in_table(self, data, table_widget):
        # Clear existing data in the table widget
        table_widget.clearContents()
        table_widget.setRowCount(0)

        # Populate data into the table widget
        for row_number, row_data in enumerate(data):
            table_widget.insertRow(row_number)
            for column_number, column_data in enumerate(row_data):
                table_widget.setItem(row_number, column_number, QtWidgets.QTableWidgetItem(str(column_data)))          
if __name__ == "__main__":
    app = QApplication(sys.argv)
    login_win = MainWindow()
    login_win.show()
    sys.exit(app.exec())