--�r�n ad� Chai olan �r�n� listeleyiniz.
select * from Urunler where UrunAdi='Chai'

--like komutu:
--�lk harfi C ile ba�layan devam�nda herhangi bir�ey ile gelen �r�nleri listeleyiniz.
select * from Urunler where UrunAdi like 'C%'

--Ba��nda ne olursa olsun sondan bir �nceki harfi C olan kay�tlar� getir.
select * from Urunler where UrunAdi like '%C_'

--Herhangi bir yerde C ge�en �r�nleri listeleyiniz.
select * from Urunler where UrunAdi like '%C%'

--�r�n ad�n�n ilk harfi c veya a veya b ile ba�layan �r�nleri listeleyiniz.
select * from Urunler where UrunAdi like '[_c,a,b]%'

--�r�n ad�nda 'sos' ge�en �r�nleri listeleyiniz.
select * from Urunler where UrunAdi like '%sos%'

--�r�n ad� s ile ba�lay�p e ile biten �r�nleri listeleyiniz.
select * from Urunler where UrunAdi like 's%e'

--�r�n ad�n�n ikinci harfi a veya e olan �r�nleri listeleyiniz.
select * from Urunler where UrunAdi like '_[_a,e]%'

--�r�n ad�n�n sondan ikinci harfi i veya n olan ve c ile ba�layan �r�nleri listeleyiniz.
select * from Urunler where UrunAdi like 'c%[_i,n]_'