CREATE TABLE ogrenciler(
id integer PRIMARY KEY,
	isim varchar(50),
	adres varchar(100),
	sinav_notu integer
);

--veya 


CREATE TABLE ogrenciler(
id integer PRIMARY KEY,
	isim varchar(50),
	adres varchar(100),
	sinav_notu integer,
	CONSTRAINT std_pk PRIMARY KEY(id)
);

--2 PK olursa : 

CREATE TABLE ogrenciler(
id integer PRIMARY KEY,
	isim varchar(50),
	adres varchar(100),
	sinav_notu integer,
	CONSTRAINT composite_pk PRIMARY KEY(id,isim)
);

/*

Niye Composite PK ya ihtiyacim var ???


2023064120 gibi composite PK dusunelim
2023 --> ogrencinin kayit oldugu yil
064 --> Bolum adi
120 --> Kayit sirasi

*/

--Sinav notunun 0 100 arasinda olmasi
CREATE TABLE ogrenciler(
id integer PRIMARY KEY,
	isim varchar(50),
	adres varchar(100),
	sinav_notu integer CHECK(sinav_notu <0 AND sinav_notu<100)
);

-- Tabloma veri ekleme
INSERT INTO ogrenciler values(1,'Betul Kuyucu','Istanbul',80);

INSERT INTO ogrenciler (id,isim,adres,sinav_notu) values
         (2,'Zeki Bey','Izmir',90),
          (3,'Cemal Dogan','Trabzon',65),
		  (4,'Mirac','Bursa',45),
		  (5,'Yavuz Bal','Antalya',55);
		  
INSERT INTO ogrenciler (id,isim,sinav_notu) VALUES
(6,'Bilal Degirmen',95),
(7,'Fahri Ersoz',92);

SELECT * FROM ogrenciler;

-- SORU1 : ogrenciler tablosuhdkai id ve isim bilgileri ile tum recordlari getirelim

SELECT id,isim FROM ogrenciler

--SORU2 : SInav notu 80 den buyuk olan ogrencilerin tum bilgilerini listele

SELECT * FROM ogrenciler WHERE sinav_notu>80;

-- SORU3 : Adresi Ankara olan ogrencilerin tum bilgilerini listele

SELECT * FROM ogrenciler WHERE adres = 'Ankara';

SELECT isim FROM ogrenciler WHERE adres = 'Istanbul' AND sinav_notu = 80;

--SORU5 : Sinav notu 55 veya 100 olan ogrencilerin tum bilgilerini listele

SELECT * FROM ogrenciler WHERE sinav_notu = 55 or sinav_notu=100;

--2.yol
SELECT * FROM ogrenciler WHERE sinav_notu in (55,100);

--SORU6 : Sinav notu 65 ve 85 arasinda olan ogrencilerin tum bilgilerini listele

SELECT * FROM ogrenciler WHERE sinav_notu BETWEEN 65 AND 85;

--SORU7 : id'si 3 ve 5 arasinda olmayan ogrencilerin isim ve sinav notu listele

SELECT * FROM ogrenciler WHERE id NOT BETWEEN 3 AND 5;

--SORU8 : EN yuksek sinav puani nedir

SELECT MAX(sinav_notu) FROM ogrenciler

--SORU9 : Izmir de yasayan ve sinav notu 50'den yuksek olan ogrecilerin listesi

SELECT * FROM ogrenciler WHERE adres = 'Izmir' AND sinav_notu > 50;

--SORU10: Ogrenci sayisi ve ortalama sinav notu
SELECT COUNT(*),AVG(sinav_notu) FROM ogrenciler;

SELECT COUNT(*), ROUND(AVG(sinav_notu),1) FROM ogrenciler;

--SORU11 : sinav notu 52 olan satiri siliniz

DELETE FROM ogrenciler WHERE sinav_notu = 52;

--SORU12 : ismi Derya Soylu veya Yavuz Bal olan satiri siliniz
DELETE FROM ogrenciler WHERE isim = 'Derya Soylu' OR isim = 'Yavuz Bal';
DELETE FROM ogrenciler WHERE isim IN('Derya Soylu','Cemal Dogan');

--SORU13 : Ogrenciler tablosunun icerigini siliniz

DROP FROM ogrenciler--condition vardir Daha yavas koullari kontrol eder
TRUNCATE TABLE ogrenciler--conditon yoktur Daha hizli direk kosul bakmadan siler 
--SORU14: Ogrenciler Tablosunu siliniz

DROP TABLE ogrenciler


















