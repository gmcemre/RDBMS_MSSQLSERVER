--K�meleme fonksiyonlar�: Birle�tirme,kesi�im ve fark olmak �zere 3'e ayr�l�r.
--Farkl� iki sorgu �zerinde yukar�da belirtilen i�lemleri yapar.
--�nemli bir kural vard�r.Yukar�daki t�m  i�lemlerde iki sorgudaki kolon say�s� ve kolon tipleri ayn� olmak zorundad�r.
--Birle�tirme i�in -> Union
--Fark -> Except
--Kesi�im -> intersect

--Union:
--T�m cariyelerimizi listeleyen sorguyu yaz�n�z.(hem m��teri hemde tedarik�ilerimizi listeleyen sorgu)
select SirketAdi,'Tedarik�i' from Tedarikciler
union
select SirketAdi,'M��teri' from Musteriler

--intersect:
select SirketAdi from Tedarikciler
intersect
select SirketAdi from Musteriler

--except: �ki sorgu aras�ndaki fark� al�r.
select SirketAdi from Tedarikciler
except
select SirketAdi from Musteriler