---------------------------DAY'2 DT-----------
------TEKRAR-------
CREATE TABLE sairler(

id int,
	name varchar(50),
	email varchar(50)
);

SELECT * FROM sairler;

INSERT INTO sairler VALUES(1001,'Can Yucel','sair@mail.com');
INSERT INTO sairler VALUES(1001,'Neyzen Tefik','sair@gmail.com');
INSERT INTO sairler VALUES(1002,'','sair@gmail.com');
INSERT INTO sairler(name) VALUES('Polat Alemdar');


--9- tabloya UNIQU constraint ekleme

CREATE TABLE it_persons(

id SERIAL,
	name VARCHAR(50),
	email VARCHAR(50) UNIQUE,
	salary REAL,
	programming_lang VARCHAR(20)
);


SELECT * FROM it_persons;

INSERT INTO it_persons(name,email,salary,programming_lang)
VALUES('Abuzer Komurcu','dev@mail.com',5000,'Java');

INSERT INTO it_persons(name,email,salary,programming_lang)
VALUES('Sandor Clegaine','bloodyHound@mail.com',5000,'Java');

INSERT INTO it_persons(email,salary,programming_lang)
VALUES('developer2@mail.com',5000,'Java');


--10-tabloya NOT NULL constrainti ekleme
CREATE TABLE doctors(
id SERIAL,
	name VARCHAR(50) NOT NULL,
	email VARCHAR(50) UNIQUE,
	salary REAL


);

SELECT * FROM doctors;

INSERT INTO doctors(name,email,salary)VALUES('Dr.Gregory House','dr@mail',8000);
INSERT INTO doctors(email,salary) VALUES('doctor@mail.com',8000);--hata
INSERT INTO doctors(name,email,salary) VALUES('','doctor@mail.com',8000);--isim empty
--NOT NULL empty kabul eder

--11- Tabloya primary key constrainti ekleme

CREATE TABLE students2(
id int PRIMARY KEY,--null degerler alamaz (not null), tekrar eden degerler alamaz (unique),baska bir tablo ile iliskilendirmek icin kullanilacak
	name varchar(50),
	grade real,
	registir_date date
);
SELECT * FROM students2;
--11-tabloya PK constrainti ekleme:2.yontem
CREATE TABLE students3(
id int ,
	name varchar(50),
	grade real,
	registir_date date,
	CONSTRAINT std3_pk PRIMARY KEY(id)
	--bu sekilde yapinca kendin isim verebiliyorsun
	
);
SELECT*FROM students3;

--composite key 
CREATE TABLE students4(
id int ,
	name varchar(50),
	grade real,
	registir_date date,
	CONSTRAINT std4_pk PRIMARY KEY(id,name)
	
	
);

SELECT*FROM students4;

--12-tabloya FK constrainti ekleme
CREATE TABLE address3(
address_id int,
	street VARCHAR(50),
	city VARCHAR(50),
	student_id int,--FK, null kabul eder ,duplicate kabul eder
	CONSTRAINT add_fk FOREIGN KEY(student_id) REFERENCES students3(id) 
	
);
SELECT*FROM address3;

--13-tabloya CHECK constrainti ekleme

CREATE TABLE personel(
id int,
	name varchar(50),
	salary real NOT NULL CHECK(salary>5000),
	age int CHECK(age>0 AND age<50)--negatif kabul etmez
);

SELECT*FROM personel;

INSERT INTO personel VALUES(11,'Ali Can',2000,35);--salary check
INSERT INTO personel VALUES(11,'Ali Can',7000,55);--age check

INSERT INTO personel VALUES(11,'Ali Can',7000,25);




























