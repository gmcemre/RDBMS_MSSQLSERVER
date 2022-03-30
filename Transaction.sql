--Transaction: En küçük iþlem parçacýðýdýr.
--Birden fazla iþlem parçacýðýný tek bir iþlem parçacýðý haline getirip bu iþlem parçacýðýnýn herhangi bir yerinde hata olduðu zaman tüm iþlemi iptal etmeyi geri almayý saðlayan yapýdýr.

select * from Kategoriler
INSERT INTO Kategoriler (KategoriAdi,Tanimi,Resim) values ('Ara Sýcaklar','Çorba ile salata sunumu',null)

begin tran
delete  from Kategoriler where KategoriID=11
rollback tran