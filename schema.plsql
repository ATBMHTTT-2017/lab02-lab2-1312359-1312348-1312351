// this is sample schema
/*
Drop table NHANVIEN CASCADE CONSTRAINTS;
Drop table CHINHANH CASCADE CONSTRAINTS;
Drop table PHONGBAN CASCADE CONSTRAINTS;
Drop table PHANCONG;
Drop table CHITIEU;
Drop table DUAN;
*/

/*Tao user*/
alter session set "_ORACLE_SCRIPT"=true;
create user lab2 identified by test123;
grant all privileges to lab2;

connect lab2/test123;

/*Tao bang*/
create table NHANVIEN(
maNV VARCHAR2(4),
hoTen VARCHAR2(50),
diaChi VARCHAR2(50),
dienThoai VARCHAR2(50),
email VARCHAR2(50),
maphong VARCHAR2(4),
chiNhanh VARCHAR2(4),
luong number,

Primary Key(maNV)
);

Create table CHINHANH(
maCN varchar2(4), 
tenCN varchar2(50),
truongChiNhanh varchar2(4),

Primary Key (maCN)
);

Create table DUAN(
maDA varchar2(4),
tenDA varchar2(50),
kinhPhi number,
phongChuTri varchar2(4),
truongDA varchar2(4),

Primary Key (maDA)
);

Create table PHONGBAN (
maPhong varchar2(4),
tenPhong varchar2(50),
truongPhong varchar2(4),
ngayNhanChuc date,
soNhanVien number,
chiNhanh varchar2(4),

Primary Key (maPhong)
);

Create table CHITIEU(
maChiTieu varchar2(4),
tenChiTieu varchar2(50),
soTien number,
duAn varchar2(4),

Primary Key (maChiTieu)
);

Create table PHANCONG(
maNV varchar2(4),
duAn varchar2(4),
vaiTro varchar2(50),
phuCap number,

Primary Key (maNV,duAn)
);

Alter table NHANVIEN add foreign key (maPhong) references PHONGBAN(maPhong);
Alter table NHANVIEN add foreign key (chiNhanh) references CHINHANH(maCN);
Alter table CHINHANH add foreign key (truongChiNhanh) references NHANVIEN(maNV);
Alter table PHONGBAN add foreign key (truongPhong) references NHANVIEN(maNV);
Alter table PHONGBAN add foreign key (chiNhanh) references CHINHANH(maCN);
Alter table DUAN add foreign key (phongChuTri) references PHONGBAN(maPhong);
Alter table DUAN add foreign key (truongDA) references NHANVIEN(maNV);
Alter table CHITIEU add foreign key (duAn) references DUAN(maDA);
Alter table PHANCONG add foreign key (maNV) references NHANVIEN(maNV);
Alter table PHANCONG add foreign key (duAn) references DUAN(maDA);


/*Them du lieu vao bang*/
insert into CHINHANH values ('CN01','Chi Nhanh 1',null);
insert into CHINHANH values ('CN02','Chi Nhanh 2',null);
insert into CHINHANH values ('CN03','Chi Nhanh 3',null);
insert into CHINHANH values ('CN04','Chi Nhanh 4',null);
insert into CHINHANH values ('CN05','Chi Nhanh 5',null);

insert into PHONGBAN values ('PB01','Phong Ban 1',null,null,10,'CN01');
insert into PHONGBAN values ('PB02','Phong Ban 2',null,null,10,'CN01');
insert into PHONGBAN values ('PB03','Phong Ban 3',null,null,10,'CN02');
insert into PHONGBAN values ('PB04','Phong Ban 4',null,null,10,'CN02');
insert into PHONGBAN values ('PB05','Phong Ban 5',null,null,10,'CN02');
insert into PHONGBAN values ('PB06','Phong Ban 6',null,null,10,'CN03');
insert into PHONGBAN values ('PB07','Phong Ban 7',null,null,10,'CN03');
insert into PHONGBAN values ('PB08','Phong Ban 8',null,null,10,'CN04');
insert into PHONGBAN values ('PB09','Phong Ban 9',null,null,10,'CN05');
insert into PHONGBAN values ('PB10','Phong Ban 10',null,null,10,'CN05');

