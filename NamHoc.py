from abc import ABC, abstractmethod

class NamHoc(ABC):
    def __init__(self, ma_nam_hoc, ten_nam_hoc):
        self.ma_nam_hoc = ma_nam_hoc
        self.ten_nam_hoc = ten_nam_hoc

    @abstractmethod
    def display_info(self):
        pass
