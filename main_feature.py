import DatabaseQueries
from PyQt6 import QtWidgets, QtCore
from PyQt6.QtWidgets import QMainWindow, QMessageBox, QTableWidgetItem, QApplication

from ui_main import Ui_windowUI_main
from Khoa import Khoa  # Import the Khoa class from the Khoa module
class MainUI(QMainWindow):
    def __init__(self, textID):
        super().__init__()
        self.uic2 = Ui_windowUI_main()
        self.uic2.setupUi(self)
        self.uic2.lab_user_2.setText(textID)
        # Ẩn tiêu đề cửa sổ và các nút tối thiểu, phóng to và thoát
        self.setWindowFlags(QtCore.Qt.WindowType.WindowStaysOnTopHint)
        self.setWindowFlags(QtCore.Qt.WindowType.FramelessWindowHint)

        self.uic2.pushButton_close.clicked.connect(self.close)
        #self.uic2.pushButton_max.clicked.connect(self.showMaximized)
        #self.uic2.pushButton_max.clicked.connect(self.handleMaximizeButtonClick)
        self.uic2.pushButton_max.setEnabled(False)
        self.uic2.pushButton_minimize.clicked.connect(self.showMinimized)

        self.uic2.pushButton_home.clicked.connect(self.fn_showpage_1_Home)
        self.uic2.pushButton_sinhvien.clicked.connect(self.fn_showpage_2_QLSinhVien)
        self.uic2.pushButton_giangvien.clicked.connect(self.fn_showpage_3_QLGiangVien)
        self.uic2.pushButton_lop.clicked.connect(self.fn_showpage_4_QLLop)
        self.uic2.pushButton_monhoc.clicked.connect(self.fn_showpage_5_QLMonHoc)
        self.uic2.pushButton_khoa.clicked.connect(self.fn_showpage_6_QLKhoa)


        self.khoa_records = []

        # Connect buttons to CRUD methods
        self.uic2.pushButton_tab_1_QLKhoa_add.clicked.connect(self.add_khoa)
        self.uic2.pushButton_tab_1_QLKhoa_edit.clicked.connect(self.edit_khoa)
        self.uic2.pushButton_tab_1_QLKhoa_delete.clicked.connect(self.delete_khoa)
        self.uic2.pushButton_tab_1_QLKhoa_view.clicked.connect(self.view_khoa)
        self.uic2.pushButton_QLKhoa_search_3_timkiem.clicked.connect(self.search_khoa)
        self.uic2.pushButton_QLKhoa_search_3_lammoi.clicked.connect(self.refresh_khoa)

    def fn_showpage_1_Home(self):
        self.uic2.stackedWidget.setCurrentWidget(self.uic2.page_1_Home)

    def fn_showpage_2_QLSinhVien(self):
        self.uic2.stackedWidget.setCurrentWidget(self.uic2.page_2_QLSinhVien)
        rows = DatabaseQueries.fetch_data_from_sql_server('SINHVIEN')
        if rows:
            self.display_data_in_table(rows, self.uic2.tableWidget_QLSinhVien)

    def fn_showpage_3_QLGiangVien(self):
        self.uic2.stackedWidget.setCurrentWidget(self.uic2.page_3_QLGiangVien)
        rows = DatabaseQueries.fetch_data_from_sql_server('GIANGVIEN')
        if rows:
            self.display_data_in_table(rows, self.uic2.tableWidget_QLGiangVien)

    def fn_showpage_4_QLLop(self):
        self.uic2.stackedWidget.setCurrentWidget(self.uic2.page_4_QLLop)
        rows = DatabaseQueries.fetch_data_from_sql_server('LOP')
        if rows:
            self.display_data_in_table(rows, self.uic2.tableWidget_QLLop)

    def fn_showpage_5_QLMonHoc(self):
        self.uic2.stackedWidget.setCurrentWidget(self.uic2.page_5_QLMonHoc)
        rows = DatabaseQueries.fetch_data_from_sql_server('MONHOC')
        if rows:
            self.display_data_in_table(rows, self.uic2.tableWidget_QLMonHoc)

    def fn_showpage_6_QLKhoa(self):
        self.uic2.stackedWidget.setCurrentWidget(self.uic2.page_6_QLKhoa)
        rows = DatabaseQueries.fetch_data_from_sql_server('KHOA')
        if rows:
            self.display_data_in_table(rows, self.uic2.tableWidget_QLKhoa)

    def display_data_in_table(self, data, table_widget):
        table_widget.clearContents()
        table_widget.setRowCount(0)

        for row_number, row_data in enumerate(data):
            table_widget.insertRow(row_number)
            for column_number, column_data in enumerate(row_data):
                table_widget.setItem(row_number, column_number, QtWidgets.QTableWidgetItem(str(column_data)))
            
    # def view_khoa(self):
    #     rows = DatabaseQueries.fetch_data_from_sql_server('KHOA')
    #     if rows:
    #         self.display_data_in_table(rows, self.uic2.tableWidget_QLKhoa)



    # def edit_khoa(self):
    #     selected_row = self.uic2.tableWidget_QLKhoa.currentRow()
    #     if selected_row >= 0:
    #         ma_khoa = self.uic2.lineEdit_Khoa_makhoa.text()
    #         ten_khoa = self.uic2.lineEdit_Khoa_tenkhoa.text()
    #         so_dien_thoai = self.uic2.lineEdit_Khoa_sodienthoai.text()
    #         khoa = Khoa(ma_khoa, ten_khoa, so_dien_thoai)
    #         try:
    #             DatabaseQueries.edit_khoa(khoa)
    #             self.view_khoa()
    #             self.show_message("Success", "Khoa edited successfully")
    #         except Exception as e:
    #             self.show_message("Error", f"Failed to edit Khoa: {str(e)}")
    #     else:
    #         self.show_message("Error", "No row selected")

    # def delete_khoa(self):
    #     selected_row = self.uic2.tableWidget_QLKhoa.currentRow()
    #     if selected_row >= 0:
    #         ma_khoa = self.uic2.tableWidget_QLKhoa.item(selected_row, 0).text()
    #         try:
    #             DatabaseQueries.delete_khoa(ma_khoa)
    #             self.view_khoa()
    #             self.show_message("Success", "Khoa deleted successfully")
    #         except Exception as e:
    #             self.show_message("Error", f"Failed to delete Khoa: {str(e)}")
    #     else:
    #         self.show_message("Error", "No row selected")

    # def search_khoa(self):
    #     hoten = self.uic2.lineEdit_QLKhoa_search_2_hoten.text()
    #     maso = self.uic2.lineEdit_QLKhoa_search_2_maso.text()
    #     rows = DatabaseQueries.search_khoa(hoten, maso) 
    #     if rows:
    #         self.display_data_in_table(rows, self.uic2.tableWidget_QLKhoa)
    #     else:
    #         self.show_message("Error", "No rows found")


    # CRUD methods for Khoa
    # def add_khoa(self):
    #     ma_khoa = self.uic2.lineEdit_Khoa_makhoa.text()
    #     ten_khoa = self.uic2.lineEdit_Khoa_tenkhoa.text()
    #     so_dien_thoai = self.uic2.lineEdit_Khoa_sodienthoai.text()
    #     try:
    #         DatabaseQueries.add_khoa(ma_khoa, ten_khoa, so_dien_thoai)
    #         self.view_khoa()
    #         self.show_message("Success", "Khoa added successfully")
    #     except Exception as e:
    #         self.show_message("Error", f"Failed to add Khoa: {str(e)}")

    def add_khoa(self):
        ma_khoa = self.uic2.lineEdit_Khoa_makhoa.text()
        ten_khoa = self.uic2.lineEdit_Khoa_tenkhoa.text()
        so_dien_thoai = self.uic2.lineEdit_Khoa_sodienthoai.text()
        khoa = Khoa(ma_khoa, ten_khoa, so_dien_thoai)
        try:
            # Thêm đối tượng Khoa vào cơ sở dữ liệu
            DatabaseQueries.add_khoa(khoa)
            # Lấy lại dữ liệu từ cơ sở dữ liệu và hiển thị lên bảng
            self.view_khoa()
            self.show_message("Success", "Khoa added successfully")
        except Exception as e:
            self.show_message("Error", f"Failed to add Khoa: {str(e)}")

    def edit_khoa(self):
        selected_row = self.uic2.tableWidget_QLKhoa.currentRow()
        if selected_row >= 0:
            ma_khoa = self.uic2.lineEdit_Khoa_makhoa.text()
            ten_khoa = self.uic2.lineEdit_Khoa_tenkhoa.text()
            so_dien_thoai = self.uic2.lineEdit_Khoa_sodienthoai.text()
            try:
                DatabaseQueries.edit_khoa(ma_khoa, ten_khoa, so_dien_thoai)
                self.view_khoa()
                self.show_message("Success", "Khoa edited successfully")
            except Exception as e:
                self.show_message("Error", f"Failed to edit Khoa: {str(e)}")
        else:
            self.show_message("Error", "No row selected")

    def delete_khoa(self):
        selected_row = self.uic2.tableWidget_QLKhoa.currentRow()
        if selected_row >= 0:
            ma_khoa = self.uic2.tableWidget_QLKhoa.item(selected_row, 0).text()
            try:
                DatabaseQueries.delete_khoa(ma_khoa)
                self.view_khoa()
                self.show_message("Success", "Khoa deleted successfully")
            except Exception as e:
                self.show_message("Error", f"Failed to delete Khoa: {str(e)}")
        else:
            self.show_message("Error", "No row selected")

    def view_khoa(self):
        rows = DatabaseQueries.fetch_data_from_sql_server('KHOA')
        if rows:
            self.display_data_in_table(rows, self.uic2.tableWidget_QLKhoa)

    def search_khoa(self):
        hoten = self.uic2.lineEdit_QLKhoa_search_2_hoten.text()
        maso = self.uic2.lineEdit_QLKhoa_search_2_maso.text()
        rows = DatabaseQueries.search_khoa(hoten, maso) 
        if rows:
            self.display_data_in_table(rows, self.uic2.tableWidget_QLKhoa)
        else:
            self.show_message("Error", "No row selected")

    def refresh_khoa(self):
        self.uic2.lineEdit_QLKhoa_search_2_hoten.clear()
        self.uic2.lineEdit_QLKhoa_search_2_maso.clear()
        rows = DatabaseQueries.fetch_data_from_sql_server('KHOA')
        if rows:
            self.display_data_in_table(rows, self.uic2.tableWidget_QLKhoa)

    def show_message(self, title, message):
        msg = QMessageBox()
        msg.setIcon(QMessageBox.Icon.Information)
        msg.setWindowTitle(title)
        msg.setText(message)
        msg.setStandardButtons(QMessageBox.StandardButton.Ok)
        msg.exec()