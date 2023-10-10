--Yorum Satiri
/*
Java daki coklu yorum satiri 
*/

----------------------DAY'1 DT---------------------
--1-Database olusturma DDL
CREATE DATABASE deneme;

--2-database silme 
DROP DATABASE deneme;

--3-tablo olusturma 
CREATE TABLE workers1(

	id CHAR(4),
	name VARCHAR(50),
	job VARCHAR(50),
	salary numeric,
	register_date DATE
);

SELECT * FROM workers;

INSERT INTO workers VALUES(1001,'Esref Igdelioglu','Montaj ustasi',4.500,'2002-4-13');
INSERT INTO workers VALUES(1002,'Nihat Demir','Montaj ustasi',4.500,'2003-12-23');
INSERT INTO workers VALUES(1003,'Ismail Abi','Atolye ustasi',5000,'1995-3-4');
INSERT INTO workers VALUES(1004,'Alparslan Abi','Atolye ustasi',5000,'2004-3-5');
INSERT INTO workers(id,name,job) VALUES(1005,'Mustafa Abi','Montaj elemani');

SELECT name,salary FROM workers;

SELECT job FROM workers;


SELECT * FROM workers1

INSERT INTO workers1(salary) VALUES(4.500);


---------------------------------------

/*------------------------------------
ÖDEVV:)
1) Tablo Oluşturma

"tedarikciler" isminde bir tablo olusturun,
"tedarikci_id", "tedarikci_ismi", "tedarikci_adres"
ve "ulasim_tarihi"	field'lari olsun. 

2) Var olan tablodan yeni tablo olusturmak 
 "tedarikci_info" isminde bir tabloyu  "tedarikciler" tablosundan olusturun.
Icinde "tedarikci_ismi", "ulasim_tarihi" field'lari olsun

3) Data ekleme
" ogretmenler" isminde tablo olusturun.
 Icinde "kimlik_no", "isim", "brans" ve "cinsiyet" field'lari olsun.
"ogretmenler" tablosuna bilgileri asagidaki gibi olan kisileri ekleyin.
kimlik_no: 234431223, isim: Ayse Guler, brans : Matematik, cinsiyet: kadin.
kimlik_no: 234431224, isim: Ali Guler, brans : Fizik, cinsiyet: erkek.

4) bazı fieldları olan kayıt ekleme
"ogretmenler" tablosuna bilgileri asagidaki gibi olan bir kisi ekleyin.
kimlik_no: 567597624, isim: Veli Guler
-------------------------------------*/














