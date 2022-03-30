--Insert,Update,Delete
--Insert:Bir tabloya kayýt eklemeyi saðlayan komuttur.
--Yazýmý: Insert [into] TabloAdi  (kolon,kolon,kolon,..) values (deger,deger,deger,..)

--Ürünler tablosuna ürün ekleyen sorguyu yazýnýz.
INSERT INTO Urunler (UrunAdi,BirimFiyati,HedefStokDuzeyi) VALUES ('Elma',2,120)
select * from Urunler
--Personeller tablosuna kendinizi personelolarak ekleyiniz.
INSERT INTO Personeller (Adi,SoyAdi) VALUES ('Emre','Gemici')
SELECT * FROM	Personeller
--Kayýt eklemek istediðimiztablodaki her kolona deðer girilecekse bu þekilde sorgu yazýlabilir.(Sýra önemli)
INSERT Bolge VALUES (5,'Akdeniz Bölgesi')
select * from Bolge

INSERT INTO Kategoriler VALUES('Meyveler','Elma,Armut vs.',null)
select * from Kategoriler