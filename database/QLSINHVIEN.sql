USE master
GO
IF EXISHV0001
(
	SELECT * 
	FROM   master..sysdatabases 
	WHERE  name = N'QLSINHVIEN'
)
DROP DATABASE quanlySinhVien
GO

CREATE DATABASE quanlySinhVien 

GO

USE quanlySinhVien
GO
--===================================================================================================================================================

CREATE TABLE LOAINGUOIDUNG
(
	MaLoai		VARCHAR (6)		NOT NULL	PRIMARY KEY,
	TenLoaiND	NVARCHAR (30)	NOT NULL
)

INSERT INTO LOAINGUOIDUNG VALUES('LND001',N'Admin')
INSERT INTO LOAINGUOIDUNG VALUES('LND002',N'Ban Giám Hiệu')
INSERT INTO LOAINGUOIDUNG VALUES('LND003',N'Giảng Viên')
INSERT INTO LOAINGUOIDUNG VALUES('LND004',N'Giáo Vụ')

-----------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE  NGUOIDUNG
(
	MaND 		VARCHAR (6) 	NOT NULL	PRIMARY KEY,
	MaLoai		VARCHAR (6)		NOT NULL,
	TenND		NVARCHAR (30)	NOT NULL,
	TenDNhap	VARCHAR (30)	NOT NULL,
	MatKhau		VARCHAR (30)	NOT NULL,
	
	CONSTRAINT FK_ND_LND FOREIGN KEY(MaLoai) 	REFERENCES LOAINGUOIDUNG(MaLoai)
)

INSERT INTO NGUOIDUNG VALUES('ND0001','LND001',N'Oanhtran23','Admin','123456')
INSERT INTO NGUOIDUNG VALUES('ND0002','LND002',N'Trương Văn Việt','vanviet','123456')
INSERT INTO NGUOIDUNG VALUES('ND0003','LND003',N'Đỗ Văn Tình','vantinh','123456')
INSERT INTO NGUOIDUNG VALUES('ND0004','LND004',N'Đỗ Quốc Toàn','quoctoan','123456')

--===================================================================================================================================================

CREATE TABLE DANTOC
(
	MaDanToc VARCHAR (6) NOT NULL PRIMARY KEY,
	TenDanToc NVARCHAR (30)NOT NULL
)

INSERT INTO DANTOC VALUES('DT0001',N'Kinh')
INSERT INTO DANTOC VALUES('DT0002',N'Hoa')
INSERT INTO DANTOC VALUES('DT0003',N'Khome')
INSERT INTO DANTOC VALUES('DT0004',N'Chăm')

-----------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE TONGIAO
(
	MaTonGiao	VARCHAR (6)		NOT NULL	PRIMARY KEY,
	TenTonGiao	NVARCHAR (30)	NOT NULL
)

INSERT INTO TONGIAO VALUES('TG0001',N'Không')
INSERT INTO TONGIAO VALUES('TG0002',N'Phật')
INSERT INTO TONGIAO VALUES('TG0003',N'Thiên Chúa')
INSERT INTO TONGIAO VALUES('TG0004',N'Tin Lành')

--===================================================================================================================================================

CREATE TABLE NAMHOC
(
	MaNamHoc	VARCHAR (6)		NOT NULL	PRIMARY KEY,
	TenNamHoc	VARCHAR (30)	NOT NULL
)

INSERT INTO NAMHOC VALUES('NH0912','2009 - 2012')
INSERT INTO NAMHOC VALUES('NH1013','2010 - 2013')
INSERT INTO NAMHOC VALUES('NH1114','2011 - 2014')

-----------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE HOCKY
(
	MaHocKy		VARCHAR (4)		NOT NULL	PRIMARY KEY,
	TenHocKy	NVARCHAR (30)	NOT NULL,
	HeSo		INT
)

INSERT INTO HOCKY VALUES('HK01',N'Học kỳ 1', 1)
INSERT INTO HOCKY VALUES('HK02',N'Học kỳ 2', 2)
INSERT INTO HOCKY VALUES('HK03',N'Học kỳ 3', 2)
INSERT INTO HOCKY VALUES('HK04',N'Học kỳ 4', 2)
INSERT INTO HOCKY VALUES('HK05',N'Học kỳ 5', 2)
INSERT INTO HOCKY VALUES('HK06',N'Học kỳ 6', 2)

--===================================================================================================================================================

CREATE TABLE KHOA
(
	MaKhoa	VARCHAR (5) NOT NULL	PRIMARY KEY,
	TenKhoa	NVARCHAR (50)	NOT NULL,
	SDT VARCHAR(15)  NULL	
)

INSERT INTO KHOA VALUES('KCNTT',N'Khoa Công Nghệ Thông Tin','082345670')
INSERT INTO KHOA VALUES('KTCNH',N'Khoa Tài Chính Ngân Hàng','082345671')
INSERT INTO KHOA VALUES('KDTVT',N'Khoa Điện Tử Viễn Thông','082345672')
INSERT INTO KHOA VALUES('KQTKD',N'Khoa Quản Trị Kinh Doanh','082345673')

-----------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE MONHOC
(
	MaMonHoc	VARCHAR (6)		NOT NULL	PRIMARY KEY,
	TenMonHoc	NVARCHAR (30)	NOT NULL,
	SoTiet		INT				NOT NULL,
	MaKhoa		VARCHAR(5)		 NULL,
	CONSTRAINT FK_MONHOC_KHOA FOREIGN KEY(MaKhoa) 	REFERENCES KHOA(MaKhoa) ON DELETE SET NULL ON UPDATE CASCADE
)

