from abc import ABC, abstractmethod

class SinhVien(ABC):
    def __init__(self, MaSinhVien, HoTen, GioiTinh, NgaySinh, NoiSinh, MaDanToc, MaTonGiao, HoTenCha, MaNNghiepCha, HoTenMe, MaNNghiepMe, DienThoai):
        self.MaSinhVien = MaSinhVien
        self.HoTen = HoTen
        self.GioiTinh = GioiTinh
        self.NgaySinh = NgaySinh
        self.NoiSinh = NoiSinh
        self.MaDanToc = MaDanToc
        self.MaTonGiao = MaTonGiao
        self.HoTenCha = HoTenCha
        self.MaNNghiepCha = MaNNghiepCha
        self.HoTenMe = HoTenMe
        self.MaNNghiepMe = MaNNghiepMe
        self.DienThoai = DienThoai

    @abstractmethod
    def display_info(self):
        pass
