Create proc prc_HavaleYap
@aliciId int,
@gonderenId int,
@tutar money
as
  begin try
  	update Hesaplar set Bakiye-=@tutar where Id=@gonderenId
	declare @a int=8/0 --O'a b�l�nebilme hatas� verdirdik.(Bilin�li olarak)
  	update Hesaplar set Bakiye+=@tutar where Id=@aliciId
  end try
  begin catch
  	print 'Hata Olu�tu'
  end catch

select * from Hesaplar

exec prc_HavaleYap 1,2,5000
go

alter proc prc_HavaleYap
@aliciId int,
@gonderenId int,
@tutar money
as
  begin try
	begin tran havale --havale isimli transaction ba�lat�yoruz.
  	update Hesaplar set Bakiye-=@tutar where Id=@gonderenId
	declare @a int=8/0 
  	update Hesaplar set Bakiye+=@tutar where Id=@aliciId
	commit tran havale --a��lan transaction'� onayl�yoruz.
  end try
  begin catch
	rollback tran havale --ac��lan transaction'� feri al�yoruz.
  	print 'Hata Olu�tu'
  end catch

select * from Hesaplar

exec prc_HavaleYap 2,1,2000


--@@Trancount : A��k olan transaction adedini verir.
select @@trancount