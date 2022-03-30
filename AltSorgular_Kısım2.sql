--Alt Sorgular'da 2.K�s�m
--Alt sorguyu kullanarak kriter �retmek.
--Bu alt sorgular where k�sm�nda kullan�l�r.

--Ad� Nancy olan personelin yapt��� sat��lar� listeleyiniz.
select * from Satislar where PersonelID=(select PersonelID from Personeller where Adi='Nancy')

--Ad� Nancy olan veya Janet olan personellerin yapt��� sat��lar�n adedlerini listeleyiniz.
select PersonelID,COUNT(*) as SatisAdedi ,
(select Adi from Personeller as p where p.PersonelID=s.PersonelID) as PersonelAdi from Satislar as s where PersonelID in (select PersonelID from Personeller where Adi='Nancy' or Adi='Janet') group by PersonelID 

--Personel ad� Nancy veya Janet olan ve nakliyecisi Speedy Express olan sat��lar� listeleyiniz.

select * from Satislar where PersonelID in (select PersonelID from Personeller where Adi='Nancy' or Adi='Janet') and ShipVia=(select NakliyeciID from Nakliyeciler where SirketAdi='Speedy Express')

--�r�n ad� Chai olan �r�n�n toplam sat�� tutar�n� g�steren sorguyu yaz�n�z.
select UrunID,SUM(BirimFiyati*Miktar*(1-�ndirim)) as ToplamSatisTutari,(select UrunAdi from Urunler as u where sd.UrunID=u.UrunID ) as UrunAdi from [Satis Detaylari] as sd where UrunID=(select UrunID from Urunler where UrunAdi='Chai') group by UrunID

--Id'si 5 olan kategorideki �r�nleri toplam sat�� tutar�n� bulan sorguyu yaz�n�z.
select SUM(BirimFiyati*Miktar*(1-�ndirim)) as ToplamTutar from [Satis Detaylari] where UrunID in (select UrunID from Urunler where KategoriID=5) 

--1997 y�l�nda yap�lan sat��larda ne kadar ciro elde edildi�ini bulan sorguyu yaz�n�z.
select SUM(BirimFiyati*Miktar*(1-�ndirim)) from [Satis Detaylari] where SatisID in (select SatisID from Satislar where YEAR(SatisTarihi)=1997)

--Id'si Alfk� m��terinin yapt��� toplam sat�� tutar�n�n bulan sorguyu yaz�n�z.
select SUM(BirimFiyati*Miktar*(1-�ndirim)) as ToplamTutar from [Satis Detaylari] where SatisID in (select SatisID from Satislar where MusteriID='ALFKI')

--Speedy Express isimli nakliyeci bug�ne kadar ka� adet �r�n ta��m��t�r.
select SUM(Miktar) from [Satis Detaylari] 
where SatisID in (select SatisID from Satislar
where ShipVia=(select NakliyeciID from Nakliyeciler where SirketAdi='Speedy Express'))

--Alfk� isimli m��teri hangi kategorilerde �r�n sat�n alm��t�r.
select KategoriAdi from Kategoriler where KategoriID in (select KategoriID from Urunler where UrunID in (select UrunID from [Satis Detaylari] where SatisID in (select SatisID from Satislar where MusteriID='Alfk�' )))

select KategoriID from Urunler where UrunID in (select UrunID from [Satis Detaylari] where SatisID in (select SatisID from Satislar where MusteriID='Alfk�' )) group by KategoriID

