from abc import ABC, abstractmethod

class KetQua(ABC):
    def __init__(self, ma_ket_qua, ten_ket_qua):
        self.ma_ket_qua = ma_ket_qua
        self.ten_ket_qua = ten_ket_qua

    @abstractmethod
    def display_info(self):
        pass
