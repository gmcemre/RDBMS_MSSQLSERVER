--Order by komutu: Kayýtlarda sýrlama iþlemini saðlar.Varsayýlan küçükten büyüðe sýralar.
--asc: 0-9 veya a-z
--desc:9-0 veya z-a

--Ürünleri fiyatlarý büyükten küçüðe doðru olacak þekilde listeleyiniz.
select * from Urunler order by BirimFiyati desc

--Kategori ID si 5 olmayan ve ürün adýnýn ikinci harfi i olan ürünleri stoðuna göre tersten sýralayan sorguyu yazýnýz.
select * from Urunler where KategoriID!=5 and UrunAdi like '_i%' order by HedefStokDuzeyi desc

--Personel ID si 4 olan ve Nakliye ücreti 15 ile 45 arasýnda olan Sevk tarihine göre tersten sýralayarak son 3 kaydý getiren satýþlar tablosunun sorgusunu yazýnýz. (Tersten sýralandýðý için Top komutu ile son 3 geliyor.)
select Top 3 * from Satislar where PersonelID=4 and NakliyeUcreti between 15 and 45 order by SevkTarihi desc