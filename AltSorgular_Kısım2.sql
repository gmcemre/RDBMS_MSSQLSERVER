--Alt Sorgular'da 2.Kýsým
--Alt sorguyu kullanarak kriter üretmek.
--Bu alt sorgular where kýsmýnda kullanýlýr.

--Adý Nancy olan personelin yaptýðý satýþlarý listeleyiniz.
select * from Satislar where PersonelID=(select PersonelID from Personeller where Adi='Nancy')

--Adý Nancy olan veya Janet olan personellerin yaptýðý satýþlarýn adedlerini listeleyiniz.
select PersonelID,COUNT(*) as SatisAdedi ,
(select Adi from Personeller as p where p.PersonelID=s.PersonelID) as PersonelAdi from Satislar as s where PersonelID in (select PersonelID from Personeller where Adi='Nancy' or Adi='Janet') group by PersonelID 

--Personel adý Nancy veya Janet olan ve nakliyecisi Speedy Express olan satýþlarý listeleyiniz.

select * from Satislar where PersonelID in (select PersonelID from Personeller where Adi='Nancy' or Adi='Janet') and ShipVia=(select NakliyeciID from Nakliyeciler where SirketAdi='Speedy Express')

--Ürün adý Chai olan ürünün toplam satýþ tutarýný gösteren sorguyu yazýnýz.
select UrunID,SUM(BirimFiyati*Miktar*(1-Ýndirim)) as ToplamSatisTutari,(select UrunAdi from Urunler as u where sd.UrunID=u.UrunID ) as UrunAdi from [Satis Detaylari] as sd where UrunID=(select UrunID from Urunler where UrunAdi='Chai') group by UrunID

--Id'si 5 olan kategorideki ürünleri toplam satýþ tutarýný bulan sorguyu yazýnýz.
select SUM(BirimFiyati*Miktar*(1-Ýndirim)) as ToplamTutar from [Satis Detaylari] where UrunID in (select UrunID from Urunler where KategoriID=5) 

--1997 yýlýnda yapýlan satýþlarda ne kadar ciro elde edildiðini bulan sorguyu yazýnýz.
select SUM(BirimFiyati*Miktar*(1-Ýndirim)) from [Satis Detaylari] where SatisID in (select SatisID from Satislar where YEAR(SatisTarihi)=1997)

--Id'si Alfký müþterinin yaptýðý toplam satýþ tutarýnýn bulan sorguyu yazýnýz.
select SUM(BirimFiyati*Miktar*(1-Ýndirim)) as ToplamTutar from [Satis Detaylari] where SatisID in (select SatisID from Satislar where MusteriID='ALFKI')

--Speedy Express isimli nakliyeci bugüne kadar kaç adet ürün taþýmýþtýr.
select SUM(Miktar) from [Satis Detaylari] 
where SatisID in (select SatisID from Satislar
where ShipVia=(select NakliyeciID from Nakliyeciler where SirketAdi='Speedy Express'))

--Alfký isimli müþteri hangi kategorilerde ürün satýn almýþtýr.
select KategoriAdi from Kategoriler where KategoriID in (select KategoriID from Urunler where UrunID in (select UrunID from [Satis Detaylari] where SatisID in (select SatisID from Satislar where MusteriID='Alfký' )))

select KategoriID from Urunler where UrunID in (select UrunID from [Satis Detaylari] where SatisID in (select SatisID from Satislar where MusteriID='Alfký' )) group by KategoriID

