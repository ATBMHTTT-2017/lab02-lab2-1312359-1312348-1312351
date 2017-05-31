/*Tao user tuong ung maNV*/
alter session set "_ORACLE_SCRIPT"= true;
create user NV01 identified by NV01;
create user NV02 identified by NV02;
create user NV03 identified by NV03;
create user NV04 identified by NV04;
create user NV05 identified by NV05;
create user NV06 identified by NV06;
create user NV07 identified by NV07;
create user NV08 identified by NV08;
create user NV09 identified by NV09;
create user NV10 identified by NV10;
create user NV11 identified by NV11;
create user NV12 identified by NV12;
create user NV13 identified by NV13;
create user NV14 identified by NV14;
create user NV15 identified by NV15;
create user NV16 identified by NV16;
create user NV17 identified by NV17;
create user NV18 identified by NV18;
create user NV19 identified by NV19;
create user NV20 identified by NV20;
create user NV21 identified by NV21;
create user NV22 identified by NV22;
create user NV23 identified by NV23;
create user NV24 identified by NV24;
create user NV25 identified by NV25;
create user NV26 identified by NV26;
create user NV27 identified by NV27;
create user NV28 identified by NV28;
create user NV29 identified by NV29;

/*Cap quyen connect cho tat ca user*/
grant connect to public;

/*Gan role cho user*/
grant role_TruongPhong to NV03, NV06, NV15, NV16, NV21, NV27, NV29;
grant role_TruongChiNhanh to NV05, NV11, NV25, NV26, NV28;
grant role_TruongDuAn to NV01, NV07, NV13, NV19, NV23;
grant role_GiamDoc to NV04, NV08, NV12, NV18, NV22;
grant role_NhanVien to NV02, NV09, NV10, NV14, NV17, NV20, NV24;
