--Where:Kriter uygulamak için kullanýlan komuttur.

select * from Urunler where UrunID=5
--Fiyatý 50'den büyük olan ürünleri listeleyiniz.
select * from Urunler  where BirimFiyati>50
--KategoriID'si 6 olan ürünleri listeleyiniz.
select * from Urunler where KategoriID=6
--Stoðu 20'den küçük olan ürünleri listeleyiniz.
select * from Urunler where HedefStokDuzeyi<20
