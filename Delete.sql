--Delete : Belirli kay�t(lar�) tablodan silme i�lemini sa�layan komuttur.
--Yaz�m�: DELETE [from] TabloAdi (varsa where)

DELETE FROM Kategoriler where KategoriID=9
select * from Kategoriler

--�r�nler tablosuna yeni bir �r�n ekleyip sonras�nda o �r�n�n fiyat�n� ve sto�unu g�ncelleyip en sonunda o �r�n� silen sorgular� yaz�n�z.
INSERT INTO Urunler (UrunAdi,HedefStokDuzeyi,BirimFiyati) VALUES ('AYVA',25,15)
declare @id int =Scope_Identity()
--set @id=Scope_Identity()
UPDATE Urunler SET BirimFiyati=50,HedefStokDuzeyi=30 where UrunID=@id
DELETE FROM Urunler where UrunID=@id
select * from Urunler