--Procedure: Procedure'u view'ýn parametre alan þekli gibi düþünebiliriz.Ýlla parametre almasý gerekmiyor aladabilir almayadabilir.
--Ürün listeleyen Procedure;
create procedure UrunListe
as
select * from Urunler

exec UrunListe

go
--Ürün adýný ,fiyatýný ve stoðunu parametre olarak alýp ürünler tablosuna ekleyen procedure'u yazýnýz.(Insert)
create procedure UrunEkle
@urunAdi nvarchar(50),
@birimfiyat money,
@hedefStokDüzeyi smallint
as
insert Urunler (UrunAdi,BirimFiyati,HedefStokDuzeyi) values (@urunAdi,@birimfiyat,@hedefStokDüzeyi)

exec UrunEkle 'Karpuz',4,99
select * from Urunler

go

alter procedure UrunEkle
@urunAdi nvarchar(50),
@birimFiyat money,
@hedefStokDüzeyi smallint
as
declare @trimli nvarchar(50)=ltrim(rtrim(@urunAdi)) --lrim ve rtrim:sað ve soldan boþluklarýný alýyor.
if(exists(select * from Urunler where UrunAdi=@trimli))
begin
	print 'Bu üründen zaten eklidir.'
end
else
begin
	insert Urunler (UrunAdi,BirimFiyati,HedefStokDuzeyi) values (@trimli,@birimfiyat,@hedefStokDüzeyi)
end

select * from Urunler
exec UrunEkle 'Kavun',7,82
exec UrunEkle 'Karpuz',6,78 -- 'Bu ürün zaten eklidir' çýktýsý veriyor.

go
--Urunler tablosundan girilen id deðeri ile ürün silen procedure;
create proc UrunSil
@id int 
as
Delete Urunler where UrunID=@id

exec UrunSil 83
exec UrunSil 80

go
--id parametresi alýp o id'li ürünün stoðunu 10 arttýran procedure'u yazýnýz.
create proc StokArttir
@id int
as
UPDATE Urunler set HedefStokDuzeyi+=10 where UrunID=@id

select * from Urunler

exec StokArttir 85
exec StokArttir 86