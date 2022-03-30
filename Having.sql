--Having Deyimi: Sadece group by kullanýlan sorgularda kullanýlabilir.Aggregate function kullanýlarak where yazmayý saðlar.

--Satýþ fiyatý 1000 dolardan fazla olan hangi ürünleri hangi personel satmýþtýr.
select p.Adi,u.UrunAdi,SUM(sd.BirimFiyati*sd.Miktar*(1-sd.Ýndirim)) as Total from Personeller p
left join Satislar s
on p.PersonelID=s.PersonelID
left join [Satis Detaylari] sd
on sd.SatisID=s.SatisID
left join Urunler u
on u.UrunID=sd.UrunID
group by p.Adi,u.UrunAdi
having SUM(sd.BirimFiyati*sd.Miktar*(1-sd.Ýndirim))>1000