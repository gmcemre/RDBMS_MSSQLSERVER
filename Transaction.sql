--Transaction: En k���k i�lem par�ac���d�r.
--Birden fazla i�lem par�ac���n� tek bir i�lem par�ac��� haline getirip bu i�lem par�ac���n�n herhangi bir yerinde hata oldu�u zaman t�m i�lemi iptal etmeyi geri almay� sa�layan yap�d�r.

select * from Kategoriler
INSERT INTO Kategoriler (KategoriAdi,Tanimi,Resim) values ('Ara S�caklar','�orba ile salata sunumu',null)

begin tran
delete  from Kategoriler where KategoriID=11
rollback tran