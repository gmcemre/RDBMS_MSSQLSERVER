--Update: Belli kay�t(lar�) g�ncellemeyi sa�layan komuttur.
--Yaz�m�: Update TabloAdi set Kolon=deger,Kolon=deger,Kolon=deger (varsa where yaz�l�r)
begin tran
UPDATE Urunler set BirimFiyati=15 
rollback tran

UPDATE Urunler set BirimFiyati=15 where UrunID=78

begin tran
UPDATE Urunler set HedefStokDuzeyi=15 where KategoriID=1
rollback tran

--Kategori Id'si 2 olan �r�nlerin sto�unu 5 artt�ran sorguyu yaz�n�z.
UPDATE Urunler set HedefStokDuzeyi+=5 where KategoriID=2

select * from Urunler where KategoriID=2