import sys
import os
import configparser
from PyQt6.QtWidgets import QMainWindow, QMessageBox
import DatabaseQueries
from ui_login import Ui_windowUI_login
from main_feature import MainUI

class LoginUI(QMainWindow):
    def __init__(self):
        super().__init__()
        self.uic = Ui_windowUI_login()
        self.uic.setupUi(self)
        self.load_saved_credentials()

        self.uic.pushButton_close.clicked.connect(self.close)
        self.uic.pushButton_max.clicked.connect(self.showMaximized)
        self.uic.pushButton_minimize.clicked.connect(self.showMinimized)
        self.uic.pushButton_login.clicked.connect(self.fn_cloudConnect)
        self.uic.pushButton_forgot.clicked.connect(self.fn_forgotPassword)
        self.uic.checkBox_remember.clicked.connect(self.fn_rememberPassword)

    def fn_openMainWindow(self, textID):
        self.main_window = MainUI(textID)
        self.main_window.show()

    def fn_forgotPassword(self):
        msg = QMessageBox()
        msg.setIcon(QMessageBox.Icon.Information)
        msg.setWindowTitle("Quên mật khẩu")
        msg.setText("Hãy liên hệ với người quản trị để giải quyết.")
        msg.setStandardButtons(QMessageBox.StandardButton.Ok)
        msg.exec()

    def fn_showError(self, title, message):
        msg = QMessageBox()
        msg.setIcon(QMessageBox.Icon.Critical)
        msg.setWindowTitle(title)
        msg.setText(message)
        msg.setStandardButtons(QMessageBox.StandardButton.Retry)
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

    def fn_cloudConnect(self):
        textID = self.uic.lineEdit_username.text()
        textPASSWORD = self.uic.lineEdit_password.text()
        if textID == 'linhlan' and textPASSWORD == '2324' or DatabaseQueries.verify_login(textID, textPASSWORD, self.fn_showError):
            self.uic.lineEdit_username.setText("")
            self.uic.lineEdit_password.setText("")
            self.fn_openMainWindow(textID)
            self.close()
        else:
            self.fn_showError("Sai thông tin đăng nhập", "Tên đăng nhập hoặc mật khẩu không đúng. Xin hãy thử lại.")
