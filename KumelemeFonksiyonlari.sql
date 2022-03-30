--Kümeleme fonksiyonlarý: Birleþtirme,kesiþim ve fark olmak üzere 3'e ayrýlýr.
--Farklý iki sorgu üzerinde yukarýda belirtilen iþlemleri yapar.
--Önemli bir kural vardýr.Yukarýdaki tüm  iþlemlerde iki sorgudaki kolon sayýsý ve kolon tipleri ayný olmak zorundadýr.
--Birleþtirme için -> Union
--Fark -> Except
--Kesiþim -> intersect

--Union:
--Tüm cariyelerimizi listeleyen sorguyu yazýnýz.(hem müþteri hemde tedarikçilerimizi listeleyen sorgu)
select SirketAdi,'Tedarikçi' from Tedarikciler
union
select SirketAdi,'Müþteri' from Musteriler

--intersect:
select SirketAdi from Tedarikciler
intersect
select SirketAdi from Musteriler

--except: Ýki sorgu arasýndaki farký alýr.
select SirketAdi from Tedarikciler
except
select SirketAdi from Musteriler