INSERT INTO MONHOC VALUES('MH0001',N'Công Nghệ Phần Mềm',90,'KCNTT')
INSERT INTO MONHOC VALUES('MH0002',N'Thương Mại Điện Tử',60,'KCNTT')
INSERT INTO MONHOC VALUES('MH0003',N'Mạng Máy Tính',60,'KCNTT')
INSERT INTO MONHOC VALUES('MH0004',N'Hệ Thống Thông Tin',60,'KCNTT')
INSERT INTO MONHOC VALUES('MH0005',N'Kỹ Thuật Máy Tính',90,'KCNTT')
INSERT INTO MONHOC VALUES('MH0006',N'Quản Trị Kinh Doanh',45,'KQTKD')
INSERT INTO MONHOC VALUES('MH0007',N'Tài Chính Ngân Hàng',45,'KTCNH')
INSERT INTO MONHOC VALUES('MH0008',N'Kế Toán',45,'KTCNH')
INSERT INTO MONHOC VALUES('MH0009',N'Điện Tử Viễn Thông',45,'KDTVT')

--===================================================================================================================================================

CREATE TABLE HOCLUC
(
	MaHocLuc		VARCHAR (6)		NOT NULL	PRIMARY KEY,
	TenHocLuc		NVARCHAR (30)	NOT NULL,
	DiemCanDuoi		FLOAT			NOT NULL,
	DiemCanTren		FLOAT			NOT NULL,
	DiemKhongChe	FLOAT			NOT NULL
)

INSERT INTO HOCLUC VALUES('HL0001',N'Giỏi',		8.0,	10.0,	5.0)
INSERT INTO HOCLUC VALUES('HL0002',N'Khá',		7.0,	7.9,	5.0)
INSERT INTO HOCLUC VALUES('HL0003',N'TB - Khá',	6.5,	7.0,	5.0)
INSERT INTO HOCLUC VALUES('HL0004',N'Trung Bình',5.0,	6.4,	3.5)
INSERT INTO HOCLUC VALUES('HL0005',N'Yếu',		3.5,	4.9,	2.0)
INSERT INTO HOCLUC VALUES('HL0006',N'Kém',		0.0,	3.4,	0.0)

-----------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE HANHKIEM
(
	MaHanhKiem		VARCHAR (6)		NOT NULL	PRIMARY KEY,
	TenHanhKiem		NVARCHAR (30)	NOT NULL
)

INSERT INTO HANHKIEM VALUES('HK0001',N'Tốt')
INSERT INTO HANHKIEM VALUES('HK0002',N'Khá')
INSERT INTO HANHKIEM VALUES('HK0003',N'Trung Bình')
INSERT INTO HANHKIEM VALUES('HK0004',N'Yếu')

-----------------------------------------------------------------------------------------------------------------------------------------------------
/* Da chinh sua hoan chinh */
CREATE TABLE KETQUA
(
	MaKetQua	VARCHAR (6)		NOT NULL	PRIMARY KEY,
	TenKetQua	NVARCHAR (30)	NOT NULL
)

INSERT INTO KETQUA VALUES('KQ0001',N'Đậu')
INSERT INTO KETQUA VALUES('KQ0002',N'Thi lại')
INSERT INTO KETQUA VALUES('KQ0003',N'Học lại')

--===================================================================================================================================================

CREATE TABLE NGHENGHIEP
(
	MaNghe		VARCHAR (6)		NOT NULL	PRIMARY KEY,
	TenNghe		NVARCHAR (30)	NOT NULL
)

INSERT INTO NGHENGHIEP VALUES('NN0001',N'Nội Trợ')
INSERT INTO NGHENGHIEP VALUES('NN0002',N'Giáo Viên')
INSERT INTO NGHENGHIEP VALUES('NN0003',N'Công Nhân')
INSERT INTO NGHENGHIEP VALUES('NN0004',N'Làm Nông')
INSERT INTO NGHENGHIEP VALUES('NN0005',N'Buôn Bán')

-----------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE HOCVI
(
	MAHOCVI VARCHAR(6) NOT NULL PRIMARY KEY,
	TENHOCVI NVARCHAR(30)
)
	
INSERT INTO HOCVI(MAHOCVI,TENHOCVI) VALUES ('HV0001',N'Tiến Sĩ')
INSERT INTO HOCVI(MAHOCVI,TENHOCVI) VALUES ('HV0002',N'Tiến Sĩ Khoa Học')
INSERT INTO HOCVI(MAHOCVI,TENHOCVI) VALUES ('HV0003',N'Thạc Sĩ')
INSERT INTO HOCVI(MAHOCVI,TENHOCVI) VALUES ('HV0004',N'Cử Nhân')

-----------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE LOAIGIANGVIEN
(
	MALOAIGV VARCHAR(5) NOT NULL PRIMARY KEY ,
	TENLOAIGV NVARCHAR(20)
)

INSERT INTO LOAIGIANGVIEN(MALOAIGV,TENLOAIGV) VALUES ('GV001',N'Cơ hữu')
INSERT INTO LOAIGIANGVIEN(MALOAIGV,TENLOAIGV) VALUES ('GV002',N'Thỉnh giảng')

-------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE GIANGVIEN
(
	MaGIANGVIEN	VARCHAR (6)		NOT NULL	PRIMARY KEY,
	TenGIANGVIEN NVARCHAR (30)	NOT NULL,
	GioiTinh Bit not null,
	DiaChi		NVARCHAR (50)	NOT NULL,
	DienThoai	VARCHAR (15)	NOT NULL,
	MaMonHoc	VARCHAR (6)		NULL,
	MaHocVi VARCHAR(6) NULL,
	MaLoaiGV VARCHAR(5) NULL,
	
	-- (3 khoa ngoai)
	CONSTRAINT FK_GV_MH FOREIGN KEY(MaMonHoc)	REFERENCES MONHOC(MaMonHoc) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT FK_GV_HV FOREIGN KEY(MaHocVi)	REFERENCES HOCVI(MaHocVi) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT FK_GV_LGV FOREIGN KEY(MaLoaiGV)	REFERENCES LOAIGIANGVIEN(MaLoaiGV) ON DELETE SET NULL ON UPDATE CASCADE
)

