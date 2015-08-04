CREATE VIEW V9B
AS 
SELECT DISTINCT TOP 10 Ort,Namn,Adress, Postnr, T.Telenr, TP.teltyp
FROM Kund AS K
INNER JOIN Telefon AS T
ON K.KundID = T.KundID
INNER JOIN Teltyp AS TP
ON T.TeltypID = TP.TeltypID
order by Ort,Namn;
Go

SELECT *
FROM V9B