insert into NHANVIEN values ('NV01','Nguyen Van A','80 Tran Hung Dao','01585412','dsbrsvb@gmail.com','PB01','CN01',500000);
insert into NHANVIEN values ('NV02','Nguyen Van B','63 Nguyen Van Cu','0615512','gfngfb@gmail.com','PB01','CN01',700000);
insert into NHANVIEN values ('NV03','Nguyen Van C','106 Nguyen Trai','0331155','sbhgdmf@gmail.com','PB02','CN01',950000);
insert into NHANVIEN values ('NV04','Tran Thi D','70 Ngo Quyen','0321661','dfnbgft@gmail.com','PB02','CN01',400000);
insert into NHANVIEN values ('NV05','Tran Thi E','60 Ba Huyen Thanh Quan','0636216','yfcsb@gmail.com','PB04','CN02',350000);
insert into NHANVIEN values ('NV06','Tran Thi G','91 Dien Bien Phu','01155441','qwewbv@gmail.com','PB04','CN02',1000000);
insert into NHANVIEN values ('NV07','Vu Van H','108 Hai Thuong Lan Ong','01515588','vcnhrhrt@gmail.com','PB07','CN03',200000);
insert into NHANVIEN values ('NV08','Vu Van I','9 Ly Thuong Kiet','0616919','y6dfbfd@gmail.com','PB07','CN03',750000);
insert into NHANVIEN values ('NV09','Luong The K ','103 Nguyen Cu Trinh','01166236','abdsbr@gmail.com','PB08','CN05',650000);
insert into NHANVIEN values ('NV10','Luong The L','99 Tran Man Dat','03881825','hgmhgf@gmail.com','PB08','CN05',500000);

insert into DUAN values ('DA01','Du An 1',1000000,'PB01','NV01');
insert into DUAN values ('DA02','Du An 2',2000000,'PB02','NV03');
insert into DUAN values ('DA03','Du An 3',3000000,'PB04','NV05');
insert into DUAN values ('DA04','Du An 4',4000000,'PB07','NV07');
insert into DUAN values ('DA05','Du An 5',5000000,'PB08','NV09');

insert into PHANCONG values ('NV02','DA01','Tester',50000);
insert into PHANCONG values ('NV04','DA02','Tester',250000);
insert into PHANCONG values ('NV06','DA03','Developer',150000);
insert into PHANCONG values ('NV08','DA04','Developer',100000);
insert into PHANCONG values ('NV10','DA05','Coder',350000);

insert into CHITIEU values ('CT01','ChiTieu1',300000,'DA01');
insert into CHITIEU values ('CT02','ChiTieu1',200000,'DA02');
insert into CHITIEU values ('CT03','ChiTieu1',700000,'DA03');
insert into CHITIEU values ('CT04','ChiTieu1',500000,'DA04');
insert into CHITIEU values ('CT05','ChiTieu1',800000,'DA05');

update PHONGBAN set truongPhong='NV01' where MAPHONG='PB01';
update PHONGBAN set truongPhong='NV03' where MAPHONG='PB02';
update PHONGBAN set truongPhong='NV05' where MAPHONG='PB04';
update PHONGBAN set truongPhong='NV07' where MAPHONG='PB07';
update PHONGBAN set truongPhong='NV09' where MAPHONG='PB08';

update CHINHANH set truongChiNhanh ='NV03' where MACN='CN01';
update CHINHANH set truongChiNhanh ='NV05' where MACN='CN02';
update CHINHANH set truongChiNhanh ='NV08' where MACN='CN03';
update CHINHANH set truongChiNhanh ='NV10' where MACN='CN05';
