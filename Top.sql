--Top komutu:
--Ürünler tablosundan ilk n kaydý listeleyiniz.
select top 10 * from Urunler 

--Ürün adý c ile baþlayýp sondan ikinci harfi n veya a olan ve fiyatý 25 ile 75 arasýnda ürünlerden ilk 2 sini getiren sorguyu yazýnýz.
select top 2 * from Urunler where UrunAdi like 'c%[_n,a]_'  and  BirimFiyati between 15 and 75