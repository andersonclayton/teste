-- Funções em PlpgSQL
#01
CREATE or replace FUNCTION func_escopo() RETURNS integer AS $$
DECLARE
quantidade integer := 30;
BEGIN
	RAISE NOTICE 'Aqui a quantidade é %', quantidade; -- A quantidade aqui é 30
	quantidade := 50;
	--
	-- Criar um sub-bloco
	--
	DECLARE
		quantidade integer := 80;
	BEGIN
		RAISE NOTICE 'Aqui a quantidade é %', quantidade; -- A quantidade aqui é 80
	END;
	RAISE NOTICE 'Aqui a quantidade é %', quantidade; -- A quantidade aqui é 50
RETURN quantidade;
END;
$$ LANGUAGE plpgsql;

SELECT func_escopo();

--#02
