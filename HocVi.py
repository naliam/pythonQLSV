from abc import ABC, abstractmethod

class HocVi(ABC):
    def __init__(self, ma_hoc_vi, ten_hoc_vi):
        self.ma_hoc_vi = ma_hoc_vi
        self.ten_hoc_vi = ten_hoc_vi

    @abstractmethod
    def display_info(self):
        pass
