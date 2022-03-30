--DDL (Data Definition Language) : Ýçerisinde create , alter , drop komutlarý bulunur.
--Bu komutlar sayesinde
--Yeni veritabaný
--Yeni tablo,view procedure,trigger,function gibi elemanlar tanýmlanabilir,deðiþtirilebilir ve kaldýrýlabilir.

--Create: 
create table Kisiler(
KisiID int primary key identity(1,1),
KisiAdi nvarchar(50) not null, --boþ geçilemez
KisiSoyadi nvarchar(50) not null,
Sehir nvarchar(50)
)

alter table Kisiler 
drop column KisiAdi

go --batch Seperator(ayýrýcý) (üstteki ve alttaki komutu birbirinden ayýrýyor.Devamý zannetmiyor.)
--Drop : Var olan bir nesneyi silmeyi kaldýrmayý saðlar.
drop table Kisiler