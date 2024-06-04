from abc import ABC, abstractmethod

class LoaiNguoiDung(ABC):
    def __init__(self, ma_loai, ten_loai_nd):
        self.ma_loai = ma_loai
        self.ten_loai_nd = ten_loai_nd

    @abstractmethod
    def display_info(self):
        pass
