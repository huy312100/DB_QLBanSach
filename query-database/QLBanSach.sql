create database QLBanSach;
use QLBanSach;

create table if not exists KhachHang(
	MaKH varchar(36),
    HoTen varchar(255) not null,
    NgaySinh date not null,
    GioiTinh bit,
    DienThoai varchar(10),
    TaiKhoan varchar(50) unique not null,
    MatKhau varchar(50) not null,
    Email varchar(50),
    DiaChi varchar(255),
    primary key(MaKH)
);

create table if not exists DonHang(
	MaDonHang varchar(36),
	NgayGiao date not null,
    NgayDat date not null,
    TinhTrangGH varchar(50),
    DaThanhToan bool not null,
    MaKH varchar(36),
    primary key(MaDonHang)
);

create table if not exists ChiTietDonHang(
	MaDonHang varchar(36),
    MaSach varchar(36),
    SoLuong int not null,
    DonGia float not null,
    primary key(MaDonHang,MaSach)
);

create table if not exists Sach(
	MaSach varchar(36),
    TenSach varchar(255) not null,
    GiaSach float,
    MoTa varchar(255),
    AnhBia varchar(500),
    NgayCapNhat date,
    SoLuongTon int,
    MaChuDe varchar(36),
    MaNSX varchar(36),
    primary key(MaSach)
);

create table if not exists Sach_TacGia(
	MaSach varchar(36),
    MaTacGia varchar(36),
    VaiTro varchar(255),
    ViTri varchar(255),
    primary key(MaSach,MaTacGia)
);

create table if not exists TacGia(
	MaTacGia varchar(36),
    TenTacGia varchar(255) not null,
    TieuSu text,
	DienThoai varchar(10),
	DiaChi varchar(255),
    primary key(MaTacGia)
);

create table if not exists ChuDe(
	MaChuDe varchar(36),
    TenChuDe varchar(255) not null,
    primary key(MaChuDe)
);

create table if not exists NhaXuatBan(
	MaNSX varchar(36),
    TenNSB varchar(255) not null,
	DienThoai varchar(10),
	DiaChi varchar(255),
    primary key(MaNSX)
);

-- Create freign key
alter table DonHang
	add constraint FK_DonHangToKhachHang
    foreign key (MaKH) 
    references KhachHang(MaKH);

alter table ChiTietDonHang
	add constraint FK_ChiTietDonHangToDonHang
    foreign key (MaDonHang) 
    references DonHang(MaDonHang); 
    
alter table ChiTietDonHang
	add constraint FK_ChiTietDonHangToSach
    foreign key (MaSach) 
    references Sach(MaSach);
    
alter table Sach
	add constraint FK_SachToNhaXuatBan
    foreign key (MaNSX) 
    references NhaXuatBan(MaNSX); 
    
alter table Sach
	add constraint FK_SachToChuDe
    foreign key (MaChuDe) 
    references ChuDe(MaChuDe);    
    
alter table Sach_TacGia
	add constraint FK_SachTacGiaToSach
    foreign key (MaSach) 
    references Sach(MaSach);    

alter table Sach_TacGia
	add constraint FK_SachTacGiaToTacGia
    foreign key (MaTacGia) 
    references TacGia(MaTacGia);    
