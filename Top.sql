--Top komutu:
--�r�nler tablosundan ilk n kayd� listeleyiniz.
select top 10 * from Urunler 

--�r�n ad� c ile ba�lay�p sondan ikinci harfi n veya a olan ve fiyat� 25 ile 75 aras�nda �r�nlerden ilk 2 sini getiren sorguyu yaz�n�z.
select top 2 * from Urunler where UrunAdi like 'c%[_n,a]_'  and  BirimFiyati between 15 and 75