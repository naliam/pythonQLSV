from abc import ABC, abstractmethod

class GiangVien(ABC):
    def __init__(self, ma_giang_vien, ten_giang_vien, gioi_tinh, dia_chi, dien_thoai, ma_mon_hoc, ma_hoc_vi, ma_loai_gv):
        self.ma_giang_vien = ma_giang_vien
        self.ten_giang_vien = ten_giang_vien
        self.gioi_tinh = gioi_tinh
        self.dia_chi = dia_chi
        self.dien_thoai = dien_thoai
        self.ma_mon_hoc = ma_mon_hoc
        self.ma_hoc_vi = ma_hoc_vi
        self.ma_loai_gv = ma_loai_gv

    @abstractmethod
    def display_info(self):
        pass