INSERT INTO GIANGVIEN VALUES('GV0001',N'Nguyễn Minh Thái',1,N'100 Trần Hưng Đạo, Long Xuyên','0975058876','MH0001','HV0001','GV001')
INSERT INTO GIANGVIEN VALUES('GV0002',N'Phan Thị Hồng Nhung',0,N'Thành Phố Hồ Chí Minh','0976630315','MH0002','HV0002','GV001')
INSERT INTO GIANGVIEN VALUES('GV0003',N'Huỳnh Thanh Trúc',1,N'10C Nguyễn Trung Trực - Châu Đốc','0699015456','MH0003','HV0003','GV002')
INSERT INTO GIANGVIEN VALUES('GV0004',N'Lâm Trọng Phú',1,N'Long Biên B - An Phú','0845241566','MH0004','HV0003','GV001')
INSERT INTO GIANGVIEN VALUES('GV0005',N'Phan Thị Cẩm Trang',0,N'Rạch Giá - Kiên Giang','0123456789','MH0005','HV0003','GV002')
INSERT INTO GIANGVIEN VALUES('GV0006',N'Lê Minh Huân',1,N'000 Long Xuyên, An Giang','0123456789','MH0006','HV0003','GV001')

-----------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE SINHVIEN
(
	MaSINHVIEN		VARCHAR (6)		NOT NULL	PRIMARY KEY,
	HoTen			NVARCHAR (30)	NOT NULL,
	GioiTinh		BIT,
	NgaySinh		DATETIME,
	NoiSinh			NVARCHAR (50)	NOT NULL,
	MaDanToc		VARCHAR (6)		NULL,
	MaTonGiao		VARCHAR (6)		NULL,
	HoTenCha		NVARCHAR (30)	NOT NULL,
	MaNNghiepCha	VARCHAR (6)		NULL,
	HoTenMe			NVARCHAR (30)	NOT NULL,
	MaNNghiepMe		VARCHAR (6)		NULL,
	DienThoai		VARCHAR(15),
	
	-- (4 khoa ngoai)
	CONSTRAINT FK_SV_DT	FOREIGN KEY(MaDanToc)		REFERENCES DANTOC(MaDanToc) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT FK_SV_TG	FOREIGN KEY(MaTonGiao)		REFERENCES TONGIAO(MaTonGiao) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT FK_SV_NNC	FOREIGN KEY(MaNNghiepCha)	REFERENCES NGHENGHIEP(MaNghe) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT FK_SV_NNM	FOREIGN KEY(MaNNghiepMe)	REFERENCES NGHENGHIEP(MaNghe)
)

