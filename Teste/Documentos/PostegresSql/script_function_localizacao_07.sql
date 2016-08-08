CREATE or REPLACE FUNCTION exporta_localizacao() RETURNS char(10) AS $$
DECLARE
    loc RECORD;
    retorno char(10);
BEGIN
	FOR loc in 
		-- Localizacao que está na Avaliação, mas não no dimensionamento.
		select loc1.id, loc1.id_servidor_localizacao, loc1.id_localizacao, loc1.id_processo_avaliacao, 'I' as operacao
		from servidor_localizacao_processo_avaliacao loc1
		where not exists (select 1 from servidor_localizacao loc2 
				where loc2.id_servidor_localizacao = loc1.id_servidor_localizacao 
				and loc2.id_processo_avaliacao = loc1.id_processo_avaliacao)
		union
		-- Localizacao que está em Dimensionamento e que foi alterada na Avaliacao.
		select loc2.id, loc1.id_servidor_localizacao, loc1.id_localizacao, loc1.id_processo_avaliacao, 'U' as operacao
		from servidor_localizacao_processo_avaliacao loc1
		inner join servidor_localizacao loc2 on loc2.id_servidor_localizacao = loc1.id_servidor_localizacao 
				and loc2.id_processo_avaliacao = loc1.id_processo_avaliacao
		where loc2.id_localizacao <> loc1.id_localizacao
		order by 2,4,5
	LOOP
		if loc.operacao = 'I' then
			insert into servidor_localizacao (id, id_servidor_localizacao, id_localizacao, id_processo_avaliacao) 
			values (loc.id, loc.id_servidor_localizacao, loc.id_localizacao, loc.id_processo_avaliacao);
			retorno := 'INSERT'
		elsif loc.operacao = 'U' then
			update servidor_localizacao set id_localizacao = loc.id_localizacao where id = loc.id;
			retorno := 'UPDATE'
		end if;
	end loop;
    RETURN retorno;
END;
$$
LANGUAGE plpgsql;