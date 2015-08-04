use test3

CREATE TABLE Kategori
(
	KategoriID  int IDENTITY(1,1) PRIMARY KEY,
	Kategori    varchar(10) NOT NULL,
);

CREATE TABLE Kund
(
	KundID  int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Namn    varchar(40) NOT NULL,
	Adress  varchar(30) NOT NULL,
	Postnr  varchar(6) NOT NULL,
	Ort     varchar(25) NOT NULL,
	Rabatt DECIMAL(2,2)  NOT NULL,
	Anteckningar varchar(300),
	KategoriID int NOT NULL,
	Foreign Key (KategoriID) REFERENCES Kategori(KategoriID),
);



INSERT INTO Kategori
 (Kategori)

VALUES
 ('Låg');

 INSERT INTO Kategori
 (Kategori)

VALUES
 ('Normal');

 INSERT INTO Kategori
 (Kategori)

VALUES
 ('Premie');

  SELECT *
FROM Kategori;

-- telfon

CREATE TABLE Teltyp
(
	TeltypID  int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Teltyp varchar(10) NOT NULL,
);

CREATE TABLE Telefon
(
	KundID  int NOT NULL, 
	TelID  int  NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Telenr varchar(15) NOT NULL,
	TeltypID  int  DEFAULT 1,
	Foreign Key (KundID) REFERENCES Kund(KundID),
	Foreign Key (TeltypID) REFERENCES Teltyp(TeltypID),
);

CREATE TABLE Artikel
(
	ArtikelID  int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Artnamn    varchar(30) NOT NULL,
	Antal   int NOT NULL,
	Pris DECIMAL(6,2)  NOT NULL,
	Rabatt DECIMAL(2,2)  NOT NULL,
	TotalPris DECIMAL(6,2) NOT NULL,

	

);

-- gör så att Antal * Pris = TotalPris it tabel artikel
ALTER TABLE Artikel
DROP COLUMN TotalPris

ALTER TABLE Artikel
ADD TotalPris AS Antal * Pris


CREATE TABLE Moms
(
	MomsID  int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Moms DECIMAL(2,2)  NOT NULL 


);



CREATE TABLE Faktura
(
	FakturaID  int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Datum   date DEFAULT GetDate(),
	Betvillkor tinyint DEFAULT 30,
	kundID  int NOT NULL,
	Foreign Key (KundID) REFERENCES Kund(KundID),
	CHECK (Betvillkor  > 0 and Betvillkor  < 60)
);

CREATE TABLE Fakturad
(
	RadID  int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	FakturaID  int NOT NULL,
	ArtikelID  int NOT NULL,
	Antal   int NOT NULL,
	pris DECIMAL(6,2)  NOT NULL,
	Rabatt DECIMAL(6,2)  NOT NULL,
	MomsID  int DEFAULT 1,
	
Foreign Key (ArtikelID) REFERENCES Artikel(ArtikelID),

Foreign Key (MomsID) REFERENCES Moms(MomsID),

Foreign Key (FakturaID) REFERENCES Faktura(FakturaID)

);

-- kund 

INSERT INTO Kund
 (Namn, Adress, Postnr, Ort, Rabatt, Anteckningar, KategoriID )
VALUES
 ('Svensson Mekaniska', 'Storgatan 23', '23351', 'KALMAR', 0.10,'bra kund som vet vad den vill', 1);

 INSERT INTO Kund
 (Namn, Adress, Postnr, Ort, Rabatt, Anteckningar, KategoriID )
VALUES
 ('Färgbutiken i Lindsdal', 'Kalmarvägen 45', '39364', 'KALMAR',  0.05,'bra kund som vet vad den vill', 3);

 INSERT INTO Kund
 (Namn, Adress, Postnr, Ort, Rabatt, Anteckningar, KategoriID)
VALUES
 ('Liljas Bil', 'Norra Vägen 58', '39354', 'KALMAR', 0.10,'bra kund som vet vad den vill', 2);

 INSERT INTO Kund
 (Namn, Adress, Postnr, Ort, Rabatt, Anteckningar, KategoriID)
VALUES
 ('IP Konsult AB', 'Skeppsbrogatan 46', '39351','KALMAR', 0.15,'Kontakta Marie senast den 15 maj angåen de uppköp av ny datorpark.', 1);

  SELECT *