INSERT INTO SINHVIEN VALUES('SV0001',N'Nguyễn Văn Tú','0','01/02/1992',N'Long Xuyên',	'DT0001','TG0003',N'Không Biết',	'NN0005',N'Không Biết',	'NN0002','')
INSERT INTO SINHVIEN VALUES('SV0002',N'Nguyễn Ngọc An',		'0','01/02/1992',N'Bến Tre',		'DT0001','TG0002',N'Không Biết',	'NN0003',N'Không Biết',	'NN0001','')
INSERT INTO SINHVIEN VALUES('SV0003',N'Lê Hoàng Anh',			'0','04/15/1992',N'Chợ Mới',		'DT0001','TG0004',N'Không Biết',	'NN0005',N'Không Biết',	'NN0005','')
INSERT INTO SINHVIEN VALUES('SV0004',N'Huỳnh Thiện Chí',		'0','01/02/1991',N'Đồng Tháp',	'DT0001','TG0003',N'Không Biết',	'NN0002',N'Không Biết',	'NN0004','')
INSERT INTO SINHVIEN VALUES('SV0005',N'Lý Ngọc Duy',			'0','01/02/1992',N'Long Xuyên',	'DT0001','TG0003',N'Không Biết',	'NN0005',N'Không Biết',	'NN0002','')
INSERT INTO SINHVIEN VALUES('SV0006',N'Huỳnh Ngọc Diệp',		'1','01/02/1992',N'Bến Tre',		'DT0001','TG0002',N'Không Biết',	'NN0003',N'Không Biết',	'NN0001','')
INSERT INTO SINHVIEN VALUES('SV0007',N'Trần Thị Huệ',			'1','04/15/1992',N'Chợ Mới',		'DT0001','TG0004',N'Không Biết',	'NN0005',N'Không Biết',	'NN0005','')
INSERT INTO SINHVIEN VALUES('SV0008',N'Nguyễn Thanh Duy',		'0','01/02/1991',N'Đồng Tháp',	'DT0001','TG0003',N'Không Biết',	'NN0002',N'Không Biết',	'NN0004','')
INSERT INTO SINHVIEN VALUES('SV0009',N'Trần Phước Lập',		'0','01/02/1992',N'Long Xuyên',	'DT0001','TG0003',N'Không Biết',	'NN0005',N'Không Biết',	'NN0002','')
INSERT INTO SINHVIEN VALUES('SV0010',N'Trương Thị Nga',		'1','01/02/1992',N'Bến Tre',		'DT0001','TG0002',N'Không Biết',	'NN0003',N'Không Biết',	'NN0001','')
INSERT INTO SINHVIEN VALUES('SV0011',N'Nguyễn Thị Nga',		'1','04/15/1992',N'Chợ Mới',		'DT0001','TG0004',N'Không Biết',	'NN0005',N'Không Biết',	'NN0005','')
INSERT INTO SINHVIEN VALUES('SV0012',N'Trần Thị Hồng',	'1','01/02/1991',N'Đồng Tháp',	'DT0001','TG0003',N'Không Biết',	'NN0002',N'Không Biết',	'NN0004','')
INSERT INTO SINHVIEN VALUES('SV0013',N'Huỳnh Thị Mỹ Ngọc',	'1','01/02/1992',N'Long Xuyên',	'DT0001','TG0003',N'Không Biết',	'NN0005',N'Không Biết',	'NN0002','')
INSERT INTO SINHVIEN VALUES('SV0014',N'Trần Thị Mỹ Nhân',		'1','01/02/1992',N'Bến Tre',		'DT0001','TG0002',N'Không Biết',	'NN0003',N'Không Biết',	'NN0001','')
INSERT INTO SINHVIEN VALUES('SV0015',N'Trương Thị Ngọc Dung','1','04/15/1992',N'Chợ Mới',		'DT0001','TG0004',N'Không Biết',	'NN0005',N'Không Biết',	'NN0005','')
INSERT INTO SINHVIEN VALUES('SV0016',N'Huỳnh Quốc Phong',	'0','01/02/1991',N'Đồng Tháp',	'DT0001','TG0003',N'Không Biết',	'NN0002',N'Không Biết',	'NN0004','')
INSERT INTO SINHVIEN VALUES('SV0017',N'Lý Ngọc Phương',		'1','01/02/1992',N'Long Xuyên',	'DT0001','TG0003',N'Không Biết',	'NN0005',N'Không Biết',	'NN0002','')
INSERT INTO SINHVIEN VALUES('SV0018',N'Nguyễn Thị Phương',	'1','01/02/1992',N'Bến Tre',		'DT0001','TG0002',N'Không Biết',	'NN0003',N'Không Biết',	'NN0001','')
INSERT INTO SINHVIEN VALUES('SV0019',N'Nguyễn Phú Quốc',		'0','04/15/1992',N'Chợ Mới',		'DT0001','TG0004',N'Không Biết',	'NN0005',N'Không Biết',	'NN0005','')
INSERT INTO SINHVIEN VALUES('SV0020',N'Võ Thiên Quốc',		'0','01/02/1991',N'Đồng Tháp',	'DT0001','TG0003',N'Không Biết',	'NN0002',N'Không Biết',	'NN0004','')
INSERT INTO SINHVIEN VALUES('SV0021',N'Trần Văn Thân',		'0','01/02/1992',N'Long Xuyên',	'DT0001','TG0003',N'Không Biết',	'NN0005',N'Không Biết',	'NN0002','')
INSERT INTO SINHVIEN VALUES('SV0022',N'Võ Hữu Tánh',			'0','01/02/1992',N'Bến Tre',		'DT0001','TG0002',N'Không Biết',	'NN0003',N'Không Biết',	'NN0001','')
INSERT INTO SINHVIEN VALUES('SV0023',N'Lê Minh Tâm',			'0','04/15/1992',N'Chợ Mới',		'DT0001','TG0004',N'Không Biết',	'NN0005',N'Không Biết',	'NN0005','')
INSERT INTO SINHVIEN VALUES('SV0024',N'Nguyễn Đức Tâm',		'0','01/02/1991',N'Đồng Tháp',	'DT0001','TG0003',N'Không Biết',	'NN0002',N'Không Biết',	'NN0004','')
INSERT INTO SINHVIEN VALUES('SV0025',N'Nguyễn Thành Tâm',		'0','01/02/1992',N'Long Xuyên',	'DT0001','TG0003',N'Không Biết',	'NN0005',N'Không Biết',	'NN0002','')
INSERT INTO SINHVIEN VALUES('SV0026',N'Trần Ngọc Minh Tân',	'0','01/02/1992',N'Bến Tre',		'DT0001','TG0002',N'Không Biết',	'NN0003',N'Không Biết',	'NN0001','')
INSERT INTO SINHVIEN VALUES('SV0027',N'Dương Kim Thanh',		'1','04/15/1992',N'Chợ Mới',		'DT0001','TG0004',N'Không Biết',	'NN0005',N'Không Biết',	'NN0005','')
INSERT INTO SINHVIEN VALUES('SV0028',N'Vang Sĩ Thái',		'0','01/02/1991',N'Đồng Tháp',	'DT0001','TG0003',N'Không Biết',	'NN0002',N'Không Biết',	'NN0004','')
INSERT INTO SINHVIEN VALUES('SV0029',N'Đỗ Thị Bích Thảo',		'1','01/02/1992',N'Long Xuyên',	'DT0001','TG0003',N'Không Biết',	'NN0005',N'Không Biết',	'NN0002','')
INSERT INTO SINHVIEN VALUES('SV0030',N'Hồ Minh Thiên',		'0','01/02/1992',N'Bến Tre',		'DT0001','TG0002',N'Không Biết',	'NN0003',N'Không Biết',	'NN0001','')
INSERT INTO SINHVIEN VALUES('SV0031',N'Nguyễn Thị Anh Thư',	'1','04/15/1992',N'Chợ Mới',		'DT0001','TG0004',N'Không Biết',	'NN0005',N'Không Biết',	'NN0005','')
INSERT INTO SINHVIEN VALUES('SV0032',N'Phạm Nguyễn Bảo Trinh',	'1','01/02/1991',N'Đồng Tháp',	'DT0001','TG0003',N'Không Biết',	'NN0002',N'Không Biết',	'NN0004','')
INSERT INTO SINHVIEN VALUES('SV0033',N'Võ Ngọc Trinh',		'1','01/02/1992',N'Long Xuyên',	'DT0001','TG0003',N'Không Biết',	'NN0005',N'Không Biết',	'NN0002','')
INSERT INTO SINHVIEN VALUES('SV0034',N'Nguyễn Huỳnh Minh Trí','0','01/02/1992',N'Bến Tre',		'DT0001','TG0002',N'Không Biết',	'NN0003',N'Không Biết',	'NN0001','')
INSERT INTO SINHVIEN VALUES('SV0035',N'Đỗ Xuân Trinh',		'0','04/15/1992',N'Chợ Mới',		'DT0001','TG0004',N'Không Biết',	'NN0005',N'Không Biết',	'NN0005','')
INSERT INTO SINHVIEN VALUES('SV0036',N'Nguyễn Hiêu Trung',	'0','01/02/1991',N'Đồng Tháp',	'DT0001','TG0003',N'Không Biết',	'NN0002',N'Không Biết',	'NN0004','')
INSERT INTO SINHVIEN VALUES('SV0037',N'Nguyễn Trành Trung',	'0','01/02/1992',N'Long Xuyên',	'DT0001','TG0003',N'Không Biết',	'NN0005',N'Không Biết',	'NN0002','')
INSERT INTO SINHVIEN VALUES('SV0038',N'Trần Thị Thanh Trúc',		'1','01/02/1992',N'Bến Tre',		'DT0001','TG0002',N'Không Biết',	'NN0003',N'Không Biết',	'NN0001','')
INSERT INTO SINHVIEN VALUES('SV0039',N'Cao Minh Tuấn',		'0','04/15/1992',N'Chợ Mới',		'DT0001','TG0004',N'Không Biết',	'NN0005',N'Không Biết',	'NN0005','')
INSERT INTO SINHVIEN VALUES('SV0040',N'Nguyễn Hoàng Tuấn',	'0','01/02/1991',N'Đồng Tháp',	'DT0001','TG0003',N'Không Biết',	'NN0002',N'Không Biết',	'NN0004','')
INSERT INTO SINHVIEN VALUES('SV0041',N'Trương Minh Tuyền',	'0','01/02/1992',N'Long Xuyên',	'DT0001','TG0003',N'Không Biết',	'NN0005',N'Không Biết',	'NN0002','')
INSERT INTO SINHVIEN VALUES('SV0042',N'Lê Thanh Tùng',		'0','01/02/1992',N'Bến Tre',		'DT0001','TG0002',N'Không Biết',	'NN0003',N'Không Biết',	'NN0001','')
INSERT INTO SINHVIEN VALUES('SV0043',N'Phạm Thị Bích Vy',		'1','04/15/1992',N'Chợ Mới',		'DT0001','TG0004',N'Không Biết',	'NN0005',N'Không Biết',	'NN0005','')
INSERT INTO SINHVIEN VALUES('SV0044',N'Đặng QUang Vinh',		'0','01/02/1991',N'Đồng Tháp',	'DT0001','TG0003',N'Không Biết',	'NN0002',N'Không Biết',	'NN0004','')
INSERT INTO SINHVIEN VALUES('SV0045',N'Âu Ngọc Vũ',			'0','01/02/1992',N'Long Xuyên',	'DT0001','TG0003',N'Không Biết',	'NN0005',N'Không Biết',	'NN0002','')
INSERT INTO SINHVIEN VALUES('SV0046',N'Hồ Thanh Vũ',			'0','01/02/1992',N'Bến Tre',		'DT0001','TG0002',N'Không Biết',	'NN0003',N'Không Biết',	'NN0001','')
INSERT INTO SINHVIEN VALUES('SV0047',N'Phan Quốc Vương',		'0','04/15/1992',N'Chợ Mới',		'DT0001','TG0004',N'Không Biết',	'NN0005',N'Không Biết',	'NN0005','')

