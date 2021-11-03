USE PROJETO;

CREATE TABLE VENDEDORES(
	IDVENDEDOR INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30)NOT NULL,
	SEXO CHAR(1) NOT NULL,
	JANEIRO FLOAT(10,2),
	FEVEREIRO FLOAT(10,2),
	MARCO FLOAT(10,2)
);


INSERT INTO VENDEDORES VALUES(NULL,'CARLOS','M',76234.78,88346.87,5756.90);
INSERT INTO VENDEDORES VALUES(NULL,'MARIA','F',5865.78,6768.87,4467.90);
INSERT INTO VENDEDORES VALUES(NULL,'ANTONIO','M',78769.78,6685.87,6664.90);
INSERT INTO VENDEDORES VALUES(NULL,'CLARA','F',5779.78,446886.87,8965.90);
INSERT INTO VENDEDORES VALUES(NULL,'ANDERSON','M',676545.78,77544.87,578665.90);
INSERT INTO VENDEDORES VALUES(NULL,'IVONE','F',57789.78,44774.87,68665.90);
INSERT INTO VENDEDORES VALUES(NULL,'JOAO','M',4785.78,66478.87,6887.90);
INSERT INTO VENDEDORES VALUES(NULL,'CELIA','F',89667.78,57654.87,5755.90);

/* FUNCÕES 
MAX = MAIOR , MIN = MENOR , AVG = MEDIA, SUM = SOMA
TODAS ESSAS SÃO FUNÇÕES QUE TRABALHAR COM COLUMN*/

SELECT IDVENDEDOR, NOME, SEXO, JANEIRO, FEVEREIRO, MARCO FROM VENDEDORES;

+------------+----------+------+-----------+-----------+-----------+
| IDVENDEDOR | NOME     | SEXO | JANEIRO   | FEVEREIRO | MARCO     |
+------------+----------+------+-----------+-----------+-----------+
|          1 | CARLOS   | M    |  76234.78 |  88346.87 |   5756.90 |
|          2 | MARIA    | F    |   5865.78 |   6768.87 |   4467.90 |
|          3 | ANTONIO  | M    |  78769.78 |   6685.87 |   6664.90 |
|          4 | CLARA    | F    |   5779.78 | 446886.88 |   8965.90 |
|          5 | ANDERSON | M    | 676545.75 |  77544.87 | 578665.88 |
|          6 | IVONE    | F    |  57789.78 |  44774.87 |  68665.90 |
|          7 | JOAO     | M    |   4785.78 |  66478.87 |   6887.90 |
|          8 | CELIA    | F    |  89667.78 |  57654.87 |   5755.90 |
+------------+----------+------+-----------+-----------+-----------+

SELECT MAX(FEVEREIRO) AS "MAIOR VALOR DE FEVEREIRO" FROM VENDEDORES;
+--------------------------+
| MAIOR VALOR DE FEVEREIRO |
+--------------------------+
|                446886.88 |
+--------------------------+

SELECT MIN(FEVEREIRO) AS "MENOR VALOR DE FEVEREIRO" FROM VENDEDORES;
+--------------------------+
| MENOR VALOR DE FEVEREIRO |
+--------------------------+
|                  6685.87 |
+--------------------------+

SELECT AVG(FEVEREIRO) AS "MEDIA DOS VALOR DE FEVEREIRO" FROM VENDEDORES;

+------------------------------+
| MEDIA DOS VALOR DE FEVEREIRO |
+------------------------------+
|                 99392.744873 |
+------------------------------+

/* TRUNCATE */

SELECT MAX(JANEIRO) AS "MAIOR VALOR DE JANEIRO",
MIN(FEVEREIRO) AS "MENOR VALOR DE FEVEREIRO",
TRUNCATE(AVG(JANEIRO),2) AS "MEDIA DE JANEIRO" FROM VENDEDORES;

+------------------------+--------------------------+------------------+
| MAIOR VALOR DE JANEIRO | MENOR VALOR DE FEVEREIRO | MEDIA DE JANEIRO |
+------------------------+--------------------------+------------------+
|              676545.75 |                  6685.87 |         124429.9 |
+------------------------+--------------------------+------------------+

/* FUNÇÃO SOMA SUM */

SELECT SUM(JANEIRO) AS "SOMA DE JANEIRO", 
SUM(FEVEREIRO) AS "SOMA DE FEVEREIRO",
SUM(MARCO) AS "SOMA DE MARÇO" FROM VENDEDORES;

+-----------------+-------------------+---------------+
| SOMA DE JANEIRO | SOMA DE FEVEREIRO | SOMA DE MARÇO |
+-----------------+-------------------+---------------+
|       995439.21 |         795141.96 |     685831.17 |
+-----------------+-------------------+---------------+

