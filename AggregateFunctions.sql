--Aggregate Function: 5 tane fonksiyon türü vardýr.
--Agg Function'lar select ile from arasýna yazýlýr.
--Agg Functions kullanýlýrken yanýna herhangi bir kolon getirilemez.

--1.Count() : Satýr Adedini veren fonksiyondur.
--  Ürünler tablosunda kaç kayýt(row) var?
select COUNT(*) from Urunler
--  Personeller tablosunda kaç kayýt(row) var? 
select COUNT(*) from Personeller
--  Personeller tablosunun Bolge kolonunda kaç kayýt(row) var?(Null'larý saymaz)
select COUNT(Bolge) from Personeller

--2.SUM() : Toplama iþlemi yapmayý saðlayan fonksiyondur.
--  Stokta toplam kaç adet ürün bulunmaktadýr?
select SUM(HedefStokDuzeyi) from Urunler

--  Stokta bulunan ürünlerin toplam fiyatýný bulunuz?
select SUM(BirimFiyati*HedefStokDuzeyi) from Urunler

--3.AVG() : Ortalama alan fonksiyondur.
--  Stoðumuzda ortalama kaç adet ürün vardýr?
select AVG(HedefStokDuzeyi) 'Stok Ortalamasý' from Urunler

--  Stoðumuzda ortalama  fiyat olarak ne kadarlýk ürün vardýr?
select AVG(BirimFiyati*HedefStokDuzeyi) from Urunler

--4.MAX() : Belirtilen kolon içinden deðeri maximum olan veriyi getirir.
--  Stoðu en yüksek olan ürünü getir.
select MAX(HedefStokDuzeyi) 'En Yüksek Fiyat' from Urunler

--5.MIN() : Belirtilen kolon içerisinde deðeri en düþük olan veriyi getirir.
--  Fiyatý en az olan ürünün fiyatýný bulunuz.
select MIN(BirimFiyati) as 'En Düþük Fiyat' from Urunler

--  Fiyat olarak toplam ne kadarlýk ürün satýþý yapýlmýþtýr.
select SUM(BirimFiyati*Miktar*(1-Ýndirim)) as ToplamSatisFiyati from [Satis Detaylari]