-- CRIA TABELA
CREATE TEMP TABLE empregados (
nome text,
salario numeric,
idade integer,
baia point
);

-- POPULA TABELA
INSERT INTO empregados VALUES('João',2200,21,point('(1,1)'));
INSERT INTO empregados VALUES('José',4200,30,point('(2,1)'));
select * from empregados 

-- TESTES DE FUNÇÕES
-- #01
CREATE FUNCTION dobrar_salario(empregados) 
RETURNS numeric AS $$
   SELECT $1.salario * 2 AS salario;
$$ LANGUAGE SQL;

SELECT nome, dobrar_salario(emp.*) AS sonho
FROM empregados as emp
WHERE emp.baia ~= point '(2,1)';

SELECT nome, dobrar_salario(ROW(nome, salario*1.1, idade, baia)) AS sonho
FROM empregados;

-- retorna um tipo composto
CREATE OR REPLACE FUNCTION novo_empregado() RETURNS empregados AS $$
SELECT text 'Nenhum' AS nome,
1000.0 AS salario,
25 AS idade,
point '(2,2)' AS baia;
$$ LANGUAGE SQL;

SELECT novo_empregado();
select * from novo_empregado();

-- OUTROS TESTE
-- #01
CREATE OR REPLACE FUNCTION olamundo() 
RETURNS int4 AS 
'SELECT 1' LANGUAGE 'sql';
SELECT olamundo() ;

-- #02
CREATE OR REPLACE FUNCTION add_numeros(nr1 int4, nr2 int4) RETURNS int4
AS 'SELECT $1 + $2' LANGUAGE 'sql';
SELECT add_numeros(300, 700) AS resposta ;

