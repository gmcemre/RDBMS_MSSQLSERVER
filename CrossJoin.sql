--Cross Join: Tablolardaki tüm kayýtlarý birbiri ile kartezyen çarpým yaparak iliþkilendirir.
select *  from Urunler u 
cross join Kategoriler

--Hangi personel hangi ürünlerden satýþ yapmamýþtýr.
select p.Adi,u.UrunAdi from Personeller p 
cross join Urunler u
except
select p.Adi,u.UrunAdi from Personeller p 
left join Satislar s 
on p.PersonelID=s.PersonelID
left join [Satis Detaylari] sd
on sd.SatisID=s.SatisID
left join Urunler u 
on u.UrunID=sd.UrunID
group by p.Adi,u.UrunAdi

--Hangi tedarikçiden hangi ürün hiç tedarik edilmemiþtir.
select t.SirketAdi,u.UrunAdi from Tedarikciler t
cross join Urunler u
except
select t.SirketAdi,u.UrunAdi from Tedarikciler t
right join Urunler u 
on u.TedarikciID=t.TedarikciID
group by t.SirketAdi,u.UrunAdi

--Hangi ürün hangi müþteriye hiç satýlmamýþtýr?
select m.SirketAdi, u.UrunAdi from Urunler u
cross join Musteriler m
except
select m.SirketAdi,u.UrunAdi from Musteriler m
left join Satislar s
on m.MusteriID=s.MusteriID
left join [Satis Detaylari] sd
on s.SatisID=sd.SatisID
left join Urunler u
on u.UrunID=sd.UrunID
group by m.SirketAdi,u.UrunAdi