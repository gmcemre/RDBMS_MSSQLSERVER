--Having Deyimi: Sadece group by kullan�lan sorgularda kullan�labilir.Aggregate function kullan�larak where yazmay� sa�lar.

--Sat�� fiyat� 1000 dolardan fazla olan hangi �r�nleri hangi personel satm��t�r.
select p.Adi,u.UrunAdi,SUM(sd.BirimFiyati*sd.Miktar*(1-sd.�ndirim)) as Total from Personeller p
left join Satislar s
on p.PersonelID=s.PersonelID
left join [Satis Detaylari] sd
on sd.SatisID=s.SatisID
left join Urunler u
on u.UrunID=sd.UrunID
group by p.Adi,u.UrunAdi
having SUM(sd.BirimFiyati*sd.Miktar*(1-sd.�ndirim))>1000