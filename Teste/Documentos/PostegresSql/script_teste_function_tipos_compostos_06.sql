CREATE or REPLACE FUNCTION data_ctl(opcao char, fdata date, fhora time) RETURNS
char(10) AS '
DECLARE
	opcao ALIAS FOR $1;
	vdata ALIAS FOR $2;
	vhora ALIAS FOR $3;
	retorno char(10);
BEGIN
	IF opcao = ''I'' THEN
		insert into datas (data, hora) values (vdata, vhora);
		retorno := ''INSERT'';
	END IF;
	IF opcao = ''U'' THEN
		update datas set data = vdata, hora = vhora where data=''1995-11-01'';
		retorno := ''UPDATE'';
	END IF;
	IF opcao = ''D'' THEN
		delete from datas where data = vdata;
		retorno := ''DELETE'';
	ELSE
		retorno := ''NENHUMA'';
	END IF;
	RETURN retorno;
END;
' LANGUAGE plpgsql;

select data_ctl('U','1997-11-01','06:36');