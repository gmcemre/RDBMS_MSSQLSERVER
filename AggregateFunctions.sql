--Aggregate Function: 5 tane fonksiyon t�r� vard�r.
--Agg Function'lar select ile from aras�na yaz�l�r.
--Agg Functions kullan�l�rken yan�na herhangi bir kolon getirilemez.

--1.Count() : Sat�r Adedini veren fonksiyondur.
--  �r�nler tablosunda ka� kay�t(row) var?
select COUNT(*) from Urunler
--  Personeller tablosunda ka� kay�t(row) var? 
select COUNT(*) from Personeller
--  Personeller tablosunun Bolge kolonunda ka� kay�t(row) var?(Null'lar� saymaz)
select COUNT(Bolge) from Personeller

--2.SUM() : Toplama i�lemi yapmay� sa�layan fonksiyondur.
--  Stokta toplam ka� adet �r�n bulunmaktad�r?
select SUM(HedefStokDuzeyi) from Urunler

--  Stokta bulunan �r�nlerin toplam fiyat�n� bulunuz?
select SUM(BirimFiyati*HedefStokDuzeyi) from Urunler

--3.AVG() : Ortalama alan fonksiyondur.
--  Sto�umuzda ortalama ka� adet �r�n vard�r?
select AVG(HedefStokDuzeyi) 'Stok Ortalamas�' from Urunler

--  Sto�umuzda ortalama  fiyat olarak ne kadarl�k �r�n vard�r?
select AVG(BirimFiyati*HedefStokDuzeyi) from Urunler

--4.MAX() : Belirtilen kolon i�inden de�eri maximum olan veriyi getirir.
--  Sto�u en y�ksek olan �r�n� getir.
select MAX(HedefStokDuzeyi) 'En Y�ksek Fiyat' from Urunler

--5.MIN() : Belirtilen kolon i�erisinde de�eri en d���k olan veriyi getirir.
--  Fiyat� en az olan �r�n�n fiyat�n� bulunuz.
select MIN(BirimFiyati) as 'En D���k Fiyat' from Urunler

--  Fiyat olarak toplam ne kadarl�k �r�n sat��� yap�lm��t�r.
select SUM(BirimFiyati*Miktar*(1-�ndirim)) as ToplamSatisFiyati from [Satis Detaylari]