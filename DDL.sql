--DDL (Data Definition Language) : ��erisinde create , alter , drop komutlar� bulunur.
--Bu komutlar sayesinde
--Yeni veritaban�
--Yeni tablo,view procedure,trigger,function gibi elemanlar tan�mlanabilir,de�i�tirilebilir ve kald�r�labilir.

--Create: 
create table Kisiler(
KisiID int primary key identity(1,1),
KisiAdi nvarchar(50) not null, --bo� ge�ilemez
KisiSoyadi nvarchar(50) not null,
Sehir nvarchar(50)
)

alter table Kisiler 
drop column KisiAdi

go --batch Seperator(ay�r�c�) (�stteki ve alttaki komutu birbirinden ay�r�yor.Devam� zannetmiyor.)
--Drop : Var olan bir nesneyi silmeyi kald�rmay� sa�lar.
drop table Kisiler