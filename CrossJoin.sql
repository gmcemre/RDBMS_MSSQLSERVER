--Cross Join: Tablolardaki t�m kay�tlar� birbiri ile kartezyen �arp�m yaparak ili�kilendirir.
select *  from Urunler u 
cross join Kategoriler

--Hangi personel hangi �r�nlerden sat�� yapmam��t�r.
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

--Hangi tedarik�iden hangi �r�n hi� tedarik edilmemi�tir.
select t.SirketAdi,u.UrunAdi from Tedarikciler t
cross join Urunler u
except
select t.SirketAdi,u.UrunAdi from Tedarikciler t
right join Urunler u 
on u.TedarikciID=t.TedarikciID
group by t.SirketAdi,u.UrunAdi

--Hangi �r�n hangi m��teriye hi� sat�lmam��t�r?
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