--==========================================================================================================================================================================
--drop table lop

CREATE TABLE LOP
(
	MaLop		VARCHAR (10)	NOT NULL	PRIMARY KEY,
	TenLop		NVARCHAR (30)	NOT NULL,
	MaKhoa	VARCHAR (5)		NULL, 
	MaNamHoc	VARCHAR (6)		 NULL, -- set null
	SiSo		INT 			NOT NULL,
	
	-- (3 khoa ngoai)
	CONSTRAINT FK_LOP_Khoa FOREIGN KEY(MaKhoa)	REFERENCES KHOA(MaKhoa) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT FK_LOP_NH FOREIGN KEY(MaNamHoc)	REFERENCES NAMHOC(MaNamHoc) ON DELETE SET NULL ON UPDATE CASCADE
)

INSERT INTO LOP VALUES('CNPM0912',N'C9CNMP','KCNTT','NH0912', 35)
INSERT INTO LOP VALUES('QTKD0912',N'C9QTKD','KQTKD','NH0912', 36)
INSERT INTO LOP VALUES('MMT0912',N'C9MMT','KCNTT','NH0912', 34)
INSERT INTO LOP VALUES('DTVT0912',N'C9ĐTVT','KDTVT','NH0912', 37)
INSERT INTO LOP VALUES('TMDT0912',N'C9TMĐT','KCNTT','NH0912', 38)
INSERT INTO LOP VALUES('TCNH0912',N'C9TCNH','KTCNH','NH0912', 39)

INSERT INTO LOP VALUES('CNPM1013',N'C10CNPM','KCNTT','NH1013', 39)
INSERT INTO LOP VALUES('TMDT1013',N'C10TMĐT','KCNTT','NH1013', 38)
INSERT INTO LOP VALUES('DTVT1013',N'C10ĐTVT','KDTVT','NH1013', 35)
INSERT INTO LOP VALUES('TCNH1013',N'C10TCNH','KTCNH','NH1013', 40)
INSERT INTO LOP VALUES('QTKD1013',N'C10QTKD','KQTKD','NH1013', 38)
INSERT INTO LOP VALUES('HTTT1013',N'C10HTTT','KCNTT','NH1013', 38)

