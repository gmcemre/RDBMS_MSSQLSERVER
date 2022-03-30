--with encryption : View 'i þifrelemek istersek as'dan önce bu komutu ekliyoruz.
create view MusteriSatisRaporu 
with encryption
as
select m.SirketAdi,u.UrunAdi,SUM(sd.BirimFiyati*sd.Miktar*(1-sd.Ýndirim)) as Total from Satislar s
left join Musteriler m 
on s.MusteriID=m.MusteriID
left join [Satis Detaylari] sd
on s.SatisID=sd.SatisID
left join Urunler u
on sd.UrunID=u.UrunID
group by m.SirketAdi,u.UrunAdi

go
select * from MusteriSatisRaporu