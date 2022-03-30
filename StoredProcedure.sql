--Procedure: Procedure'u view'�n parametre alan �ekli gibi d���nebiliriz.�lla parametre almas� gerekmiyor aladabilir almayadabilir.
--�r�n listeleyen Procedure;
create procedure UrunListe
as
select * from Urunler

exec UrunListe

go
--�r�n ad�n� ,fiyat�n� ve sto�unu parametre olarak al�p �r�nler tablosuna ekleyen procedure'u yaz�n�z.(Insert)
create procedure UrunEkle
@urunAdi nvarchar(50),
@birimfiyat money,
@hedefStokD�zeyi smallint
as
insert Urunler (UrunAdi,BirimFiyati,HedefStokDuzeyi) values (@urunAdi,@birimfiyat,@hedefStokD�zeyi)

exec UrunEkle 'Karpuz',4,99
select * from Urunler

go

alter procedure UrunEkle
@urunAdi nvarchar(50),
@birimFiyat money,
@hedefStokD�zeyi smallint
as
declare @trimli nvarchar(50)=ltrim(rtrim(@urunAdi)) --lrim ve rtrim:sa� ve soldan bo�luklar�n� al�yor.
if(exists(select * from Urunler where UrunAdi=@trimli))
begin
	print 'Bu �r�nden zaten eklidir.'
end
else
begin
	insert Urunler (UrunAdi,BirimFiyati,HedefStokDuzeyi) values (@trimli,@birimfiyat,@hedefStokD�zeyi)
end

select * from Urunler
exec UrunEkle 'Kavun',7,82
exec UrunEkle 'Karpuz',6,78 -- 'Bu �r�n zaten eklidir' ��kt�s� veriyor.

go
--Urunler tablosundan girilen id de�eri ile �r�n silen procedure;
create proc UrunSil
@id int 
as
Delete Urunler where UrunID=@id

exec UrunSil 83
exec UrunSil 80

go
--id parametresi al�p o id'li �r�n�n sto�unu 10 artt�ran procedure'u yaz�n�z.
create proc StokArttir
@id int
as
UPDATE Urunler set HedefStokDuzeyi+=10 where UrunID=@id

select * from Urunler

exec StokArttir 85
exec StokArttir 86