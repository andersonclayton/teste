CREATE TEMP TABLE servidor_localizacao_processo_avaliacao(
id SERIAL,
id_servidor_localizacao int,
id_localizacao int,
id_processo_avaliacao int
);

CREATE TEMP TABLE servidor_localizacao(
id int,
id_servidor_localizacao int,
id_localizacao int,
id_processo_avaliacao int
);

insert into servidor_localizacao_processo_avaliacao values (1, 10, 1);
insert into servidor_localizacao_processo_avaliacao values (2, 10, 1);
insert into servidor_localizacao_processo_avaliacao values (3, 11, 1);
insert into servidor_localizacao_processo_avaliacao values (4, 11, 1);
insert into servidor_localizacao_processo_avaliacao values (1, 11, 2);
insert into servidor_localizacao_processo_avaliacao values (1, 11, 3);

insert into servidor_localizacao values (1, 10, 1);
insert into servidor_localizacao values (2, 11, 1);
insert into servidor_localizacao values (3, 11, 1);
insert into servidor_localizacao values (1, 12, 2);
insert into servidor_localizacao values (1, 13, 3);

select * from servidor_localizacao_processo_avaliacao 
select * from servidor_localizacao  

-- localizacoes que tem em Avaliação e não tem em dimensionamento
select id, id_servidor_localizacao, id_localizacao, id_processo_avaliacao, 'I' as operacao
from servidor_localizacao_processo_avaliacao loc1
where not exists (select 1 from servidor_localizacao loc2 
		where loc2.id_servidor_localizacao = loc1.id_servidor_localizacao 
		and loc2.id_processo_avaliacao = loc1.id_processo_avaliacao) 
union
-- localizacao alterada em Avaliacao
select id, id_servidor_localizacao, id_localizacao, id_processo_avaliacao, 'U' as operacao
from servidor_localizacao_processo_avaliacao loc1
where exists (select 1 from servidor_localizacao loc2 
		where (loc2.id_servidor_localizacao = loc1.id_servidor_localizacao 
		and loc2.id_processo_avaliacao = loc1.id_processo_avaliacao)
		AND loc2.id_localizacao <> loc1.id_localizacao)
order by 2,4,5