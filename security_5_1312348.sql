
/*Tao package ma hoa gom 2 ham ma hoa va giai ma*/
create or replace package luong_crypt IS
  function pack_encrypt(input_data in varchar2,pass in varchar2) return raw deterministic;
  function pack_decrypt(input_data in raw,pass in varchar2) return varchar2 deterministic;
end luong_crypt;


/*Ham ma hoa va giai ma*/
create or replace package body luong_crypt is 
  function pack_encrypt(input_data in varchar2,pass in varchar2) return raw deterministic
  is
  	encrypted_raw raw(2000);
  begin
       encrypted_raw := dbms_crypto.encrypt(
          src => utl_raw.cast_to_raw(input_data),
          typ => DBMS_CRYPTO.ENCRYPT_DES+DBMS_CRYPTO.CHAIN_CBC+DBMS_CRYPTO.PAD_PKCS5,
          key => utl_raw.cast_to_raw(pass)
      );
      return encrypted_raw;
  end pack_encrypt;
  
  function pack_decrypt(input_data in raw,pass in varchar2) return varchar2 deterministic
  is
    decrypted_raw raw(2000);
    output varchar2(50);
  begin
       decrypted_raw := dbms_crypto.decrypt(
          src => input_data,
          typ => DBMS_CRYPTO.ENCRYPT_DES+DBMS_CRYPTO.CHAIN_CBC+DBMS_CRYPTO.PAD_PKCS5,
          key => utl_raw.cast_to_raw(pass)
      );
      output := utl_raw.cast_to_varchar2(decrypted_raw);
      return output;
  end pack_decrypt;
end luong_crypt;

/*Tao ham xem luong de moi nhan vien duoc phep xem luong cua minh*/
create or replace procedure XemLuong
as
  user_login varchar2(50);
  output raw(200);
  luong_output varchar2(50);
begin
  user_login:=SYS_CONTEXT('userenv','SESSION_USER');
  user_login:=lower(user_login);
  select luong into output
  from lab2dba.nhanvien where maNV=user_login;
  luong_output := luong_crypt.pack_decrypt(output,user_login||user_login);
  DBMS_OUTPUT.PUT_LINE('Luong cua ban than= '||luong_output);
end XemLuong;

/*cap nhat luong da ma hoa cho bang nhan vien*/
update NHANVIEN set luong=luong_crypt.pack_encrypt(LUONG,MANV||MANV);

/*gan ham Ma Hoa va xem luong cho role NhanVien*/
set serveroutput on;
grant execute on lab2dba.XemLuong to role_NhanVien;
grant execute on lab2dba.luong_crypt to role_NhanVien;

/*test*/
--conn nv09/nv09; Voi nv09 co trong role Nhan Vien
set serveroutput on;
exec lab2dba.luongcanhan;