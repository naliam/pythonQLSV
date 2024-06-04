from abc import ABC, abstractmethod

class LoaiGiangVien(ABC):
    def __init__(self, ma_loai_gv, ten_loai_gv):
        self.ma_loai_gv = ma_loai_gv
        self.ten_loai_gv = ten_loai_gv

    @abstractmethod
    def display_info(self):
        pass
