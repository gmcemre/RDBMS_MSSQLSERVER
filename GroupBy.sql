--Group by : Tablo içerisindeki verileri gruplamayý saðlar.

--Urunler tablosundaki KategoriID kolonunda hangi kategoriler var?
select KategoriID from Urunler group by KategoriID
--Hangi kategoriden kaç tane ürün vardýr?
select KategoriID,COUNT(*) as ToplamUrun  from Urunler group by KategoriID
--Stokta hangi kategoriden kaç dolarlýk ürün vardýr?
select KategoriID,SUM(BirimFiyati*HedefStokDuzeyi) from Urunler group by KategoriID
--Hangi kategoriden stokta kaç adet ürün vardýr?
select KategoriID,SUM(HedefStokDuzeyi) as StokAdedi from Urunler group by KategoriID
--Hangi tedarikçiden kaç adet ürün tedarik edilmiþtir.
select TedarikciID,COUNT(*) from Urunler group by TedarikciID
--Hangi tedarikçiden stokta toplamda kaç dolarlýk ürün vardýr.
select TedarikciID,SUM(HedefStokDuzeyi*BirimFiyati) from Urunler group by TedarikciID
--Hangi personel, hangi müþteriye kaç adet satýþ yapmýþtýr.
select PersonelID,MusteriID,COUNT(*) as Adet from Satislar group by PersonelID,MusteriID
--Hangi müþteri ,hangi nakliyeciden kaç adet sipariþte bulunmuþtur.
select MusteriID,ShipVia,COUNT(*) as SiparisAdedi from Satislar group by MusteriID,ShipVia
--Hangi üründen toplamda kaç dolarlýk satýþ yapýlmýþtýr ve ýd ye göre küçükten büyüðe doðru sýralayýnýz.
select * from [Satis Detaylari]
select UrunID,SUM(BirimFiyati*Miktar*(1-Ýndirim)) as ToplamTutar from [Satis Detaylari] group by UrunID order by UrunID asc