-----------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE PHANCONG
(
	STT			INT				IDENTITY	PRIMARY KEY,
	MaNamHoc	VARCHAR (6)		NULL, --allow  null
	MaLop		VARCHAR (10)	NULL,
	MaMonHoc	VARCHAR (6)		NULL,
	MaGIANGVIEN	VARCHAR (6)		NULL,
	 
	-- (4 khoa ngoai)
	CONSTRAINT F_PC_NH	FOREIGN KEY(MaNamHoc)	REFERENCES NAMHOC(MaNamHoc) ON UPDATE CASCADE ON DELETE SET NULL,
	CONSTRAINT P_PC_LOP	FOREIGN KEY(MaLop)		REFERENCES LOP(MaLop),
	CONSTRAINT P_PC_MH	FOREIGN KEY(MaMonHoc)	REFERENCES MONHOC(MaMonHoc) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT P_PC_GV	FOREIGN KEY(MaGIANGVIEN)	REFERENCES GIANGVIEN(MaGIANGVIEN)
)


INSERT INTO PHANCONG VALUES('NH0912','CNPM0912','MH0001','GV0001')
INSERT INTO PHANCONG VALUES('NH0912','CNPM0912','MH0002','GV0002')
INSERT INTO PHANCONG VALUES('NH0912','CNPM0912','MH0003','GV0003')
INSERT INTO PHANCONG VALUES('NH0912','CNPM0912','MH0004','GV0004')

INSERT INTO PHANCONG VALUES('NH0912','DTVT0912','MH0001','GV0001')
INSERT INTO PHANCONG VALUES('NH0912','DTVT0912','MH0002','GV0002')
INSERT INTO PHANCONG VALUES('NH0912','DTVT0912','MH0003','GV0003')
INSERT INTO PHANCONG VALUES('NH0912','DTVT0912','MH0004','GV0004')

INSERT INTO PHANCONG VALUES('NH1013','QTKD1013','MH0001','GV0001')
INSERT INTO PHANCONG VALUES('NH1013','QTKD1013','MH0002','GV0002')
INSERT INTO PHANCONG VALUES('NH1013','QTKD1013','MH0003','GV0003')
INSERT INTO PHANCONG VALUES('NH1013','QTKD1013','MH0004','GV0004')

--===================================================================================================================================================

CREATE TABLE LOAIDIEM
(
	MaLoai		VARCHAR (6)		NOT NULL	PRIMARY KEY,
	TenLoai		NVARCHAR (30)	NOT NULL,
	HeSo		INT				NOT NULL
)


INSERT INTO LOAIDIEM VALUES('LD0001',N'Kiểm Tra Giữa Kỳ',3)
INSERT INTO LOAIDIEM VALUES('LD0002',N'Cuối Kỳ Lần 1',7)
INSERT INTO LOAIDIEM VALUES('LD0003',N'Cuối Kỳ Lần 2',7)
INSERT INTO LOAIDIEM VALUES('LD0004',N'Học Lại',	10)

-----------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE DIEM
(
	STT			INT				IDENTITY	PRIMARY KEY,
	MaSINHVIEN	VARCHAR (6)		NULL,
	MaMonHoc	VARCHAR (6)		NULL,
	MaHocKy		VARCHAR (4)		NULL,
	MaNamHoc	VARCHAR (6)		NULL,
	MaLop		VARCHAR (10)	NULL,
	MaLoai		VARCHAR (6)		NULL,
	Diem		FLOAT			NOT NULL,
	
	-- (5 khoa ngoai)
	CONSTRAINT FK_DIEM_SV	FOREIGN KEY(MaSINHVIEN)	REFERENCES SINHVIEN(MaSINHVIEN) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT FK_DIEM_MH	FOREIGN KEY(MaMonHoc)	REFERENCES MONHOC(MaMonHoc) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT FK_DIEM_HK	FOREIGN KEY(MaHocKy)	REFERENCES HOCKY(MaHocKy) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT FK_DIEM_NH	FOREIGN KEY(MaNamHoc)	REFERENCES NAMHOC(MaNamHoc) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT FK_DIEM_LOP	FOREIGN KEY(MaLop)		REFERENCES LOP(MaLop),
	CONSTRAINT FK_DIEM_LD	FOREIGN KEY(MaLoai)		REFERENCES LOAIDIEM(MaLoai) ON DELETE SET NULL ON UPDATE CASCADE
)
INSERT INTO SINHVIEN VALUES('SV0001',N'Nguyễn Văn Tú','0','01/02/1992',N'Long Xuyên',	'DT0001','TG0003',N'Không Biết',	'NN0005',N'Không Biết',	'NN0002','')
INSERT INTO SINHVIEN VALUES('SV0002',N'Nguyễn Ngọc An',		'0','01/02/1992',N'Bến Tre',		'DT0001','TG0002',N'Không Biết',	'NN0003',N'Không Biết',	'NN0001','')
INSERT INTO SINHVIEN VALUES('SV0003',N'Lê Hoàng Anh',			'0','04/15/1992',N'Chợ Mới',		'DT0001','TG0004',N'Không Biết',	'NN0005',N'Không Biết',	'NN0005','')
INSERT INTO SINHVIEN VALUES('SV0004',N'Huỳnh Thiện Chí',		'0','01/02/1991',N'Đồng Tháp',	'DT0001','TG0003',N'Không Biết',	'NN0002',N'Không Biết',	'NN0004','')
INSERT INTO SINHVIEN VALUES('SV0005',N'Lý Ngọc Duy',			'0','01/02/1992',N'Long Xuyên',	'DT0001','TG0003',N'Không Biết',	'NN0005',N'Không Biết',	'NN0002','')
INSERT INTO SINHVIEN VALUES('SV0006',N'Huỳnh Ngọc Diệp',		'1','01/02/1992',N'Bến Tre',		'DT0001','TG0002',N'Không Biết',	'NN0003',N'Không Biết',	'NN0001','')
INSERT INTO SINHVIEN VALUES('SV0007',N'Trần Thị Huệ',			'1','04/15/1992',N'Chợ Mới',		'DT0001','TG0004',N'Không Biết',	'NN0005',N'Không Biết',	'NN0005','')
INSERT INTO SINHVIEN VALUES('SV0008',N'Nguyễn Thanh Duy',		'0','01/02/1991',N'Đồng Tháp',	'DT0001','TG0003',N'Không Biết',	'NN0002',N'Không Biết',	'NN0004','')
INSERT INTO SINHVIEN VALUES('SV0009',N'Trần Phước Lập',		'0','01/02/1992',N'Long Xuyên',	'DT0001','TG0003',N'Không Biết',	'NN0005',N'Không Biết',	'NN0002','')

