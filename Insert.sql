--Insert,Update,Delete
--Insert:Bir tabloya kay�t eklemeyi sa�layan komuttur.
--Yaz�m�: Insert [into] TabloAdi  (kolon,kolon,kolon,..) values (deger,deger,deger,..)

--�r�nler tablosuna �r�n ekleyen sorguyu yaz�n�z.
INSERT INTO Urunler (UrunAdi,BirimFiyati,HedefStokDuzeyi) VALUES ('Elma',2,120)
select * from Urunler
--Personeller tablosuna kendinizi personelolarak ekleyiniz.
INSERT INTO Personeller (Adi,SoyAdi) VALUES ('Emre','Gemici')
SELECT * FROM	Personeller
--Kay�t eklemek istedi�imiztablodaki her kolona de�er girilecekse bu �ekilde sorgu yaz�labilir.(S�ra �nemli)
INSERT Bolge VALUES (5,'Akdeniz B�lgesi')
select * from Bolge

INSERT INTO Kategoriler VALUES('Meyveler','Elma,Armut vs.',null)
select * from Kategoriler