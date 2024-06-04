from abc import ABC, abstractmethod

class HanhKiem(ABC):
    def __init__(self, ma_hanh_kiem, ten_hanh_kiem):
        self.ma_hanh_kiem = ma_hanh_kiem
        self.ten_hanh_kiem = ten_hanh_kiem

    @abstractmethod
    def display_info(self):
        pass
