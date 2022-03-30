Create proc prc_HavaleYap
@aliciId int,
@gonderenId int,
@tutar money
as
  begin try
  	update Hesaplar set Bakiye-=@tutar where Id=@gonderenId
	declare @a int=8/0 --O'a bölünebilme hatasý verdirdik.(Bilinçli olarak)
  	update Hesaplar set Bakiye+=@tutar where Id=@aliciId
  end try
  begin catch
  	print 'Hata Oluþtu'
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
	begin tran havale --havale isimli transaction baþlatýyoruz.
  	update Hesaplar set Bakiye-=@tutar where Id=@gonderenId
	declare @a int=8/0 
  	update Hesaplar set Bakiye+=@tutar where Id=@aliciId
	commit tran havale --açýlan transaction'ý onaylýyoruz.
  end try
  begin catch
	rollback tran havale --acçýlan transaction'ý feri alýyoruz.
  	print 'Hata Oluþtu'
  end catch

select * from Hesaplar

exec prc_HavaleYap 2,1,2000


--@@Trancount : Açýk olan transaction adedini verir.
select @@trancount