INSERT INTO MONHOC VALUES('MH0001',N'Công Nghệ Phần Mềm',90,'KCNTT')
INSERT INTO MONHOC VALUES('MH0002',N'Thương Mại Điện Tử',60,'KCNTT')
INSERT INTO MONHOC VALUES('MH0003',N'Mạng Máy Tính',60,'KCNTT')
INSERT INTO MONHOC VALUES('MH0004',N'Hệ Thống Thông Tin',60,'KCNTT')
INSERT INTO MONHOC VALUES('MH0005',N'Kỹ Thuật Máy Tính',90,'KCNTT')
INSERT INTO MONHOC VALUES('MH0006',N'Quản Trị Kinh Doanh',45,'KQTKD')
INSERT INTO MONHOC VALUES('MH0007',N'Tài Chính Ngân Hàng',45,'KTCNH')
INSERT INTO MONHOC VALUES('MH0008',N'Kế Toán',45,'KTCNH')
INSERT INTO MONHOC VALUES('MH0009',N'Điện Tử Viễn Thông',45,'KDTVT')

INSERT INTO NAMHOC VALUES('NH0912','2009 - 2012')
INSERT INTO NAMHOC VALUES('NH1013','2010 - 2013')
INSERT INTO NAMHOC VALUES('NH1114','2011 - 2014')
INSERT INTO LOP VALUES('CNPM0912',N'C9CNMP','KCNTT','NH0912', 35)
INSERT INTO LOP VALUES('QTKD0912',N'C9QTKD','KQTKD','NH0912', 36)
INSERT INTO LOP VALUES('MMT0912',N'C9MMT','KCNTT','NH0912', 34)
INSERT INTO LOP VALUES('DTVT0912',N'C9ĐTVT','KDTVT','NH0912', 37)
INSERT INTO LOP VALUES('TMDT0912',N'C9TMĐT','KCNTT','NH0912', 38)
INSERT INTO LOP VALUES('TCNH0912',N'C9TCNH','KTCNH','NH0912', 39)

insert into diem values('SV0001','MH0001','HK01','NH0912','CNPM0912','LD0002',7)
insert into diem values('SV0002','MH0006','HK02','NH0912','QTKD0912','LD0001',9)
insert into diem values('SV0003','MH0007','HK03','NH0912','TCNH0912','LD0003',4)
insert into diem values('SV0004','MH0009','HK04','NH0912','DTVT0912','LD0004',6)
insert into diem values('SV0005','MH0008','HK05','NH0912','TCNH0912','LD0001',2)

--===================================================================================================================================================

