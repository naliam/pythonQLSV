from abc import ABC, abstractmethod

class NguoiDung(ABC):
    def __init__(self, ma_nd, ma_loai, ten_nd, ten_d_nhap, mat_khau):
        self.ma_nd = ma_nd
        self.ma_loai = ma_loai
        self.ten_nd = ten_nd
        self.ten_d_nhap = ten_d_nhap
        self.mat_khau = mat_khau

    @abstractmethod
    def display_info(self):
        pass
