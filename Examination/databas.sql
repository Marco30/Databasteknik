CREATE TABLE Befattning
(
	BefattningID  int IDENTITY(1,1) PRIMARY KEY,
	Befattningstyp    varchar(20) NOT NULL,
	Arvode   int NOT NULL,
);

CREATE TABLE Medlem
(
	MedlemID  int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Personnummer varchar(12) NOT NULL,
	Förnamn  varchar(10) NOT NULL,
	Efternamn varchar(10) NOT NULL,
	Ort     varchar(25) NOT NULL,
	Gatuadress  varchar(30) NOT NULL,
	BefattningID int NOT NULL,
	Foreign Key (BefattningID) REFERENCES Befattning(BefattningID),
);



INSERT INTO Befattning
 (Befattningtyp, Arvode)

VALUES
 ('Ordförande',17000);

INSERT INTO Befattning
 (Befattningtyp, Arvode)

VALUES
 ('Vice ordförande',13000);

 INSERT INTO Befattning
 (Befattningtyp, Arvode)

VALUES
 ('Styrelsemedlem',2000);

INSERT INTO Befattning
 (Befattningtyp, Arvode)

VALUES
 ('Medlem',0);

--SELECT * FROM Befattning;

-- telfon

CREATE TABLE Kontakttyp
(
	KontakttypID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Kontakttyp varchar(10) NOT NULL,
);

CREATE TABLE Kontakt
(
	MedlemID  int NOT NULL, 
	KontaktID  int  NOT NULL IDENTITY(1,1) PRIMARY KEY,
	KontakttypID  int  DEFAULT 1,
	Kontaktuppgift varchar(20) NOT NULL,
	Foreign Key (MedlemID) REFERENCES Medlem(MedlemID),
	Foreign Key (KontakttypID) REFERENCES Kontakttyp(KontakttypID),

);

CREATE TABLE Aktivitetstyp
(
	AktivitetstypID  int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Aktivitetstyp  varchar(15) NOT NULL,
);


CREATE TABLE Aktivitet
(
	AktivitetID  int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	AktivitetstypID int, NOT NULL,
	Startdatum date DEFAULT GetDate(),
	Slutdatum date DEFAULT '2015-04-25',
	MedlemID int NOT NULL,
	Foreign Key (MedlemID) REFERENCES Medlem(MedlemID),
	Foreign Key (AktivitetstypID) REFERENCES Aktivitetstyp(AktivitetstypID)
);


-- kund 

INSERT INTO Medlem
 (Personnummer, Förnamn, Efternamn, Ort, Gatuadress, BefattningID)
VALUES
 ('880519-9299', 'Marco', 'Villegas', 'Huddinge', 'Terapivägen 16', 1)

 INSERT INTO Medlem
 (Personnummer, Förnamn, Efternamn, Ort, Gatuadress, BefattningID)
 VALUES
 ('901129-7943', 'Erik', 'Storm', 'Alby', 'Biblioteksgatan 5', 2);

 INSERT INTO Medlem
 (Personnummer, Förnamn, Efternamn, Ort, Gatuadress, BefattningID)
 VALUES
 ('760327-6290', 'Sara', 'Willingham', 'Berga', 'Drottninggatan 82', 4);




--SELECT * FROM Kund;

  INSERT INTO Aktivitetstyp
 (Aktivitetstyp)

 VALUES
 ('Fotboll');

  INSERT INTO Aktivitetstyp
 (Aktivitetstyp)

 VALUES
 ('Grillning');

   INSERT INTO Aktivitetstyp
 (Aktivitetstyp)

 VALUES
 ('Resa');


    INSERT INTO Kontakttyp
 (Kontakttyp)

 VALUES
 ('Mobil');


   INSERT INTO Kontakttyp
 (Kontakttyp)

 VALUES
 ('Hem');

   INSERT INTO Kontakttyp
 (Kontakttyp)

 VALUES
 ('E-post');

 --SELECT *FROM Kontakttyp

    INSERT INTO Kontakt
 (MedlemID,Kontaktuppgift,KontakttypID)

 VALUES
 (1, '0480-65987', 2);

   INSERT INTO Kontakt
 (MedlemID,Kontaktuppgift,KontakttypID)

 VALUES
 (1, 'Marco.Villegas@live', 3);

   INSERT INTO Kontakt
 (MedlemID,Kontaktuppgift,KontakttypID)

 VALUES
 (3, '0480-65999', 2);

   INSERT INTO Kontakt
 (MedlemID,Kontaktuppgift,KontakttypID)

 VALUES
 (2, '0480-479888', 2);

   INSERT INTO Kontakt
 (MedlemID,Kontaktuppgift,KontakttypID)

 VALUES
 (2, '070-6880589', 1);

   INSERT INTO Kontakt
 (MedlemID,Kontaktuppgift,KontakttypID)

 VALUES
 (3, 'Sara08@hotmail.com', 3);


  --SELECT * FROM Telefon;


--Datum faktura 

 INSERT INTO Aktivitet
 ( AktivitetstypID, Slutdatum, MedlemID)

 VALUES
 (3, '2015-04-25', 1)

 INSERT INTO Aktivitet
 ( AktivitetstypID, Slutdatum, MedlemID)

 VALUES
 (1, '2015-04-25', 1)

  INSERT INTO Aktivitet
 ( AktivitetstypID, Slutdatum, MedlemID)

 VALUES
 (2, '2015-04-25', 3)

  INSERT INTO Aktivitet
 ( AktivitetstypID, Slutdatum, MedlemID)

 VALUES
 (2, '2015-04-25', 2)

 
  INSERT INTO Aktivitet
 ( AktivitetstypID, Slutdatum, MedlemID)

 VALUES
 (3, '2015-04-25', 2)

  INSERT INTO Aktivitet
 ( AktivitetstypID, Slutdatum, MedlemID)

 VALUES
 (2,'2015-04-25', 1)

 --SELECT *FROM Fakturad;

-- truncaTE bra för att ränsa tabel truncaTE TABLE Fakturad;


-- skapar index i kund, Telefon, Faktura, Fakturad
CREATE UNIQUE INDEX MedlemIndex ON Medlem(MedlemID, Förnamn, Efternamn, Ort, Gatuadress, BefattningID)
CREATE INDEX KontaktIndex ON Kontakt(MedlemID,KontaktID, Kontaktuppgift, KontakttypID)
CREATE INDEX BefattningIndex ON Befattning(BefattningID, Befattningtyp, Arvode)
CREATE INDEX AktivitetIndex ON Aktivitet(AktivitetID,MedlemID,Startdatum,Slutdatum,AktivitetstypID)

--SELECT *FROM Fakturad WITH(INDEX(FAKTURADIndex))-- test om index finns 

--SELECT *FROM Artikel -- test


