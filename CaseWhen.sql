alter proc prc_Musteriler_Select
as
select 
Adi,
Soyadi,
SirketAdi,
Tckn,
TelNo,
DogumTarihi,
case MedeniDurum
when 1 then 'Bekar'
when 2 then 'Evli'
end as MedeniDurum,
case Cinsiyet
when 1 then 'Kadýn'
when 2 then 'Erkek'
end as Cinsiyet
from Musteriler