--in komutu: Birden fazla kriteri ayný anda uygulamamýzý saðlayan komuttur.
--Ürün Id si 5,7,9,11 olan ürünleri listeleyiniz.
select * from Urunler where UrunID in(5,7,9,11)

--Ürün adý Chai ve Chang olan ürünleri listeleyiniz.
select * from Urunler where UrunAdi in ('Chai','Chang')