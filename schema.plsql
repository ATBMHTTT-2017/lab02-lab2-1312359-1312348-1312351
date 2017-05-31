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
create user lab2dba identified by 12345;
grant dba to lab2dba;

connect lab2dba/12345;

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
insert into PHONGBAN values ('PB05','Phong Ban 5',null,null,10,'CN03');
insert into PHONGBAN values ('PB06','Phong Ban 6',null,null,10,'CN03');
insert into PHONGBAN values ('PB07','Phong Ban 7',null,null,10,'CN04');
insert into PHONGBAN values ('PB08','Phong Ban 8',null,null,10,'CN04');
insert into PHONGBAN values ('PB09','Phong Ban 9',null,null,10,'CN05');
insert into PHONGBAN values ('PB10','Phong Ban 10',null,null,10,'CN05');

insert into NHANVIEN values ('NV01','Nguyen Van A','80 Tran Hung Dao','01585412','dsbrsvb@gmail.com','PB01','CN01',500000);
insert into NHANVIEN values ('NV02','Nguyen Van B','63 Nguyen Van Cu','0615512','gfngfb@gmail.com','PB01','CN01',700000);
insert into NHANVIEN values ('NV03','Nguyen Van C','106 Nguyen Trai','0331155','sbhgdmf@gmail.com','PB01','CN01',950000);
insert into NHANVIEN values ('NV04','Tran Thi D','70 Ngo Quyen','0321661','dfnbgft@gmail.com','PB01','CN01',400000);
insert into NHANVIEN values ('NV05','Tran Thi E','60 Ba Huyen Thanh Quan','0636216','yfcsb@gmail.com','PB01','CN01',350000);
insert into NHANVIEN values ('NV06','Tran Thi F','91 Dien Bien Phu','01155441','qwewbv@gmail.com','PB02','CN01',1000000);
insert into NHANVIEN values ('NV07','Vu Van G','108 Hai Thuong Lan Ong','01515588','vcnhrhrt@gmail.com','PB02','CN01',200000);
insert into NHANVIEN values ('NV08','Vu Van H','9 Ly Thuong Kiet','0616919','y6dfbfd@gmail.com','PB02','CN01',750000);
insert into NHANVIEN values ('NV09','Luong The I ','103 Nguyen Cu Trinh','01166236','abdsbr@gmail.com','PB02','CN01',650000);
insert into NHANVIEN values ('NV10','Luong The J','99 Tran Man Dat','03881825','hgmhgf@gmail.com','PB02','CN01',500000);
insert into NHANVIEN values ('NV11','Luong The K','335 Tran Man Dat','3254364','dsbsdsd@gmail.com','PB03','CN02',550000);
insert into NHANVIEN values ('NV12','Luong The L','15 Truong Chinh','465373','brsbs@gmail.com','PB03','CN02',530000);
insert into NHANVIEN values ('NV13','To Thi M','60 Ho Chi Minh','43764745','qwfdasv@gmail.com','PB03','CN02',520000);
insert into NHANVIEN values ('NV14','To Thi N','8 Nguyen Hue','643543734','bsdvcx@gmail.com','PB03','CN02',600000);
insert into NHANVIEN values ('NV15','To Thi O','35 Quang Trung','235436','abrss@gmail.com','PB03','CN02',6500000);
insert into NHANVIEN values ('NV16','To Thi P','106 Bach Dang','32643643','bdfn@gmail.com','PB04','CN02',460000);
insert into NHANVIEN values ('NV17','To Thi Q','153 Vo Thi Sau','43543724','gfnrw@gmail.com','PB04','CN02',950000);
insert into NHANVIEN values ('NV18','To Thi R','108 Ly Thai To','2463454','assav@gmail.com','PB04','CN02',1000000);
insert into NHANVIEN values ('NV19','To Thi S','45 Ly Thuong Kiet','34654745','sdbdnd@gmail.com','PB04','CN02',800000);
insert into NHANVIEN values ('NV20','Duong Chi T','120 Tay Bac','636436','sdbdsc@gmail.com','PB04','CN02',700000);
insert into NHANVIEN values ('NV21','Duong Chi U','15 Vu Sam','7436753','wqdvav@gmail.com','PB05','CN03',200000);
insert into NHANVIEN values ('NV22','Duong Chi V','96 Quoc Lo 1','6437658','dbsdfs@gmail.com','PB05','CN03',300000);
insert into NHANVIEN values ('NV23','Duong Chi W','225 Co Bac','43543745','sdbdswe@gmail.com','PB05','CN03',500000);
insert into NHANVIEN values ('NV24','Duong Chi X','103 Hai Ba Trung','34675465','advqv@gmail.com','PB05','CN03',750000);
insert into NHANVIEN values ('NV25','Duong Chi Y','62 Le Loi','253463','asvdsb@gmail.com','PB05','CN03',960000);
insert into NHANVIEN values ('NV26','Duong Chi Z','105 Hoang Van Thu','214342','dsvdsb@gmail.com','PB08','CN04',640000);
insert into NHANVIEN values ('NV27','Hoang Van ZZ','62 Ly Tu Trong','325234','fbfd@gmail.com','PB08','CN04',480000);
insert into NHANVIEN values ('NV28','Hoang Van ZZ','109 Tan Da','12532523','fdsdsb@gmail.com','PB09','CN05',190000);
insert into NHANVIEN values ('NV29','Hoang Van ZZ','16 Mac Dinh Chi','546533','sdcdsbgf@gmail.com','PB09','CN05',350000);


insert into DUAN values ('DA01','Du An 1',1000000,'PB01','NV01');
insert into DUAN values ('DA02','Du An 2',2000000,'PB02','NV07');
insert into DUAN values ('DA03','Du An 3',3000000,'PB03','NV13');
insert into DUAN values ('DA04','Du An 4',4000000,'PB04','NV17');
insert into DUAN values ('DA05','Du An 5',5000000,'PB05','NV22');

insert into PHANCONG values ('NV02','DA01','Tester',50000);
insert into PHANCONG values ('NV08','DA02','Tester',250000);
insert into PHANCONG values ('NV14','DA03','Developer',150000);
insert into PHANCONG values ('NV18','DA04','Developer',100000);
insert into PHANCONG values ('NV23','DA05','Coder',350000);

insert into CHITIEU values ('CT01','ChiTieu1',300000,'DA01');
insert into CHITIEU values ('CT02','ChiTieu1',200000,'DA02');
insert into CHITIEU values ('CT03','ChiTieu1',700000,'DA03');
insert into CHITIEU values ('CT04','ChiTieu1',500000,'DA04');
insert into CHITIEU values ('CT05','ChiTieu1',800000,'DA05');

update PHONGBAN set truongPhong='NV03' where MAPHONG='PB01';
update PHONGBAN set truongPhong='NV06' where MAPHONG='PB02';
update PHONGBAN set truongPhong='NV15' where MAPHONG='PB03';
update PHONGBAN set truongPhong='NV16' where MAPHONG='PB04';
update PHONGBAN set truongPhong='NV21' where MAPHONG='PB05';
update PHONGBAN set truongPhong='NV27' where MAPHONG='PB08';
update PHONGBAN set truongPhong='NV29' where MAPHONG='PB09';

update CHINHANH set truongChiNhanh ='NV05' where MACN='CN01';
update CHINHANH set truongChiNhanh ='NV11' where MACN='CN02';
update CHINHANH set truongChiNhanh ='NV25' where MACN='CN03';
update CHINHANH set truongChiNhanh ='NV26' where MACN='CN04';
update CHINHANH set truongChiNhanh ='NV28' where MACN='CN05';
