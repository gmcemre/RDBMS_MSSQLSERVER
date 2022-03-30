--Alt Sorgular(Ýç içe sorgular)(SubQuery):
--1.Kullaným Þekli: Select ile from arasýna bir sorgu yazýlýr.Bu sorguda önemli nokta sorgunun tek kolonu olmasý gerekir.
select *,
(select KategoriAdi from Kategoriler as k where k.KategoriID=u.KategoriID)as KategoriAdi 
from Urunler as u

--Ürünler tablosunu tedarikçi adý ile birlikte  listeleyiniz.
select *,
(select SirketAdi from Tedarikciler as t where t.TedarikciID=u.TedarikciID ) as TedarikciAdi
from Urunler as u

--Ürünler tablosunu tedarikçi adý ve kategori adý,ürün adý,fiyat ve stok bilgileri ile birlikte listeleyiniz.
select UrunAdi,BirimFiyati,HedefStokDuzeyi,
(
select KategoriAdi from Kategoriler as k where k.KategoriID=u.KategoriID
) as KategoriAdi , --> virgül ile alt sorgularý ayýrýrýyoruz.
(
select MusteriAdi from Tedarikciler as t where t.TedarikciID=u.TedarikciID
) as TedarikciAdi
from Urunler as u

--Satýþlar tablosunu müþteri adý unvaný- personel adý soyadý ile birlikte listeleyiniz.
select *,
(select MusteriAdi+' '+MusteriUnvani from Musteriler as m where s.MusteriID=m.MusteriID) as MusteriAdi,
(select Adi+' '+SoyAdi from Personeller as p where s.PersonelID=p.PersonelID)as PersonelAdi
from Satislar as s

--Ürünlerle birlikte ürünün toplam satýþ adedi bilgisini de gösteren sorguyu yazýnýz.
select * from Urunler
select * from Satislar
select * from [Satis Detaylari]
select *,
(select SUM(Miktar) from [Satis Detaylari] as sd where u.UrunID=sd.UrunID )as Adet
from Urunler as u

--Yapýlan satýþlarý maximum satýþ fiyatý bilgisi ile listeleyiniz.
select *,
(select MAX(BirimFiyati) from [Satis Detaylari] as sd where s.SatisID=sd.SatisID)as MaxFiyat
from Satislar as s

--Ürünleri ürüne uygulanan maximum indirim yüzdesi bilgisi ile listeleyen sorguyu yazýnýz.
select *,
(select MAX(Ýndirim) from [Satis Detaylari] as sd where u.UrunID=sd.UrunID ) as MaxIndirim
from Urunler as u

--Yapýlan satýþlarý toplam satýþ tutarlarý ile birlikte listeleyen sorguyu yazýnýz.
select *,
(select SUM(BirimFiyati*Miktar*(1-Ýndirim)) from [Satis Detaylari] as sd where s.SatisID=sd.SatisID) as ToplamTutar
from Satislar as s