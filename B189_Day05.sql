------------DAY'5 NT-------------
/*
CREATE:INSERT
READ:SELECT
UPDATE:UPDATE
DELETE:DELETE
*/
--CREATE:INSERT
--  READ:SELECT
--UPDATE:?
--DELETE:DELETE
--26-UPDATE ..
   --SET sütunadı=yeni değer
   --WHERE koşul            :koşulu sağlayan satırlardaki dataları değiştirir, günceller

--26-UPDATE 
--.. SET sutunAdi = yeni deger
--.. WHERE kosul             :kosulu saglayan satirlardaki datalari degistirir , gunceller

--id si verilern calisanin isyeri ismini trendyol olarak guncelleyin
UPDATE calisanlar3 
SET isyeri='Trendyol'
WHERE id =123456789;

-- id’si 567890123 olan çalışanın ismini 'Veli Yıldırım' ve
--sehirini 'Bursa' olarak güncelleyiniz.

UPDATE calisanlar3
SET isim='Veli Yildirim',sehir = 'Bursa'
WHERE id=567890123

-- markalar tablosundaki marka_id degeri 102 ye esit veya buyuk olanlarin marka_id sini 2 ile carparak degistirin

UPDATE markalar
SET marka_id=marka_id*2
WHERE marka_id>=102

--markalar tablosundaki tum markalarin calisan_sayisi degerlerini marka_id ile toplayarak guncelleyiniz
UPDATE markalar
SET calisan_sayisi=calisan_sayisi+marka_id

--calisanlar3 tablosundan Ali Seker in isyerini Veli Yildirim in isyeri ismi ile guncelleyiniz

UPDATE calisanlar3
SET isyeri=(SELECT isyeri FROM calisanlar3 WHERE isim='Veli Yildirim')
WHERE isim = 'Ali Seker'

--calisanlar3 tablosunda maasi 1500 olanların isyerini, markalar tablosunda
--calisan_sayisi 20000 den fazla olan markanın ismi ile değiştiriniz.

UPDATE calisanlar3
SET isyeri = (SELECT marka_isim FROM markalar WHERE calisan_sayisi>2000)
WHERE maas=1500;

--calisanlar3 tablosundaki isyeri 'Vakko olanlarin sehir bilgisinin sonuna ' Subesi' ekleyiniz

UPDATE calisanlar3
SET sehir= sehir||' Subesi'
WHERE isyeri = 'Vakko'

--alternatif
UPDATE calisanlar3
SET sehir = sehir||' Subesi'
WHERE isyeri = 'Vakko'


SELECT * FROM markalar;
SELECT * FROM calisanlar3;





--27-IS NULL condition
CREATE TABLE people
(
ssn char(9),
name varchar(50),
address varchar(50)
);
INSERT INTO people VALUES(123456789, 'Ali Can', 'Istanbul');
INSERT INTO people VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO people VALUES(345678901, 'Mine Bulut', 'Izmir');
INSERT INTO people (ssn, address) VALUES(456789012, 'Bursa');
INSERT INTO people (ssn, address) VALUES(567890123, 'Denizli');
INSERT INTO people (ssn, name) VALUES(567890123, 'Veli Han');
SELECT * FROM people;

--people tablosundaki name sutunudak NULL olan degerleri listleyiniz

SELECT *
FROM people
WHERE name IS NULL

--people tablosundaki adres sutununda NULL olmayan degerleri listeleyiniz

SELECT *
FROM people
WHERE address IS NOT NULL
 
 
--people tablosunda name sutunu null olanlarin name degerini
--MISSING olarak guncelleyiniz

UPDATE people
SET name = 'MISSING'
WHERE name IS NULL;






--28-ORDER BY : kayitlari belirli bir veya daha fazla sutuna gore 
--varsayilan olarak NATURAL(artan,ASCENDING) sirali olarak siralamamizi saglar
--
CREATE TABLE person
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),
adres varchar(50)
);
INSERT INTO person VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO person VALUES(234567890, 'Veli','Cem', 'Ankara');
INSERT INTO person VALUES(345678901, 'Mine','Bulut', 'Ankara');
INSERT INTO person VALUES(256789012, 'Mahmut','Bulut', 'Istanbul');
INSERT INTO person VALUES (344678901, 'Mine','Yasa', 'Ankara');
INSERT INTO person VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');
INSERT INTO person VALUES(256789018, 'Samet','Bulut', 'Izmir');
INSERT INTO person VALUES(256789013, 'Veli','Cem', 'Bursa');
INSERT INTO person VALUES(256789010, 'Samet','Bulut', 'Ankara');
SELECT * FROM person;


SELECT *
FROM person
ORDER BY adres;--default:ASC:artan


SELECT *
FROM person
ORSER BY adres ASC;--okunabilirlik artar


--person tablosundaki tum kayitlari soyisime gore (azalan) siralayarak listeleyiniz

SELECT *
FROM person
ORDER BY soyisim DESC--DESCENDING : azalan

--person tablosundaki soyismi Bulut olanlari isime gore (azalan) siralayarak listeleyiniz

SELECT * 
FROM person
WHERE soyisim = 'Bulut'
ORDER BY isim DESC;


--alternatif
SELECT * 
FROM person
WHERE soyisim = 'Bulut'
ORDER BY 2 DESC;--not recommended : tavsiye edilmez

--person tablosundaki tum kayitlari Natural sirali Souisimler ters sirali olarak listeleyiniz

SELECT *
FROM person
ORDER BY isim ASC, soyisim DESC

--İsim ve soyisim değerlerini, soyisim kelime uzunluklarına göre sıralayarak listeleyiniz.

SELECT isim,soyisim,LENGTH(soyisim) AS karakter_sayisi
FROM person
ORDER BY LENGTH(soyisim)

--Tum isim ve soyisim degerlerini aralarinda bir bosluk ile ayni sutunda her bir isim ve 
--soyisim degrinin toplam uzunluguna gore siralayiniz

SELECT isim || ' ' ||soyisim ad_soyad
FROM person
ORDER BY LENGTH(isim)+LENGTH(soyisim)


SELECT isim || ' ' ||soyisim ad_soyad,LENGTH(isim||soyisim) karakter_sayisi
FROM person
ORDER BY LENGTH(isim||soyisim)

--calisanlar3 tablosunda maasi ortalama maastan yuksek olan calisanlarin
--isim,sehir ve maasalarini maasa gore artan siralyarak listeleyiniz

SELECT isim,sehir,maas
FROM calisanlar3
WHERE maas>(SELECT AVG(maas) FROM calisanlar3)
ORDER BY maas ASC
 




