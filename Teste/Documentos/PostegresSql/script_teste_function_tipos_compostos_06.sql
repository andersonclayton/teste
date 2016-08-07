create temp table datas (
dataatual DATE,
horaatual time
);

insert into datas values ('2016-07-06', '08:00:00')
insert into datas values ('1995-11-01', '10:00:00')
insert into datas values ('U','1997-11-01','06:36')
insert into datas values 'U','1997-11-01','06:36')

select * from datas

CREATE or REPLACE FUNCTION data_ctl(opcao char, fdata date, fhora time) RETURNS char(10) AS $$
DECLARE
    opcao ALIAS FOR $1;
    vdata ALIAS FOR $2;
    vhora ALIAS FOR $3;
    retorno char(10);
BEGIN
    IF opcao = 'I' THEN 
	insert into datas (dataatual, horaatual) values (vdata, vhora);
        retorno := 'INSERT';
    elsIF opcao = 'U' THEN 
	update datas set dataatual = vdata, horaatual = vhora where dataatual='1995-11-01';
        retorno := 'UPDATE';
    elsIF opcao = 'D' THEN 
	delete from datas where dataatual = vdata;
        retorno := 'DELETE';
    ELSE
        retorno := 'NENHUMA';
    END IF;	
    RETURN retorno;
END;
$$
LANGUAGE plpgsql;

select data_ctl('I','1996-11-01', '13:13');
select data_ctl('I','2016-07-06', '09:00:00');
select data_ctl('D','1997-11-01','06:36');
select data_ctl('U','1997-11-01','06:36');
select * from datas