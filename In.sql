--in komutu: Birden fazla kriteri ayn� anda uygulamam�z� sa�layan komuttur.
--�r�n Id si 5,7,9,11 olan �r�nleri listeleyiniz.
select * from Urunler where UrunID in(5,7,9,11)

--�r�n ad� Chai ve Chang olan �r�nleri listeleyiniz.
select * from Urunler where UrunAdi in ('Chai','Chang')