CREATE TABLE KQ_HOC_KY_MON_HOC
(
	MaSINHVIEN	VARCHAR (6)		NOT NULL,
	MaLop		VARCHAR (10)	NOT NULL,
	MaMonHoc	VARCHAR (6)		NOT NULL,
	MaHocKy		VARCHAR (4)		NOT NULL,
	MaNamHoc	VARCHAR (6)		NOT NULL,
	DTBKiemTra	FLOAT			NOT NULL,
	DTBMonHocKy	FLOAT			NOT NULL,	-- Cua tung mon
	
	PRIMARY KEY(MaSINHVIEN, MaLop, MaMonHoc, MaHocKy, MaNamHoc),
	
	-- (5 khoa ngoai)
	CONSTRAINT F_KQHKMH_HS FOREIGN KEY(MaSINHVIEN)	REFERENCES SINHVIEN(MaSINHVIEN) ,
	CONSTRAINT F_KQHKMH_LO FOREIGN KEY(MaLop)		REFERENCES LOP(MaLop),
	CONSTRAINT F_KQHKMH_MH FOREIGN KEY(MaMonHoc)	REFERENCES MONHOC(MaMonHoc),
	CONSTRAINT F_KQHKMH_HK FOREIGN KEY(MaHocKy)		REFERENCES HOCKY(MaHocKy),
	CONSTRAINT F_KQHKMH_NH FOREIGN KEY(MaNamHoc)	REFERENCES NAMHOC(MaNamHoc)
)
-----------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE KQ_CA_NAM_MON_HOC
(
	MaSINHVIEN	VARCHAR (6)		NOT NULL,
	MaLop		VARCHAR (10)	NOT NULL,
	MaMonHoc	VARCHAR (6)		NOT NULL,
	MaNamHoc	VARCHAR (6)		NOT NULL,
	DiemThiLai	FLOAT,
	DTBCaNam	FLOAT			NOT NULL,	-- Cua tung mon
	
	PRIMARY KEY(MaSINHVIEN, MaLop, MaMonHoc, MaNamHoc),
	
	-- (4 khoa ngoai)
	CONSTRAINT F_KQCNMH_HS 	FOREIGN KEY(MaSINHVIEN)		REFERENCES SINHVIEN(MaSINHVIEN) ,
	CONSTRAINT F_KQCNMH_LOP	FOREIGN KEY(MaLop)			REFERENCES LOP(MaLop) ,
	CONSTRAINT F_KQCNMH_MH 	FOREIGN KEY(MaMonHoc)		REFERENCES MONHOC(MaMonHoc) ,
	CONSTRAINT F_KQCNMH_NH	FOREIGN KEY(MaNamHoc)		REFERENCES NAMHOC(MaNamHoc)
)
-----------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE KQ_HOC_KY_TONG_HOP
(
	MaSINHVIEN	VARCHAR (6)		NOT NULL,
	MaLop		VARCHAR (10)	NOT NULL,
	MaHocKy		VARCHAR (4)		NOT NULL,
	MaNamHoc	VARCHAR (6)		NOT NULL,
	MaHocLuc	VARCHAR (6)		NOT NULL,
	MaHanhKiem	VARCHAR (6)		NOT NULL,
	DTBMonHocKy	FLOAT,						-- Cua tat ca cac mon
	
	PRIMARY KEY(MaSINHVIEN, MaHocKy, MaLop, MaNamHoc),
	
	-- (6 khoa ngoai)
	CONSTRAINT F_KQHK_HS	FOREIGN KEY(MaSINHVIEN)		REFERENCES SINHVIEN(MaSINHVIEN),
	CONSTRAINT F_KQHK_LOP	FOREIGN KEY(MaLop)			REFERENCES LOP(MaLop),
	CONSTRAINT F_KQHK_HK	FOREIGN KEY(MaHocKy)		REFERENCES HOCKY(MaHocKy),
	CONSTRAINT F_KQHK_NH	FOREIGN KEY(MaNamHoc)		REFERENCES NAMHOC(MaNamHoc),
	CONSTRAINT F_KQHK_HL	FOREIGN KEY(MaHocLuc)		REFERENCES HOCLUC(MaHocLuc),
	CONSTRAINT F_KQHK_HKIEM	FOREIGN KEY(MaHanhKiem)		REFERENCES HANHKIEM(MaHanhKiem) 
)
-----------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE KQ_CA_NAM_TONG_HOP
(
	MaSINHVIEN	VARCHAR (6)		NOT NULL,
	MaLop		VARCHAR (10)	NOT NULL,
	MaNamHoc	VARCHAR (6)		NOT NULL,
	MaHocLuc	VARCHAR (6)		NOT NULL,
	MaHanhKiem	VARCHAR (6)		NOT NULL,
	DTBCaNam	FLOAT			NOT NULL,	-- Cua tat ca cac mon
	MaKetQua	VARCHAR (6)		NULL,
	
	PRIMARY KEY(MaSINHVIEN, MaLop, MaNamHoc),
	
	-- (6 khoa ngoai)
	CONSTRAINT F_KQCN_HS	FOREIGN KEY(MaSINHVIEN)		REFERENCES SINHVIEN(MaSINHVIEN) ,
	CONSTRAINT F_KQCN_LOP	FOREIGN KEY(MaLop)			REFERENCES LOP(MaLop) ,
	CONSTRAINT F_KQCN_NH	FOREIGN KEY(MaNamHoc)		REFERENCES NAMHOC(MaNamHoc) ,
	CONSTRAINT F_KQCN_HL	FOREIGN KEY(MaHocLuc)		REFERENCES HOCLUC(MaHocLuc) ,
	CONSTRAINT F_KQCN_HKIEM	FOREIGN KEY(MaHanhKiem)		REFERENCES HANHKIEM(MaHanhKiem) ,
	CONSTRAINT F_KQCN_KQ	FOREIGN KEY(MaKetQua)		REFERENCES KETQUA(MaKetQua)
)
--===================================================================================================================================================

CREATE TABLE QUYDINH
(
	TuoiCanDuoi		INT		NOT NULL,
	TuoiCanTren		INT		NOT NULL,
	SiSoCanDuoi		INT		NOT NULL,
	SiSoCanTren		INT		NOT NULL,
	ThangDiem		INT		NOT NULL,
	TenTruong		NVARCHAR (100),
	DiaChiTruong	NVARCHAR (100)
)
INSERT INTO QUYDINH VALUES(15, 20, 30, 40, 10, 'THPT My Thoi', '79 Tran Hung Dao - TPLX')
--===================================================================================================================================================


SELECT * FROM DANTOC --
SELECT * FROM DIEM--
SELECT * FROM GIANGVIEN --
SELECT * FROM HANHKIEM  --
SELECT * FROM HOCKY  --
SELECT * FROM HOCLUC  --
SELECT * FROM HOCVI --
SELECT * FROM KETQUA --
SELECT * FROM KHOA --
SELECT * FROM LOAIDIEM --
SELECT * FROM LOAIGIANGVIEN --
SELECT * FROM LOAINGUOIDUNG --
SELECT * FROM LOP
SELECT * FROM MONHOC --
SELECT * FROM NAMHOC --
SELECT * FROM NGHENGHIEP  --
SELECT * FROM NGUOIDUNG
SELECT * FROM PHANCONG
SELECT * FROM SINHVIEN
SELECT * FROM TONGIAO  --

Select MaGiangVien, TenGiangVien, GioiTinh, DiaChi, DienThoai, TenMonhoc, TenHocVi, TenLoaiGV From GiangVien, HocVi, LoaiGiangVien, MonHoc 

SELECT MaMonHoc, TenMonHoc, SoTiet, TenKhoa FROM KHOA K, MONHOC M WHERE M.MaKhoa = K.MaKhoa

select MaKhoa from Khoa where TenKhoa = N'Khoa Công Nghệ Thông Tin'
