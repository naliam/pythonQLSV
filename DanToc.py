from abc import ABC, abstractmethod

class DanToc(ABC):
    def __init__(self, ma_dan_toc, ten_dan_toc):
        self.ma_dan_toc = ma_dan_toc
        self.ten_dan_toc = ten_dan_toc

    @abstractmethod
    def display_info(self):
        pass
