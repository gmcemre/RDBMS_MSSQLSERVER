--Alt Sorgular(�� i�e sorgular)(SubQuery):
--1.Kullan�m �ekli: Select ile from aras�na bir sorgu yaz�l�r.Bu sorguda �nemli nokta sorgunun tek kolonu olmas� gerekir.
select *,
(select KategoriAdi from Kategoriler as k where k.KategoriID=u.KategoriID)as KategoriAdi 
from Urunler as u

--�r�nler tablosunu tedarik�i ad� ile birlikte  listeleyiniz.
select *,
(select SirketAdi from Tedarikciler as t where t.TedarikciID=u.TedarikciID ) as TedarikciAdi
from Urunler as u

--�r�nler tablosunu tedarik�i ad� ve kategori ad�,�r�n ad�,fiyat ve stok bilgileri ile birlikte listeleyiniz.
select UrunAdi,BirimFiyati,HedefStokDuzeyi,
(
select KategoriAdi from Kategoriler as k where k.KategoriID=u.KategoriID
) as KategoriAdi , --> virg�l ile alt sorgular� ay�r�r�yoruz.
(
select MusteriAdi from Tedarikciler as t where t.TedarikciID=u.TedarikciID
) as TedarikciAdi
from Urunler as u

--Sat��lar tablosunu m��teri ad� unvan�- personel ad� soyad� ile birlikte listeleyiniz.
select *,
(select MusteriAdi+' '+MusteriUnvani from Musteriler as m where s.MusteriID=m.MusteriID) as MusteriAdi,
(select Adi+' '+SoyAdi from Personeller as p where s.PersonelID=p.PersonelID)as PersonelAdi
from Satislar as s

--�r�nlerle birlikte �r�n�n toplam sat�� adedi bilgisini de g�steren sorguyu yaz�n�z.
select * from Urunler
select * from Satislar
select * from [Satis Detaylari]
select *,
(select SUM(Miktar) from [Satis Detaylari] as sd where u.UrunID=sd.UrunID )as Adet
from Urunler as u

--Yap�lan sat��lar� maximum sat�� fiyat� bilgisi ile listeleyiniz.
select *,
(select MAX(BirimFiyati) from [Satis Detaylari] as sd where s.SatisID=sd.SatisID)as MaxFiyat
from Satislar as s

--�r�nleri �r�ne uygulanan maximum indirim y�zdesi bilgisi ile listeleyen sorguyu yaz�n�z.
select *,
(select MAX(�ndirim) from [Satis Detaylari] as sd where u.UrunID=sd.UrunID ) as MaxIndirim
from Urunler as u

--Yap�lan sat��lar� toplam sat�� tutarlar� ile birlikte listeleyen sorguyu yaz�n�z.
select *,
(select SUM(BirimFiyati*Miktar*(1-�ndirim)) from [Satis Detaylari] as sd where s.SatisID=sd.SatisID) as ToplamTutar
from Satislar as s