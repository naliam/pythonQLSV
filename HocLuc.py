from abc import ABC, abstractmethod

class HocLuc(ABC):
    def __init__(self, ma_hoc_luc, ten_hoc_luc, diem_can_duoi, diem_can_tren, diem_khong_che):
        self.ma_hoc_luc = ma_hoc_luc
        self.ten_hoc_luc = ten_hoc_luc
        self.diem_can_duoi = diem_can_duoi
        self.diem_can_tren = diem_can_tren
        self.diem_khong_che = diem_khong_che

    @abstractmethod
    def display_info(self):
        pass
