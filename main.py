import sys
from PyQt6.QtWidgets import QApplication
from main_login import LoginUI

if __name__ == "__main__":
    app = QApplication(sys.argv)
    login_win = LoginUI()
    login_win.show()
    sys.exit(app.exec())
