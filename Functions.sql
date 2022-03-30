--Functions(Fonksiyonlar):Procedure'lerin geriye de�er d�nd�ren halidir.
--Fonksiyonlar 3'e ayr�l�r.
--Bunlar;
--1:Scalar valued Functions
--2:Table valued Functions
--3:Aggregate valued Functions

--1:Scalar Valued Functions
CREATE FUNCTION fncKdvHesapla(@fiyat money)
returns money
as
begin
	declare @kdv money
	set @kdv=@fiyat*0.18 
	return @kdv
end

go
select UrunAdi,BirimFiyati,dbo.fncKdvHesapla(BirimFiyati) as Kdv from Urunler

go
--�r�n�n kdv li fiyat�n� hesaplayan functions'u yaz�n�z.
create function fncKdvliFiyat(@fiyat money)
returns money
as
begin
	declare @kdvliFiyat money
	set @kdvliFiyat=@fiyat+(@fiyat*0.18)
	return @kdvliFiyat
end

go
select UrunAdi,BirimFiyati,dbo.fncKdvHesapla(BirimFiyati) as Kdv,dbo.fncKdvliFiyat(BirimFiyati) as KdvliFiyat from Urunler

go
--Sat�lan �r�nlerin adedleri ve indirimleri de baz al�narak her �r�n�n kdv li fiyat�n� hesaplayan fonksiyonu yaz�n�z.(Sat�� Detay)
create function fncKdvliFiyatHesapla(@fiyat money,@miktar smallint,@indirim real)
returns money
as
begin  
	declare @KdvliFiyat money , @ToplamTutar money
	set @ToplamTutar=@fiyat*@miktar*(1-@indirim)
	set @KdvliFiyat = @ToplamTutar+(@ToplamTutar*0.18)
	return @KdvliFiyat
end
 go
select u.UrunAdi,sd.Miktar,sd.BirimFiyati,sd.�ndirim,dbo.fncKdvliFiyatHesapla(sd.BirimFiyati,sd.Miktar,sd.�ndirim) as KdvliFiyat from [Satis Detaylari] sd left join Urunler u on sd.UrunID=u.UrunID

go
--2.Table Valued Functions: Geriye table tipinde de�er d�nd�ren fonksiyonlard�r.
create function KategoriyeG�reUrunler(@kId int)
returns table
as
return select * from Urunler where KategoriID=@kId

go
select * from dbo.KategoriyeG�reUrunler(5)

--Table tipinde de�i�ken tan�mlama
declare @Kisiler table(b int)