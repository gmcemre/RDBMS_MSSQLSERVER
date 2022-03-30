--Group by : Tablo i�erisindeki verileri gruplamay� sa�lar.

--Urunler tablosundaki KategoriID kolonunda hangi kategoriler var?
select KategoriID from Urunler group by KategoriID
--Hangi kategoriden ka� tane �r�n vard�r?
select KategoriID,COUNT(*) as ToplamUrun  from Urunler group by KategoriID
--Stokta hangi kategoriden ka� dolarl�k �r�n vard�r?
select KategoriID,SUM(BirimFiyati*HedefStokDuzeyi) from Urunler group by KategoriID
--Hangi kategoriden stokta ka� adet �r�n vard�r?
select KategoriID,SUM(HedefStokDuzeyi) as StokAdedi from Urunler group by KategoriID
--Hangi tedarik�iden ka� adet �r�n tedarik edilmi�tir.
select TedarikciID,COUNT(*) from Urunler group by TedarikciID
--Hangi tedarik�iden stokta toplamda ka� dolarl�k �r�n vard�r.
select TedarikciID,SUM(HedefStokDuzeyi*BirimFiyati) from Urunler group by TedarikciID
--Hangi personel, hangi m��teriye ka� adet sat�� yapm��t�r.
select PersonelID,MusteriID,COUNT(*) as Adet from Satislar group by PersonelID,MusteriID
--Hangi m��teri ,hangi nakliyeciden ka� adet sipari�te bulunmu�tur.
select MusteriID,ShipVia,COUNT(*) as SiparisAdedi from Satislar group by MusteriID,ShipVia
--Hangi �r�nden toplamda ka� dolarl�k sat�� yap�lm��t�r ve �d ye g�re k���kten b�y��e do�ru s�ralay�n�z.
select * from [Satis Detaylari]
select UrunID,SUM(BirimFiyati*Miktar*(1-�ndirim)) as ToplamTutar from [Satis Detaylari] group by UrunID order by UrunID asc