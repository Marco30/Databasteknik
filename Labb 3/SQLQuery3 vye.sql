CREATE VIEW V9C
AS 
SELECT top 10 A.ArtikelID, A.Artnamn, Fr.Antal, Fr.Pris, Moms*100 AS 'Moms i %', fr.Rabatt* 100  as 'Rabatt i %', 
M.Moms* ((Fr.Pris * Fr.Antal) - ((Fr.Pris * Fr.Antal) * Fr.Rabatt)) + (Fr.Pris * Fr.Antal) - ((Fr.Pris * Fr.Antal) * Fr.Rabatt)  AS Summa
FROM Faktura AS F 
INNER JOIN Fakturad AS Fr
ON F.FakturaID = Fr.FakturaID
INNER JOIN Artikel AS A
ON A.ArtikelID = Fr.ArtikelID
INNER JOIN Moms AS M
ON Fr.MomsID = M.MomsID
order by datum ASC
Go

SELECT *
FROM V9C





