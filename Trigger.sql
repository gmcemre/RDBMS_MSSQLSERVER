--Trigger (Tetikleyici): Bir iþlemden sonraki bir iþlemi yapabilmeyi veya bir iþlemin yerine baþka bir iþlem yapabilmeyi saðlayan yapýdýr.
--Kullanýcý elle trigger'ý tetikleyemez.
--Trigger'ýn diðer yapýlardan farký çalýþacaðý zamaný kendisi belirler.
--2 tane trigger vardýr.
--Bunlar;
--After (Sonra) trigger ve instead Of (Yerine) Trigger
--Trigger iþlemlerinde kullanýlan 2 tane sanal tablo vardýr.
--Bunlar; inserted ve deleted tablolarýdýr.
--Eklenmeye çalýþýlan kayýt inserted tablosunda tutulur.
--Silinmeye çalýþýlan kayýtta deleted tablosunda tutulur.

select * from Urunler
go
--Ürünler tablosuna delete komutu gönderildiðinde delete komutu yerine update komutu çalýþtýran trigger'ý yazýyoruz.
create trigger trg_UrunSil
on Urunler --Hangi tabloda çalýþacaðýný belirtiyoruz.
instead of --Hangi trigger tipini kullanacaðýmý belirtiyoruz.
delete	--Hangi iþlem için bu trigger'ýn çalýþacaðýný belirtiyoruz.
as
	declare @id int 
	--select @id=UrunID from deleted  --1.Atama Yöntemi
	set @id=(select UrunID from deleted) --2.Atama Yöntemi
    update Urunler set Sonlandi=1 where UrunID=@id

--Instead Of Trigger : Belirli bir tablo üzerinde belirli bir iþlemin yerine baþka bir iþlem çalýþtýrmayý saðlayan trigger tipidir.
select * from Urunler
delete Urunler where UrunAdi='Chang'

go
--After Trigger: Belirli bir tablo üzerinde belirli bir iþlemden sonra baþka bir iþlem daha yapabilmeyi saðlayan trigger çeþididir.

--Satýþ Detay tablosuna kayýt girildiðinde satýlan ürün adedi kadar o ürünün stoðundan düþen trigger'ý yazýnýz.
create trigger trg_StokDus
on [Satis Detaylari]
after
insert
as
	declare @id int ,@miktar smallint
	set @id=(select UrunID from inserted)
	set @miktar=(select Miktar from inserted)
	update Urunler set HedefStokDuzeyi-=@miktar where UrunID=@id

select * from Urunler
select * from [Satis Detaylari]
insert [Satis Detaylari] values (10248,1,12,10,0)
insert [Satis Detaylari] values (10248,3,15,8,0)

go
--Satýþ detay tablosundan kayýt silindiðinde o ürünün stoðunu satýþ adedi kadar arrtýran trigger'ý yazýnýz.
alter trigger trg_StokArttir
on [Satis Detaylari]
after
delete
as
	declare @id int , @miktar smallint
	set @id=(select UrunID from deleted)
	set @miktar=(select Miktar from deleted)
	update Urunler set HedefStokDuzeyi+=@miktar where UrunID=@id

select * from Urunler
select * from [Satis Detaylari]
delete from [Satis Detaylari] where SatisID=10248 and UrunID=1