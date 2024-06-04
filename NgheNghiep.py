from abc import ABC, abstractmethod

class NgheNghiep(ABC):
    def __init__(self, ma_nghe, ten_nghe):
        self.ma_nghe = ma_nghe
        self.ten_nghe = ten_nghe

    @abstractmethod
    def display_info(self):
        pass
