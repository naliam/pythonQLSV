from abc import ABC, abstractmethod

class TonGiao(ABC):
    def __init__(self, ma_ton_giao, ten_ton_giao):
        self.ma_ton_giao = ma_ton_giao
        self.ten_ton_giao = ten_ton_giao

    @abstractmethod
    def display_info(self):
        pass
