--Outer join : Ýliþkili tablolardaki null olan kayýtlarda dahil tüm kayýtlarý getirir.
--3 çeþit outer join vardýr.
--Bunlar; left outer join, right outer join, full outer join
--1.Left outer join: left tablo ilk yazýlan yani soldaki tablodur.Sol tablodaki tüm kayýtlarý getirir null olsa bile ve sað tablodan sol tablonun iliþkili kayýtlarý getirir.

select * from Urunler u left join Kategoriler k 
on u.KategoriID=k.KategoriID

--2.Right outer join:Saðdaki tablo right tablodur.Saðdaki tablodaki null kayýtlar dahil tüm kayýtlarý getirir.Soldaki tablodan iliþkili kayýtlar getirilir.

select * from Urunler u right join Kategoriler k 
on u.KategoriID=k.KategoriID

--Full outer join: Hem saðdaki tablodan hem soldaki tablodan null kayýtlarda dahil tüm kayýtlarý getirir.

select * from Urunler u full join Kategoriler k 
on u.KategoriID=k.KategoriID

--A/B kümesi (sadece urunlere ait kayýtlar gelir.)
select * from Urunler u left join Kategoriler k 
on u.KategoriID=k.KategoriID
where k.KategoriID is null

--B/A kümesi (sadece urunlere ait kayýtlar gelir.)
select * from Urunler u right join Kategoriler k 
on u.KategoriID=k.KategoriID
where u.KategoriID is null

--AUB / A(kesiþim)B
select * from Urunler u full join Kategoriler k 
on u.KategoriID=k.KategoriID
where u.KategoriID is null or k.KategoriID is null

--Hangi tedarikçiden toplamda kaç dolarlýk ürün tedarik edilmiþtir.(Tüm tedarikçiler gelmelidir.)
select t.TedarikciID,SUM( u.BirimFiyati*u.HedefStokDuzeyi) from Tedarikciler t right join
Urunler u on u.TedarikciID=t.TedarikciID
group by t.TedarikciID order by TedarikciID asc

--Hiç satýþ yapýlmayan müþterilerimizi listeleyen sorguyu yazýnýz.
select * from Musteriler m left join Satislar s
on m.MusteriAdi=s.MusteriID
where s.SatisID is null

--Hiç nakliye yapmayan nakliyecilerimizi listeleyen sorguyu yazýnýz.
select * from Nakliyeciler n left join Satislar s
on n.NakliyeciID=s.ShipVia
where s.ShipVia is null