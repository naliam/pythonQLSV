from abc import ABC, abstractmethod

class Khoa:
    def __init__(self, ma_khoa, ten_khoa, so_dien_thoai):
        self.ma_khoa = ma_khoa
        self.ten_khoa = ten_khoa
        self.so_dien_thoai = so_dien_thoai

    def __repr__(self):
        return f"Khoa(ma_khoa='{self.ma_khoa}', ten_khoa='{self.ten_khoa}', so_dien_thoai='{self.so_dien_thoai}')"

    # @abstractmethod
    # def display_info(self):
    #     pass
