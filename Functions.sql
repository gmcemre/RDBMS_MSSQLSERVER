--Functions(Fonksiyonlar):Procedure'lerin geriye deðer döndüren halidir.
--Fonksiyonlar 3'e ayrýlýr.
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
--Ürünün kdv li fiyatýný hesaplayan functions'u yazýnýz.
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
--Satýlan ürünlerin adedleri ve indirimleri de baz alýnarak her ürünün kdv li fiyatýný hesaplayan fonksiyonu yazýnýz.(Satýþ Detay)
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
select u.UrunAdi,sd.Miktar,sd.BirimFiyati,sd.Ýndirim,dbo.fncKdvliFiyatHesapla(sd.BirimFiyati,sd.Miktar,sd.Ýndirim) as KdvliFiyat from [Satis Detaylari] sd left join Urunler u on sd.UrunID=u.UrunID

go
--2.Table Valued Functions: Geriye table tipinde deðer döndüren fonksiyonlardýr.
create function KategoriyeGöreUrunler(@kId int)
returns table
as
return select * from Urunler where KategoriID=@kId

go
select * from dbo.KategoriyeGöreUrunler(5)

--Table tipinde deðiþken tanýmlama
declare @Kisiler table(b int)