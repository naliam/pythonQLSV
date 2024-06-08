from abc import ABC, abstractmethod

class MonHoc(ABC):
    def __init__(self, ma_mon_hoc, ten_mon_hoc, so_tiet, ma_khoa):
        self.ma_mon_hoc = ma_mon_hoc
        self.ten_mon_hoc = ten_mon_hoc
        self.so_tiet = so_tiet
        self.ma_khoa = ma_khoa

    def __repr__(self):
        return f"MonHoc(ma_mon_hoc='{self.ma_mon_hoc}', ten_khoa='{self.ten_khoa}', so_tiet='{self.so_tiet}', ma_khoa='{self.ma_khoa}')"

    @abstractmethod
    def display_info(self):
        pass
