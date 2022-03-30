--Join : Aralar�nda ili�ki bulunan tablolar�n birbiri ile ba�lant�s�n� kurarak tek sorguda tek tablo ��kt�s� vermeyi sa�layan yap�d�r.
--3 �e�it join vard�r.
--Bunlar; inner join , outer join , cross join
--1.Inner join . �li�kili tablolardaki null olmayan kay�tlar� listeler.
select u.UrunAdi,u.BirimFiyati,u.HedefStokDuzeyi,k.KategoriAdi,k.Tanimi from 
Urunler as u inner join Kategoriler as k
on u.KategoriID=k.KategoriID

--�r�nleri tedarik�i firma isimleri ile birlikte listeleyiniz.
select u.UrunID,u.UrunAdi,t.SirketAdi,t.MusteriAdi from 
Urunler as u inner join Tedarikciler as t
on u.TedarikciID=t.TedarikciID

--Yap�lan sat��lar� m��teri ad� soyad� ve personel ad� soyad� ile birlikte listeleyiniz.
select s.*,m.MusteriAdi,p.Adi+' '+p.SoyAdi as PersonelAdi from 
Satislar as s inner join Musteriler as m 
on s.MusteriID=m.MusteriID inner join Personeller as p 
on s.PersonelID=p.PersonelID

--Hangi personel hangi �r�nden toplamda ka� dolarl�k sat�� yapm��t�r.
select p.Adi+' '+p.SoyAdi as PersonelAdi,u.UrunAdi, SUM(sd.BirimFiyati*sd.Miktar*(1-sd.�ndirim)) as ToplamTutar from 
[Satis Detaylari] as sd inner join Satislar s 
on sd.SatisID=s.SatisID inner join Personeller as p 
on s.PersonelID=p.PersonelID inner join Urunler as u 
on sd.UrunID=u.UrunID 
group by p.Adi+' '+p.SoyAdi,u.UrunAdi

--Hangi personel hangi kategoriden toplamda ka� adet �r�n sat��� yapm��t�r.
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

--Nakliyeci �irket ad� 'Speedy Express' olan nakliyeci , sat�� fiyat� 15 dolardan y�ksek ka� adet �r�n ta��m��t�r.
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