--Delete : Belirli kayýt(larý) tablodan silme iþlemini saðlayan komuttur.
--Yazýmý: DELETE [from] TabloAdi (varsa where)

DELETE FROM Kategoriler where KategoriID=9
select * from Kategoriler

--Ürünler tablosuna yeni bir ürün ekleyip sonrasýnda o ürünün fiyatýný ve stoðunu güncelleyip en sonunda o ürünü silen sorgularý yazýnýz.
INSERT INTO Urunler (UrunAdi,HedefStokDuzeyi,BirimFiyati) VALUES ('AYVA',25,15)
declare @id int =Scope_Identity()
--set @id=Scope_Identity()
UPDATE Urunler SET BirimFiyati=50,HedefStokDuzeyi=30 where UrunID=@id
DELETE FROM Urunler where UrunID=@id
select * from Urunler