FROM Kund;

  INSERT INTO Teltyp
 (Teltyp)

 VALUES
 ('Arbete');

   INSERT INTO Teltyp
 (Teltyp)

 VALUES
 ('Fax');

   INSERT INTO Teltyp
 (Teltyp)

 VALUES
 ('Fritid');

   INSERT INTO Teltyp
 (Teltyp)

 VALUES
 ('Hem');

   INSERT INTO Teltyp
 (Teltyp)

 VALUES
 ('Mobil');

 SELECT *
FROM Teltyp;

   INSERT INTO Telefon
 (KundID,Telenr,TeltypID)

 VALUES
 (1, '0480-65987', 1);

   INSERT INTO Telefon
 (KundID,Telenr,TeltypID)

 VALUES
 (1, '070-5479867', 5);

   INSERT INTO Telefon
 (KundID,Telenr,TeltypID)

 VALUES
 (1, '0480-65999', 2);

   INSERT INTO Telefon
 (KundID,Telenr,TeltypID)

 VALUES
 (2, '0480-479888', 1);

   INSERT INTO Telefon
 (KundID,Telenr,TeltypID)

 VALUES
 (2, '0480-47899', 2);

 INSERT INTO Telefon
 (KundID,Telenr,TeltypID)

 VALUES
 (4, '0480-492182', 2);


  --SELECT * FROM Telefon;


INSERT INTO Moms
 (Moms)

 VALUES
 (00.25);

 INSERT INTO Moms
 (Moms)

 VALUES
 (00.12);

 INSERT INTO Moms
 (Moms)

 VALUES
 (00.06);

 INSERT INTO Moms
 (Moms)

 VALUES
 (00.00);

 SELECT *
FROM moms;

INSERT INTO Artikel
 (Artnamn, Antal, pris, Rabatt)

 VALUES
 ('CD-skiva ABC', 200 ,6.70, 0)

 INSERT INTO Artikel
 (Artnamn, Antal, pris, Rabatt)

 VALUES
 ('DVD-skivor', 300, 12.50,  0 )

 INSERT INTO Artikel
 (Artnamn, Antal, pris, Rabatt)

 VALUES
 ('Bildskärm, platt, 12ms',  25, 1950.00,  0 )

  INSERT INTO Artikel
 (Artnamn, Antal, pris, Rabatt)

 VALUES
 ('DVD-spelare +/- RW ',50, 950.00,  0)

   SELECT *
FROM Artikel;

--Datum faktura 

 INSERT INTO Faktura
 ( Betvillkor, KundID)

 VALUES
 (20, 2)

 INSERT INTO Faktura
 ( Betvillkor, KundID)

 VALUES
 ( 20, 2)

 INSERT INTO Faktura
 (Betvillkor, KundID)

  VALUES
 (30,4)

  INSERT INTO Faktura
 ( Betvillkor, KundID)

  VALUES
 ( 30,4)

 --SELECT *FROM Fakturad;

-- truncaTE bra för att ränsa tabel truncaTE TABLE Fakturad;


-- Fakturad

INSERT INTO Fakturad
 (FakturaID, ArtikelID, Antal, pris, Rabatt)

 VALUES
 (1, 2, 10, 125.00,  0.05)

 INSERT INTO Fakturad
 (FakturaID, ArtikelID, Antal, pris, Rabatt)

 VALUES
 (2, 3, 1, 1950.00, 0.05)

 
 INSERT INTO Fakturad
 (FakturaID, ArtikelID, Antal, pris, Rabatt)

 VALUES
 (3, 4, 2, 1900, 0.10)

  INSERT INTO Fakturad
 (FakturaID, ArtikelID, Antal, pris, Rabatt)

 VALUES
 (4, 2, 30, 375, 0.10)


 --
 SELECT *FROM Fakturad;

-- skapar index i kund, Telefon, Faktura, Fakturad
CREATE UNIQUE INDEX KUNDIndex ON Kund(KundID, Namn)
CREATE INDEX teleIndex ON Telefon(KundID,TelID, TeltypID)
CREATE INDEX FIndex ON Faktura(KundID,FakturaID)
CREATE INDEX FAKTURADIndex ON Fakturad(RadID,FakturaID,ArtikelID,MomsID)

--SELECT *FROM Fakturad WITH(INDEX(FAKTURADIndex))-- test om index finns 

--SELECT *FROM Artikel -- test

