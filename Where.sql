--Where:Kriter uygulamak i�in kullan�lan komuttur.

select * from Urunler where UrunID=5
--Fiyat� 50'den b�y�k olan �r�nleri listeleyiniz.
select * from Urunler  where BirimFiyati>50
--KategoriID'si 6 olan �r�nleri listeleyiniz.
select * from Urunler where KategoriID=6
--Sto�u 20'den k���k olan �r�nleri listeleyiniz.
select * from Urunler where HedefStokDuzeyi<20
