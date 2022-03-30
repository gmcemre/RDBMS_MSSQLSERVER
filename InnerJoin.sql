--Join : Aralarýnda iliþki bulunan tablolarýn birbiri ile baðlantýsýný kurarak tek sorguda tek tablo çýktýsý vermeyi saðlayan yapýdýr.
--3 çeþit join vardýr.
--Bunlar; inner join , outer join , cross join
--1.Inner join . Ýliþkili tablolardaki null olmayan kayýtlarý listeler.
select u.UrunAdi,u.BirimFiyati,u.HedefStokDuzeyi,k.KategoriAdi,k.Tanimi from 
Urunler as u inner join Kategoriler as k
on u.KategoriID=k.KategoriID

--Ürünleri tedarikçi firma isimleri ile birlikte listeleyiniz.
select u.UrunID,u.UrunAdi,t.SirketAdi,t.MusteriAdi from 
Urunler as u inner join Tedarikciler as t
on u.TedarikciID=t.TedarikciID

--Yapýlan satýþlarý müþteri adý soyadý ve personel adý soyadý ile birlikte listeleyiniz.
select s.*,m.MusteriAdi,p.Adi+' '+p.SoyAdi as PersonelAdi from 
Satislar as s inner join Musteriler as m 
on s.MusteriID=m.MusteriID inner join Personeller as p 
on s.PersonelID=p.PersonelID

--Hangi personel hangi üründen toplamda kaç dolarlýk satýþ yapmýþtýr.
select p.Adi+' '+p.SoyAdi as PersonelAdi,u.UrunAdi, SUM(sd.BirimFiyati*sd.Miktar*(1-sd.Ýndirim)) as ToplamTutar from 
[Satis Detaylari] as sd inner join Satislar s 
on sd.SatisID=s.SatisID inner join Personeller as p 
on s.PersonelID=p.PersonelID inner join Urunler as u 
on sd.UrunID=u.UrunID 
group by p.Adi+' '+p.SoyAdi,u.UrunAdi

--Hangi personel hangi kategoriden toplamda kaç adet ürün satýþý yapmýþtýr.
select p.Adi+' '+p.SoyAdi as PersonelAdi,k.KategoriAdi,SUM(sd.Miktar) as ToplamAdet from [Satis Detaylari] as sd 
inner join Satislar as s
on sd.SatisID=s.SatisID 
inner join Personeller as p 
on s.PersonelID=p.PersonelID 
inner join Urunler as u 
on sd.UrunID=u.UrunID 
inner join Kategoriler as k 
on k.KategoriID=u.KategoriID 
group by p.Adi+' '+p.SoyAdi,k.KategoriAdi order by KategoriAdi asc

--Nakliyeci þirket adý 'Speedy Express' olan nakliyeci , satýþ fiyatý 15 dolardan yüksek kaç adet ürün taþýmýþtýr.
select *from Nakliyeciler
select * from [Satis Detaylari]
select * from Satislar

select n.SirketAdi,SUM(Miktar) as ToplamAdet from 
[Satis Detaylari] as sd inner join Satislar as s
on s.SatisID=sd.SatisID 
inner join Nakliyeciler as n
on n.NakliyeciID=s.ShipVia
where n.SirketAdi='Speedy Express' and sd.BirimFiyati>15 
group by n.SirketAdi