--View: Sanal tablo demektir.
--Sorgu kayýt esnasýnda bir kez derlenir.Bu sayede performans artýþý saðlanýr.
--View her çaðrýldýðýnda içindeki sorgu yeniden çalýþtýrýlýr.

create view UrunRapor
as
select u.UrunAdi,u.BirimFiyati,u.HedefStokDuzeyi,k.KategoriAdi,t.SirketAdi from Urunler u
left join Tedarikciler t 
on u.TedarikciID=t.TedarikciID
left join Kategoriler k
on u.KategoriID=k.KategoriID

go
select * from UrunRapor
drop view UrunRapor
go

--Hangi Personelin hangi üründen toplamda kaç dolarlýk satýþ yaptýðýný listeleyen view'ý yazýnýz.
create view PersonelRapor
as
select p.Adi,u.UrunAdi,SUM(sd.BirimFiyati*sd.Miktar*(1-sd.Ýndirim)) as ToplamTutar from Personeller p
right join Satislar s 
on p.PersonelID=s.PersonelID
right join [Satis Detaylari] sd
on sd.SatisID=s.SatisID
right join Urunler u
on u.UrunID=sd.UrunID
group by p.Adi,u.UrunAdi

go
select * from PersonelRapor
drop view PersonelRapor