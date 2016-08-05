-- Funções SQL como fontes de tabelas
CREATE TEMP TABLE teste (testeid int, testesubid int, testename text);
INSERT INTO teste VALUES (1, 1, 'João');
INSERT INTO teste VALUES (1, 2, 'José');
INSERT INTO teste VALUES (2, 1, 'Maria');

-- #01
CREATE or replace FUNCTION getteste(int) RETURNS teste AS $$
SELECT * FROM teste WHERE testeid = $1;
$$ LANGUAGE SQL;

SELECT *, upper(testename) FROM getteste(1) AS t1;