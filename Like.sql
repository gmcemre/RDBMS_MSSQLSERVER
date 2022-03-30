--Ürün adý Chai olan ürünü listeleyiniz.
select * from Urunler where UrunAdi='Chai'

--like komutu:
--Ýlk harfi C ile baþlayan devamýnda herhangi birþey ile gelen ürünleri listeleyiniz.
select * from Urunler where UrunAdi like 'C%'

--Baþýnda ne olursa olsun sondan bir önceki harfi C olan kayýtlarý getir.
select * from Urunler where UrunAdi like '%C_'

--Herhangi bir yerde C geçen ürünleri listeleyiniz.
select * from Urunler where UrunAdi like '%C%'

--Ürün adýnýn ilk harfi c veya a veya b ile baþlayan ürünleri listeleyiniz.
select * from Urunler where UrunAdi like '[_c,a,b]%'

--Ürün adýnda 'sos' geçen ürünleri listeleyiniz.
select * from Urunler where UrunAdi like '%sos%'

--Ürün adý s ile baþlayýp e ile biten ürünleri listeleyiniz.
select * from Urunler where UrunAdi like 's%e'

--Ürün adýnýn ikinci harfi a veya e olan ürünleri listeleyiniz.
select * from Urunler where UrunAdi like '_[_a,e]%'

--Ürün adýnýn sondan ikinci harfi i veya n olan ve c ile baþlayan ürünleri listeleyiniz.
select * from Urunler where UrunAdi like 'c%[_i,n]_'