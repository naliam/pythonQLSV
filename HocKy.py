from abc import ABC, abstractmethod

class HocKy(ABC):
    def __init__(self, ma_hoc_ky, ten_hoc_ky, he_so):
        self.ma_hoc_ky = ma_hoc_ky
        self.ten_hoc_ky = ten_hoc_ky
        self.he_so = he_so

    @abstractmethod
    def display_info(self):
        pass
