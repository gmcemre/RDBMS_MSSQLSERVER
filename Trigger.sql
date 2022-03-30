--Trigger (Tetikleyici): Bir i�lemden sonraki bir i�lemi yapabilmeyi veya bir i�lemin yerine ba�ka bir i�lem yapabilmeyi sa�layan yap�d�r.
--Kullan�c� elle trigger'� tetikleyemez.
--Trigger'�n di�er yap�lardan fark� �al��aca�� zaman� kendisi belirler.
--2 tane trigger vard�r.
--Bunlar;
--After (Sonra) trigger ve instead Of (Yerine) Trigger
--Trigger i�lemlerinde kullan�lan 2 tane sanal tablo vard�r.
--Bunlar; inserted ve deleted tablolar�d�r.
--Eklenmeye �al���lan kay�t inserted tablosunda tutulur.
--Silinmeye �al���lan kay�tta deleted tablosunda tutulur.

select * from Urunler
go
--�r�nler tablosuna delete komutu g�nderildi�inde delete komutu yerine update komutu �al��t�ran trigger'� yaz�yoruz.
create trigger trg_UrunSil
on Urunler --Hangi tabloda �al��aca��n� belirtiyoruz.
instead of --Hangi trigger tipini kullanaca��m� belirtiyoruz.
delete	--Hangi i�lem i�in bu trigger'�n �al��aca��n� belirtiyoruz.
as
	declare @id int 
	--select @id=UrunID from deleted  --1.Atama Y�ntemi
	set @id=(select UrunID from deleted) --2.Atama Y�ntemi
    update Urunler set Sonlandi=1 where UrunID=@id

--Instead Of Trigger : Belirli bir tablo �zerinde belirli bir i�lemin yerine ba�ka bir i�lem �al��t�rmay� sa�layan trigger tipidir.
select * from Urunler
delete Urunler where UrunAdi='Chang'

go
--After Trigger: Belirli bir tablo �zerinde belirli bir i�lemden sonra ba�ka bir i�lem daha yapabilmeyi sa�layan trigger �e�ididir.

--Sat�� Detay tablosuna kay�t girildi�inde sat�lan �r�n adedi kadar o �r�n�n sto�undan d��en trigger'� yaz�n�z.
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
--Sat�� detay tablosundan kay�t silindi�inde o �r�n�n sto�unu sat�� adedi kadar arrt�ran trigger'� yaz�n�z.
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