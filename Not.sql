--Not:
--�r�n Id'si 5,14,17,25,34 olmayan �r�nleri listeleyiniz.
select * from Urunler where UrunID not in (5,14,17,25,34)

--�r�n ad�nda c ge�meyen �r�nleri listeleyiniz.
select * from Urunler where UrunAdi not like '%c%'

--Personeller tablosunda Bolgesi bo� olmayan kay�tlar� getir.
select * from Personeller where Bolge is not null

