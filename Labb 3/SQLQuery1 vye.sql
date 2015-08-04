CREATE VIEW V9A
AS 
select DISTINCT TOP 20 ArtikelID, Artnamn, Antal, pris, Rabatt,TotalPris
from Artikel
order by Artnamn ASC;
Go

SELECT *
FROM V9A -- test

SELECT *
FROM Artikel 