SELECT SEXO, SUM(JANEIRO), SUM(FEVEREIRO), SUM(MARCO)
FROM VENDEDORES
GROUP BY SEXO
ORDER BY JANEIRO, FEVEREIRO, MARCO;
+------+--------------+----------------+------------+
| SEXO | SUM(JANEIRO) | SUM(FEVEREIRO) | SUM(MARCO) |
+------+--------------+----------------+------------+
| F    |    159103.12 |      556085.49 |   87855.60 |
| M    |    836336.09 |      239056.47 |  597975.57 |
+------+--------------+----------------+------------+

/* Aplicando Subqueries */

/* VENDEDOR QUE VENDEU MENOS NO MÊS DE MARÇO
E SEU NOME */

SELECT MIN(MARCO) FROM VENDEDORES;
+------------+
| MIN(MARCO) |
+------------+
|    4467.90 |
+------------+

SELECT NOME, MARCO FROM VENDEDORES
WHERE MARCO = (SELECT MIN(MARCO) FROM VENDEDORES);

+-------+---------+
| NOME  | MARCO   |
+-------+---------+
| MARIA | 4467.90 |
+-------+---------+

/* VENDEDOR QUE VENDEU MAIS NO MÊS DE MARÇO
E SEU NOME */

SELECT MAX(MARCO) FROM VENDEDORES;
+------------+
| MAX(MARCO) |
+------------+
|  578665.88 |
+------------+

SELECT NOME, MARCO FROM VENDEDORES
WHERE MARCO = (SELECT MAX(MARCO) FROM VENDEDORES);

+----------+-----------+
| NOME     | MARCO     |
+----------+-----------+
| ANDERSON | 578665.88 |
+----------+-----------+

/* QUEM VENDEU MAIS DO QUE O VALOR MEDIO DE FEVEREIRO */

SELECT TRUNCATE(AVG(FEVEREIRO),2) FROM VENDEDORES;
+----------------------------+
| TRUNCATE(AVG(FEVEREIRO),2) |
+----------------------------+
|                   99392.74 |
+----------------------------+

SELECT NOME, FEVEREIRO FROM VENDEDORES
WHERE FEVEREIRO > (SELECT TRUNCATE(AVG(FEVEREIRO),2) FROM VENDEDORES);

+-------+-----------+
| NOME  | FEVEREIRO |
+-------+-----------+
| CLARA | 446886.88 |
 

 /* QUEM VENDEU MENOS DO QUE O VALOR MEDIO DE MARÇO */


SELECT TRUNCATE(AVG(MARCO),2) FROM VENDEDORES;

 +------------------------+
| TRUNCATE(AVG(MARCO),2) |
+------------------------+
|               85728.89 |
+------------------------+

SELECT NOME, MARCO AS "MARÇO" FROM VENDEDORES
WHERE MARCO < (SELECT TRUNCATE(AVG(MARCO),2) FROM VENDEDORES);


 /* Operações em linhas */

SELECT NOME,
			 JANEIRO,
			 FEVEREIRO, 
			 MARCO,
			 (JANEIRO+FEVEREIRO+MARCO) AS "TOTAL",
			 TRUNCATE((JANEIRO+FEVEREIRO+MARCO)/3,2) AS "MEDIA"
			 FROM VENDEDORES;

+----------+-----------+-----------+-----------+------------+-----------+
| NOME     | JANEIRO   | FEVEREIRO | MARCO     | TOTAL      | MEDIA     |
+----------+-----------+-----------+-----------+------------+-----------+
| CARLOS   |  76234.78 |  88346.87 |   5756.90 |  170338.55 |  56779.51 |
| MARIA    |   5865.78 |   6768.87 |   4467.90 |   17102.55 |   5700.84 |
| ANTONIO  |  78769.78 |   6685.87 |   6664.90 |   92120.55 |  30706.85 |
| CLARA    |   5779.78 | 446886.88 |   8965.90 |  461632.56 | 153877.51 |
| ANDERSON | 676545.75 |  77544.87 | 578665.88 | 1332756.49 | 444252.16 |
| IVONE    |  57789.78 |  44774.87 |  68665.90 |  171230.55 |  57076.85 |
| JOAO     |   4785.78 |  66478.87 |   6887.90 |   78152.55 |  26050.84 |
| CELIA    |  89667.78 |  57654.87 |   5755.90 |  153078.55 |  51026.18 |
+----------+-----------+-----------+-----------+------------+-----------+

SELECT NOME,
			 JANEIRO, 
			 FEVEREIRO, 
			 MARCO, 
			 (JANEIRO+FEVEREIRO+MARCO) AS "TOTAL",
			 (JANEIRO+FEVEREIRO+MARCO) * 0.75 AS "DESCONTO"
			 FROM VENDEDORES
			 ORDER BY JANEIRO, FEVEREIRO, MARCO;
			 
