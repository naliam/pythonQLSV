from abc import ABC, abstractmethod

class Khoa(ABC):
    def __init__(self, ma_khoa, ten_khoa, sdt):
        self.ma_khoa = ma_khoa
        self.ten_khoa = ten_khoa
        self.sdt = sdt

    @abstractmethod
    def display_info(self):
        pass
