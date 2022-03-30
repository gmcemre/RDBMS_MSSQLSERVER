--Outer join : �li�kili tablolardaki null olan kay�tlarda dahil t�m kay�tlar� getirir.
--3 �e�it outer join vard�r.
--Bunlar; left outer join, right outer join, full outer join
--1.Left outer join: left tablo ilk yaz�lan yani soldaki tablodur.Sol tablodaki t�m kay�tlar� getirir null olsa bile ve sa� tablodan sol tablonun ili�kili kay�tlar� getirir.

select * from Urunler u left join Kategoriler k 
on u.KategoriID=k.KategoriID

--2.Right outer join:Sa�daki tablo right tablodur.Sa�daki tablodaki null kay�tlar dahil t�m kay�tlar� getirir.Soldaki tablodan ili�kili kay�tlar getirilir.

select * from Urunler u right join Kategoriler k 
on u.KategoriID=k.KategoriID

--Full outer join: Hem sa�daki tablodan hem soldaki tablodan null kay�tlarda dahil t�m kay�tlar� getirir.

select * from Urunler u full join Kategoriler k 
on u.KategoriID=k.KategoriID

--A/B k�mesi (sadece urunlere ait kay�tlar gelir.)
select * from Urunler u left join Kategoriler k 
on u.KategoriID=k.KategoriID
where k.KategoriID is null

--B/A k�mesi (sadece urunlere ait kay�tlar gelir.)
select * from Urunler u right join Kategoriler k 
on u.KategoriID=k.KategoriID
where u.KategoriID is null

--AUB / A(kesi�im)B
select * from Urunler u full join Kategoriler k 
on u.KategoriID=k.KategoriID
where u.KategoriID is null or k.KategoriID is null

--Hangi tedarik�iden toplamda ka� dolarl�k �r�n tedarik edilmi�tir.(T�m tedarik�iler gelmelidir.)
select t.TedarikciID,SUM( u.BirimFiyati*u.HedefStokDuzeyi) from Tedarikciler t right join
Urunler u on u.TedarikciID=t.TedarikciID
group by t.TedarikciID order by TedarikciID asc

--Hi� sat�� yap�lmayan m��terilerimizi listeleyen sorguyu yaz�n�z.
select * from Musteriler m left join Satislar s
on m.MusteriAdi=s.MusteriID
where s.SatisID is null

--Hi� nakliye yapmayan nakliyecilerimizi listeleyen sorguyu yaz�n�z.
select * from Nakliyeciler n left join Satislar s
on n.NakliyeciID=s.ShipVia
where s.ShipVia is null