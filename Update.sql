--Update: Belli kayýt(larý) güncellemeyi saðlayan komuttur.
--Yazýmý: Update TabloAdi set Kolon=deger,Kolon=deger,Kolon=deger (varsa where yazýlýr)
begin tran
UPDATE Urunler set BirimFiyati=15 
rollback tran

UPDATE Urunler set BirimFiyati=15 where UrunID=78

begin tran
UPDATE Urunler set HedefStokDuzeyi=15 where KategoriID=1
rollback tran

--Kategori Id'si 2 olan ürünlerin stoðunu 5 arttýran sorguyu yazýnýz.
UPDATE Urunler set HedefStokDuzeyi+=5 where KategoriID=2

select * from Urunler where KategoriID=2