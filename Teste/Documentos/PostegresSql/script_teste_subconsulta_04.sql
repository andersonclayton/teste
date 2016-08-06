CREATE TEMPORARY TABLE frutas (id SERIAL PRIMARY KEY, nome TEXT);
INSERT INTO frutas VALUES (DEFAULT, 'banana');
INSERT INTO frutas VALUES (DEFAULT, 'maçã');

CREATE TEMPORARY TABLE alimentos (id SERIAL PRIMARY KEY, nome TEXT);
INSERT INTO alimentos VALUES (DEFAULT, 'maçã');
INSERT INTO alimentos VALUES (DEFAULT, 'espinafre');

-- EXISTS / CASE
SELECT nome, CASE WHEN EXISTS (SELECT nome FROM frutas WHERE nome=a.nome)
THEN 'sim'
ELSE 'não'
END AS fruta
FROM alimentos a;

--IN
SELECT nome, CASE WHEN nome IN (SELECT nome FROM frutas)
THEN 'sim'
ELSE 'não'
END AS fruta
FROM alimentos;

--NOT IN
--ANY/SOME
SELECT nome, CASE WHEN nome = ANY (SELECT nome FROM frutas)
THEN 'sim'
ELSE 'não'
END AS fruta
FROM alimentos;

--CASE WHEN
CREATE TABLE notas (
nota decimal(4,2) CONSTRAINT chknota
CHECK (nota BETWEEN 0.00 AND 10.00)
);
INSERT INTO notas VALUES(10);
INSERT INTO notas VALUES(9.2);
INSERT INTO notas VALUES(9.0);
INSERT INTO notas VALUES(8.3);
INSERT INTO notas VALUES(7.7);
INSERT INTO notas VALUES(7.4);
INSERT INTO notas VALUES(6.4);
INSERT INTO notas VALUES(5.8);
INSERT INTO notas VALUES(5.1);
INSERT INTO notas VALUES(5.0);
INSERT INTO notas VALUES(0); 

select * from notas

SELECT CASE
	WHEN nota < 3 THEN 'E' -- 0 a 3
	WHEN nota < 5 THEN 'D' -- 3 a 5
	WHEN nota < 7 THEN 'C' -- 5 a 7
	WHEN nota < 9 THEN 'B' -- 7 a 9
	ELSE 'A' -- 9 a 10
END AS conceito,
COUNT(*) AS quantidade,
MIN(nota) AS menor,
MAX(nota) AS maior,
ROUND(AVG(nota)) AS media
FROM notas
GROUP BY CASE
WHEN nota < 3 THEN 'E' -- Aqui podemos utilizar expressões
WHEN nota < 5 THEN 'D'
WHEN nota < 7 THEN 'C'
WHEN nota < 9 THEN 'B'
ELSE 'A'
END
ORDER BY conceito;

--Mostrando os Dados em uma única linha:
SELECT COUNT(CASE WHEN nota BETWEEN 9.00 AND 10.00 THEN 1 ELSE NULL END) AS A,
COUNT(CASE WHEN nota BETWEEN 7.00 AND 8.99 THEN 1 ELSE NULL END) AS B,
COUNT(CASE WHEN nota BETWEEN 5.00 AND 6.99 THEN 1 ELSE NULL END) AS C,
COUNT(CASE WHEN nota BETWEEN 3.00 AND 4.99 THEN 1 ELSE NULL END) AS D,
COUNT(CASE WHEN nota BETWEEN 0.00 AND 2.99 THEN 1 ELSE NULL END) AS E
FROM notas;

--Mostrar cada nota junto com a menor nota, a maior nota, e a média de todas as notas.
SELECT nota,
(SELECT MIN(nota) FROM notas) AS menor,
(SELECT MAX(nota) FROM notas) AS maior,
(SELECT AVG(nota) FROM notas) AS media
FROM notas;