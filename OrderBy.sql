--Order by komutu: Kay�tlarda s�rlama i�lemini sa�lar.Varsay�lan k���kten b�y��e s�ralar.
--asc: 0-9 veya a-z
--desc:9-0 veya z-a

--�r�nleri fiyatlar� b�y�kten k����e do�ru olacak �ekilde listeleyiniz.
select * from Urunler order by BirimFiyati desc

--Kategori ID si 5 olmayan ve �r�n ad�n�n ikinci harfi i olan �r�nleri sto�una g�re tersten s�ralayan sorguyu yaz�n�z.
select * from Urunler where KategoriID!=5 and UrunAdi like '_i%' order by HedefStokDuzeyi desc

--Personel ID si 4 olan ve Nakliye �creti 15 ile 45 aras�nda olan Sevk tarihine g�re tersten s�ralayarak son 3 kayd� getiren sat��lar tablosunun sorgusunu yaz�n�z. (Tersten s�raland��� i�in Top komutu ile son 3 geliyor.)
select Top 3 * from Satislar where PersonelID=4 and NakliyeUcreti between 15 and 45 order by SevkTarihi desc