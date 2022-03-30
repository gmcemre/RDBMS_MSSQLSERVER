--Not:
--Ürün Id'si 5,14,17,25,34 olmayan ürünleri listeleyiniz.
select * from Urunler where UrunID not in (5,14,17,25,34)

--Ürün adýnda c geçmeyen ürünleri listeleyiniz.
select * from Urunler where UrunAdi not like '%c%'

--Personeller tablosunda Bolgesi boþ olmayan kayýtlarý getir.
select * from Personeller where Bolge is not null

