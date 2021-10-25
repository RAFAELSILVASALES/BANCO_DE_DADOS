CREATE DATABASE COMERCIO;

SHOW DATABASES;

USE COMERCIO;

/* O ENUM NO MYSQL É UMA CAIXA DE ESCOLHAR EXEMPLO ESCOLHER ENTRE Femenino ou masculino. */

/* unique QUE DISSE VALOR UNICO */

CREATE TABLE CLIENTE(
  IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
  NOME VARCHAR(30) NOT NULL,
  SEXO ENUM('F', 'M') NOT NULL,  
  EMAIL(50) UNIQUE,
  CPF (14) UNIQUE
);


CREATE TABLE ENDERECO(
  IDENDERECO INT PRIMARY KEY AUTO_INCREMENT,
  RUA VARCHAR(30) NOT NULL,
  BAIRRO VARCHAR(30) NOT NULL,
  CIDADE VARCHAR(30) NOT NULL,
  ESTADO CHAR(2) NOT NULL,
  ID_CLIENTE INT UNIQUE ,  /* no relacionamento 1 x 1 se colocar unique na chave 
  estrangeira */

  FOREIGN KEY (ID_CLIENTE)
  REFERENCES CLIENTE (IDCLIENTE)

);

CREATE TABLE TELEFONE(
  IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
  TIPO ENUM('RES', 'COM', 'CEL') NOT NULL,
  NUMERO VARCHAR(20) NOT NULL,
  ID_CLIENTE INT,

  FOREIGN KEY (ID_CLIENTE)
  REFERENCES CLIENTE (IDCLIENTE)
);  /* no relacionamento de 1 x n a chave estrangeira não tem unique */




INSERT INTO CLIENTE VALUES(NULL, 'DAVI', 'M', 'davipedrohenriqueryansantos', '958.873.313-80');
/* INSERINDO DADOS NA TABELA O NULL COMO PRIMEIRO DADO DE CHAVE PRIMARY
 QUE DISSE, QUE O BANCO DE DADOS QUE VAI CUIDA DE GERAR OS IDS */

INSERT INTO CLIENTE VALUES(NULL, 'MÁRCIA', 'F', NULL, '750.468.843-64');


INSERT INTO CLIENTE VALUES(NULL, 'MARCELA', 'F', 'marcelarenatasebastianaferreira', '061.395.303-77');

INSERT INTO CLIENTE VALUES(NULL,'BENJAMIN', 'M', 'benjaminfilipeclaudiovieira', '063.849.163-04');


INSERT INTO CLIENTE VALUES(NULL, 'ANTONIO', 'M', NULL, '772.710.443-45');

INSERT INTO CLIENTE VALUES(NULL, 'LUIZ', 'M', NULL, '652.722.043-01');


+-----------+----------+------+---------------------------------+----------------+
| IDCLIENTE | NOME     | SEXO | EMAIL                           | CPF            |
+-----------+----------+------+---------------------------------+----------------+
|         1 | DAVI     | M    | davipedrohenriqueryansantos     | 958.873.313-80 |
|         2 | MÁRCIA   | F    | NULL                            | 750.468.843-64 |
|         3 | MARCELA  | F    | marcelarenatasebastianaferreira | 061.395.303-77 |
|         4 | BENJAMIN | M    | benjaminfilipeclaudiovieira     | 063.849.163-04 |
|         5 | ANTONIO  | M    | NULL                            | 772.710.443-45 |
|         6 | LUIZ     | M    | NULL                            | 652.722.043-01 |
+-----------+----------+------+---------------------------------+----------------+

INSERT INTO ENDERECO VALUES(NULL, 'Rua Senador Benedito Leite', 'Centro', 'Coroatá', 'MA',1);

INSERT INTO ENDERECO VALUES(NULL, 'Rua Sul', 'Nossa Senhora das Graças', 'Uberlândia', 'MG',2);

INSERT INTO ENDERECO VALUES(NULL,'Rua Francisco Lamounier', 'Divinópolis', 'Uberlândia', 'MG',3);

INSERT INTO ENDERECO VALUES(NULL,'Beco Venith', 'Tijuco', 'Uberlândia', 'MG',4);

INSERT INTO ENDERECO VALUES(NULL, 'Rua Luiz Visibelli', 'Presidente Roosevelt', 'Uberlândia', 'MG', 5);

INSERT INTO ENDERECO VALUES(NULL, 'Rua Vinte e Um', 'Morada Nova', 'Uberlândia', 'MG', 6);


INSERT INTO TELEFONE VALUES(NULL, 'CEL', '(34) 98488-3015',1);
INSERT INTO TELEFONE VALUES(NULL, 'RES', '(34) 98488-3025',1);
INSERT INTO TELEFONE VALUES(NULL, 'CEL', '(34) 98488-3014',1);
INSERT INTO TELEFONE VALUES(NULL, 'COM', '(34) 98488-3035',2);
INSERT INTO TELEFONE VALUES(NULL, 'CEL', '(34) 98488-3115',4);
INSERT INTO TELEFONE VALUES(NULL, 'COM', '(34) 98488-3515',2;
INSERT INTO TELEFONE VALUES(NULL, 'CEL', '(34) 98488-3415',3);
INSERT INTO TELEFONE VALUES(NULL, 'COM', '(34) 98488-3515',4);
INSERT INTO TELEFONE VALUES(NULL, 'CEL', '(34) 98488-3715',5);


/* junção join entre duas tabelas */
nome , sexo, email tipo, numero

SELECT NOME, SEXO, EMAIL, TIPO, NUMERO 
FROM CLIENTE
  INNER JOIN TELEFONE
  ON IDCLIENTE = ID_CLIENTE;

  ----------+------+---------------------------------+------+-----------------+
| NOME     | SEXO | EMAIL                           | TIPO | NUMERO          |
+----------+------+---------------------------------+------+-----------------+
| DAVI     | M    | davipedrohenriqueryansantos     | CEL  | (34) 98488-3015 |
| DAVI     | M    | davipedrohenriqueryansantos     | RES  | (34) 98488-3025 |
| DAVI     | M    | davipedrohenriqueryansantos     | CEL  | (34) 98488-3014 |
| MÁRCIA   | F    | NULL                            | COM  | (34) 98488-3035 |
| BENJAMIN | M    | benjaminfilipeclaudiovieira     | CEL  | (34) 98488-3115 |
| MARCELA  | F    | marcelarenatasebastianaferreira | CEL  | (34) 98488-3415 |
| BENJAMIN | M    | benjaminfilipeclaudiovieira     | COM  | (34) 98488-3515 |
| ANTONIO  | M    | NULL                            | CEL  | (34) 98488-3715 |
+----------+------+---------------------------------+------+-----------------+     

NOME , SEXO, CPF , BAIRRO, ESTADO 

SELECT NOME, SEXO, CPF , BAIRRO, ESTADO 
FROM CLIENTE
    INNER JOIN ENDERECO
    ON IDCLIENTE = ID_CLIENTE;


+----------+------+----------------+--------------------------+--------+
| NOME     | SEXO | CPF            | BAIRRO                   | ESTADO |
+----------+------+----------------+--------------------------+--------+
| DAVI     | M    | 958.873.313-80 | Centro                   | MA     |
| MÁRCIA   | F    | 750.468.843-64 | Nossa Senhora das Graças | MG     |
| ANTONIO  | M    | 772.710.443-45 | Presidente Roosevelt     | MG     |
| LUIZ     | M    | 652.722.043-01 | Morada Nova              | MG     |
| MARCELA  | F    | 061.395.303-77 | Divinópolis              | MG     |
| BENJAMIN | M    | 063.849.163-04 | Tijuco                   | MG     |
+----------+------+----------------+--------------------------+--------+

SELECT NOME , SEXO, CPF, RUA, CIDADE, ESTADO
FROM CLIENTE
    INNER JOIN ENDERECO
    ON IDCLIENTE = ID_CLIENTE
WHERE CIDADE = 'COROATÁ';

+------+------+----------------+----------------------------+---------+--------+
| NOME | SEXO | CPF            | RUA                        | CIDADE  | ESTADO |
+------+------+----------------+----------------------------+---------+--------+
| DAVI | M    | 958.873.313-80 | Rua Senador Benedito Leite | Coroatá | MA     |
+------+------+----------------+----------------------------+---------+--------+

SELECT NOME, SEXO, CPF, TIPO, NUMERO 
FROM CLIENTE
    INNER JOIN TELEFONE
    ON IDCLIENTE = ID_CLIENTE
AND SEXO = 'F';

+---------+------+----------------+------+-----------------+
| NOME    | SEXO | CPF            | TIPO | NUMERO          |
+---------+------+----------------+------+-----------------+
| MÁRCIA  | F    | 750.468.843-64 | COM  | (34) 98488-3035 |
| MARCELA | F    | 061.395.303-77 | CEL  | (34) 98488-3415 |
+---------+------+----------------+------+-----------------+


/* join entre três tabelas
usando ponteramento para melhorar a performance do banco */
NOME , SEXO , BAIRRO, CIDADE, TIPO, NUMERO 
/* APELIDO PARA CLIENTE, ENDERECO E TELEFONE
CLIENTE = C 
ENDERECO = E
TELEFONE = T */
SELECT C.NOME, C.SEXO, E.BAIRRO, E.CIDADE, T.TIPO , T.NUMERO 
FROM CLIENTE C
    INNER JOIN ENDERECO E
    ON C.IDCLIENTE = E.ID_CLIENTE
    INNER JOIN TELEFONE T
    ON C.IDCLIENTE = T.ID_CLIENTE;

+----------+------+--------------------------+------------+------+-----------------+
| NOME     | SEXO | BAIRRO                   | CIDADE     | TIPO | NUMERO          |
+----------+------+--------------------------+------------+------+-----------------+
| DAVI     | M    | Centro                   | Coroatá    | CEL  | (34) 98488-3015 |
| DAVI     | M    | Centro                   | Coroatá    | RES  | (34) 98488-3025 |
| DAVI     | M    | Centro                   | Coroatá    | CEL  | (34) 98488-3014 |
| MÁRCIA   | F    | Nossa Senhora das Graças | Uberlândia | COM  | (34) 98488-3035 |
| MARCELA  | F    | Divinópolis              | Uberlândia | CEL  | (34) 98488-3415 |
| BENJAMIN | M    | Tijuco                   | Uberlândia | CEL  | (34) 98488-3115 |
| BENJAMIN | M    | Tijuco                   | Uberlândia | COM  | (34) 98488-3515 |
| ANTONIO  | M    | Presidente Roosevelt     | Uberlândia | CEL  | (34) 98488-3715 |
+----------+------+--------------------------+------------+------+-----------------+

*
/*
DML - DATA MANIPULATION LANGUAGE
DDL - DATA DEFINITION LANGUAGE
DCL - DATA CONTROL LANGUAGE
TCL - TRANSACTION CONTROL LANGUAGE

*/

/* DML */

/* INSERT */
 INSERT INTO CLIENTE VALUES(NULL, 'PAULA','M', NULL,'745.345.343-34' );
 INSERT INTO CLIENTE VALUES(NULL, 'PAULA3333','F', NULL,'745.345.343-36' );
  SELECT IDCLIENTE, NOME, SEXO FROM CLIENTE;
+-----------+----------+------+
| IDCLIENTE | NOME     | SEXO |
+-----------+----------+------+
|         1 | DAVI     | M    |
|         2 | MÁRCIA   | F    |
|         3 | MARCELA  | F    |
|         4 | BENJAMIN | M    |
|         5 | ANTONIO  | M    |
|         6 | LUIZ     | M    |
|         7 | PAULA    | M    |
+-----------+----------+------+
 INSERT INTO ENDERECO VALUES(NULL, 'Rua Senador Benedito Leite', 'Centro', 'Coroatá', 'MA',7);


/* FILROS */
SELECT IDCLIENTE , NOME, EMAIL, CPF, SEXO FROM CLIENTE 
WHERE IDCLIENTE = 7;

+-----------+-------+-------+----------------+------+
| IDCLIENTE | NOME  | EMAIL | CPF            | SEXO |
+-----------+-------+-------+----------------+------+
|         7 | PAULA | NULL  | 745.345.343-34 | M    |
+-----------+-------+-------+----------------+------+


/* UPDATE */
UPDATE CLIENTE 
SET SEXO = 'F'
WHERE IDCLIENTE = '7';

SELECT IDCLIENTE , NOME, EMAIL, CPF, SEXO FROM CLIENTE 
WHERE IDCLIENTE = 7;

+-----------+-------+-------+----------------+------+
| IDCLIENTE | NOME  | EMAIL | CPF            | SEXO |
+-----------+-------+-------+----------------+------+
|         7 | PAULA | NULL  | 745.345.343-34 | F    |
+-----------+-------+-------+----------------+------+


/* DELETE */
SELECT IDCLIENTE , NOME, EMAIL, CPF, SEXO FROM CLIENTE 
WHERE IDCLIENTE = 8;

+-----------+-----------+-------+----------------+------+
| IDCLIENTE | NOME      | EMAIL | CPF            | SEXO |
+-----------+-----------+-------+----------------+------+
|         8 | PAULA3333 | NULL  | 745.345.343-36 | F    |
+-----------+-----------+-------+----------------+------+
DELETE FROM CLIENTE 
WHERE IDCLIENTE = 8;

/* DDL - DATA DEFINITION LANGUAGE */

CREATE TABLE  PRODUTO(
  IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
  NOME_DO_PRODUTO VARCHAR(30) NOT NULL,
  PRECO INT,
  FRETE FLOAT(10,2) NOT NULL 

);

+-----------------+-------------+------+-----+---------+----------------+
| Field           | Type        | Null | Key | Default | Extra          |
+-----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO       | int         | NO   | PRI | NULL    | auto_increment |
| NOME_DO_PRODUTO | varchar(30) | NO   |     | NULL    |                |
| PRECO           | int         | YES  |     | NULL    |                |
| FRETE           | float(10,2) | NO   |     | NULL    |                |
+-----------------+-------------+------+-----+---------+----------------+

/* ALTER TABLE */

/* ALTERANDO O NOME DE UMA COLUNA - CHANGE */

ALTER TABLE PRODUTO 
CHANGE PRECO VALOR_UNITARIO INT NOT NULL;

+-----------------+-------------+------+-----+---------+----------------+
| Field           | Type        | Null | Key | Default | Extra          |
+-----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO       | int         | NO   | PRI | NULL    | auto_increment |
| NOME_DO_PRODUTO | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO  | int         | NO   |     | NULL    |                |
| FRETE           | float(10,2) | NO   |     | NULL    |                |
+-----------------+-------------+------+-----+---------+----------------+

/* MODIFY - ALTERANDO O TIPO DE DADO */

ALTER TABLE PRODUTO
MODIFY VALOR_UNITARIO VARCHAR(60) NOT NULL;

+-----------------+-------------+------+-----+---------+----------------+
| Field           | Type        | Null | Key | Default | Extra          |
+-----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO       | int         | NO   | PRI | NULL    | auto_increment |
| NOME_DO_PRODUTO | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO  | varchar(60) | NO   |     | NULL    |                |
| FRETE           | float(10,2) | NO   |     | NULL    |                |
+-----------------+-------------+------+-----+---------+----------------+

/* ADICIONANDO COLUNAS */

ALTER  TABLE PRODUTO
ADD PESO FLOAT(10,2) NOT NULL;

/* APAGANDO UMA COLUNA */
ALTER TABLE PRODUTO 
DROP COLUMN PESO;

/* ADICIONANDO UMA COLUNA NA ORDEM ESPECIFICA */ 
ALTER TABLE PRODUTO 
ADD COLUMN PESO FLOAT(10,2) NOT NULL
AFTER NOME_DO_PRODUTO;

ALTER TABLE PRODUTO 
DROP COLUMN PEESO;

+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| IDENDERECO | int         | NO   | PRI | NULL    | auto_increment |
| RUA        | varchar(30) | NO   |     | NULL    |                |
| BAIRRO     | varchar(30) | NO   |     | NULL    |                |
| CIDADE     | varchar(30) | NO   |     | NULL    |                |
| ESTADO     | char(2)     | NO   |     | NULL    |                |
| ID_CLIENTE | int         | YES  | UNI | NULL    |                |
+------------+-------------+------+-----+---------+----------------+


+-----------+---------------+------+-----+---------+----------------+
| Field     | Type          | Null | Key | Default | Extra          |
+-----------+---------------+------+-----+---------+----------------+
| IDCLIENTE | int           | NO   | PRI | NULL    | auto_increment |
| NOME      | varchar(30)   | NO   |     | NULL    |                |
| SEXO      | enum('F','M') | NO   |     | NULL    |                |
| EMAIL     | varchar(50)   | YES  | UNI | NULL    |                |
| CPF       | varchar(15)   | YES  | UNI | NULL    |                |
+-----------+---------------+------+-----+---------+----------------+

+------------+-------------------------+------+-----+---------+----------------+
| Field      | Type                    | Null | Key | Default | Extra          |
+------------+-------------------------+------+-----+---------+----------------+
| IDTELEFONE | int                     | NO   | PRI | NULL    | auto_increment |
| TIPO       | enum('RES','COM','CEL') | NO   |     | NULL    |                |
| NUMERO     | varchar(20)             | NO   |     | NULL    |                |
| ID_CLIENTE | int                     | YES  | MUL | NULL    |                |
+------------+-------------------------+------+-----+---------+----------------+

SELECT C.IDCLIENTE, C.NOME, C.SEXO, C.EMAIL, C.CPF, E.RUA, E.BAIRRO, E.CIDADE, E.ESTADO, T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;


/* UPDATE */

SELECT IDCLIENTE, NOME, SEXO EMAIL, CPF FROM CLIENTE 
WHERE SEXO = 'F';

SELECT IDCLIENTE, NOME, SEXO EMAIL, CPF FROM CLIENTE 
WHERE SEXO = 'M';

SELECT IDCLIENTE, NOME, SEXO EMAIL, CPF FROM CLIENTE 
WHERE IDCLIENTE IN (12, 13, 14, 16, 18, 19);


SELECT IDCLIENTE, NOME, SEXO EMAIL, CPF FROM CLIENTE 
WHERE IDCLIENTE = 16;


UPDATE CLIENTE 
SET SEXO = 'M'
WHERE IDCLIENTE =16;

SELECT IDCLIENTE, NOME, SEXO, EMAIL, CPF FROM CLIENTE 
WHERE IDCLIENTE IN (12,13,14,18,19);

UPDATE CLIENTE 
SET SEXO = 'F'
WHERE IDCLIENTE IN (12,13,14,18,19);

REGISTRO 12 13 14 16 18 19

SELECT COUNT(*) AS "QUANTIDADE DE CLIENTES" FROM CLIENTE;

/* Somente clientes do sexo M */

SELECT C.IDCLIENTE, C.NOME, C.SEXO, C.EMAIL, C.CPF , E.RUA, E.BAIRRO, E.CIDADE, E.ESTADO, T.TIPO, T.NUMERO
    FROM CLIENTE C
    INNER JOIN ENDERECO  E
    ON C.IDCLIENTE = E.ID_CLIENTE
    INNER JOIN TELEFONE T
    ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'M';

/* Somente clientes do sexo F */
SELECT C.NOME, C.SEXO, C.EMAIL, C.CPF, E.RUA, E.BAIRRO, E.CIDADE, E.ESTADO, T.TIPO, T.NUMERO 
    FROM CLIENTE C
    INNER JOIN ENDERECO E
    ON C.IDCLIENTE = E.ID_CLIENTE
    INNER JOIN TELEFONE T
    ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO ='F';

SELECT SEXO, COUNT(*) AS "QUANTIDADE DE HOMENS E MULHERES" FROM CLIENTE 
GROUP BY SEXO;

SELECT C.NOME, C.SEXO, C.EMAIL, C.CPF, E.RUA, E.BAIRRO, E.CIDADE, E.ESTADO, T.TIPO, T.NUMERO
FROM CLIENTE C
    INNER JOIN ENDERECO E
    ON C.IDCLIENTE = E.ID_CLIENTE
    INNER JOIN TELEFONE T
    ON C.IDCLIENTE = E.ID_CLIENTE

WHERE SEXO ='F' AND(CIDADE = 'RIO DE JANEIRO' AND BAIRRO ='CENTRO');


SELECT NOME, SEXO, CPF, TIPO, NUMERO 
FROM CLIENTE 
  INNER JOIN TELEFONE
  ON IDCLIENTE = ID_CLIENTE

WHERE NUMERO IS NOT NULL;

SELECT IDTELEFONE, TIPO, NUMERO FROM TELEFONE
WHERE IDTELEFONE IN(12,13,14,18,19);


UPDATE TELEFONE 
SET NUMERO ='NULL'
WHERE IDTELEFONE IN(12,13,14,18,19);


SELECT C.NOME, C.EMAIL, T.NUMERO AS CELULAR
FROM CLIENTE C
  INNER JOIN TELEFONE T
  ON C.IDCLIENTE = T.ID_CLIENTE
  INNER JOIN ENDERECO E
  ON C.IDCLIENTE = E.ID_CLIENTE
WHERE TIPO ='CEL' AND ESTADO = 'RJ';

SELECT C.NOME, C.EMAIL, T.NUMERO AS CELULAR
FROM CLIENTE C
  INNER JOIN ENDERECO E
  ON C.IDCLIENTE = E.ID_CLIENTE
  INNER JOIN TELEFONE T
  ON C.IDCLIENTE = T.ID_CLIENTE

WHERE SEXO ='F' AND ESTADO = 'SP';

SELECT C.NOME, C.EMAIL, T.NUMERO AS CELULAR
FROM CLIENTE C
  INNER JOIN ENDERECO E
  ON C.IDCLIENTE = E.ID_CLIENTE
  INNER JOIN TELEFONE T
  ON C.IDCLIENTE = T.ID_CLIENTE

WHERE SEXO ='F' AND ESTADO = 'RJ';


SELECT C.NOME, C.EMAIL, T.NUMERO AS CELULAR, E.ESTADO 
FROM CLIENTE C
  INNER JOIN ENDERECO E
  ON C.IDCLIENTE = E.ID_CLIENTE
  INNER JOIN TELEFONE T
  ON C.IDCLIENTE = T.ID_CLIENTE

WHERE SEXO ='F';

/* nome, email, numero , estado */
/* in on clause is ambiguous É UM ERRO, OU SEJA FALTOU COLOCAR A TÉCNICA DE
PONTERAMENTO */ 

SELECT C.NOME, C.EMAIL, T.NUMERO, E.ESTADO
FROM CLIENTE C
  INNER JOIN TELEFONE T
  ON C.IDCLIENTE = T.ID_CLIENTE
  INNER JOIN ENDERECO E
  ON C.IDCLIENTE = E.ID_CLIENTE;

  +----------+---------------------------------+-----------------+--------+
| NOME     | EMAIL                           | NUMERO          | ESTADO |
+----------+---------------------------------+-----------------+--------+
| DAVI     | davipedrohenriqueryansantos     | (34) 98488-3015 | MA     |
| DAVI     | davipedrohenriqueryansantos     | (34) 98488-3025 | MA     |
| DAVI     | davipedrohenriqueryansantos     | (34) 98488-3014 | MA     |
| MÁRCIA   | NULL                            | (34) 98488-3035 | MG     |
| BENJAMIN | benjaminfilipeclaudiovieira     | (34) 98488-3115 | MG     |
| MARCELA  | marcelarenatasebastianaferreira | (34) 98488-3415 | MG     |
| BENJAMIN | benjaminfilipeclaudiovieira     | (34) 98488-3515 | MG     |
| ANTONIO  | NULL                            | (34) 98488-3715 | MG     |
| FLAVIO   | FLAVIO@IG.COM                   | 68976565        | MG     |
| FLAVIO   | FLAVIO@IG.COM                   | 99656675        | MG     |
| GIOVANA  | NULL                            | 33567765        | RJ     |
| GIOVANA  | NULL                            | NULL            | RJ     |
| GIOVANA  | NULL                            | NULL            | RJ     |
| KARLA    | KARLA@GMAIL.COM                 | NULL            | RJ     |
| DANIELE  | DANIELE@GMAIL.COM               | 88965676        | ES     |
| EDUARDO  | NULL                            | 89966809        | PR     |
| ANTONIO  | ANTONIO@IG.COM                  | 88679978        | SP     |
| ANTONIO  | ANTONIO@UOL.COM                 | NULL            | PR     |
| ELAINE   | ELAINE@GLOBO.COM                | NULL            | SP     |
| CARMEM   | CARMEM@IG.COM                   | 77455786        | RJ     |
| CARMEM   | CARMEM@IG.COM                   | 89766554        | RJ     |
| ADRIANA  | ADRIANA@GMAIL.COM               | 77755785        | RJ     |
| ADRIANA  | ADRIANA@GMAIL.COM               | 44522578        | RJ     |
+----------+---------------------------------+-----------------+--------+

/* como utilizar a função IFNULL PARA RETIRAR VALORES NULOS DE UMA COLUNA */

SELECT C.NOME, 
       IFNULL(C.EMAIL, '*****************') AS EMAIL,
       E.ESTADO
FROM CLIENTE C
  INNER JOIN ENDERECO E
  ON C.IDCLIENTE = E.ID_CLIENTE
  INNER JOIN TELEFONE T
  ON C.IDCLIENTE = T.ID_CLIENTE;

  +----------+---------------------------------+-----------------+--------+
| NOME     | EMAIL                           | NUMERO          | ESTADO |
+----------+---------------------------------+-----------------+--------+
| DAVI     | davipedrohenriqueryansantos     | (34) 98488-3015 | MA     |
| DAVI     | davipedrohenriqueryansantos     | (34) 98488-3025 | MA     |
| DAVI     | davipedrohenriqueryansantos     | (34) 98488-3014 | MA     |
| MÁRCIA   | ****************                | (34) 98488-3035 | MG     |
| BENJAMIN | benjaminfilipeclaudiovieira     | (34) 98488-3115 | MG     |
| MARCELA  | marcelarenatasebastianaferreira | (34) 98488-3415 | MG     |
| BENJAMIN | benjaminfilipeclaudiovieira     | (34) 98488-3515 | MG     |
| ANTONIO  | ****************                | (34) 98488-3715 | MG     |
| FLAVIO   | FLAVIO@IG.COM                   | 68976565        | MG     |
| FLAVIO   | FLAVIO@IG.COM                   | 99656675        | MG     |
| GIOVANA  | ****************                | 33567765        | RJ     |
| GIOVANA  | ****************                | NULL            | RJ     |
| GIOVANA  | ****************                | NULL            | RJ     |
| KARLA    | KARLA@GMAIL.COM                 | NULL            | RJ     |
| DANIELE  | DANIELE@GMAIL.COM               | 88965676        | ES     |
| EDUARDO  | ****************                | 89966809        | PR     |
| ANTONIO  | ANTONIO@IG.COM                  | 88679978        | SP     |
| ANTONIO  | ANTONIO@UOL.COM                 | NULL            | PR     |
| ELAINE   | ELAINE@GLOBO.COM                | NULL            | SP     |
| CARMEM   | CARMEM@IG.COM                   | 77455786        | RJ     |
| CARMEM   | CARMEM@IG.COM                   | 89766554        | RJ     |
| ADRIANA  | ADRIANA@GMAIL.COM               | 77755785        | RJ     |
| ADRIANA  | ADRIANA@GMAIL.COM               | 44522578        | RJ     |
+----------+---------------------------------+-----------------+--------+

/* NOME, SEXO, EMAIL, TIPO, NUMERO , BAIRRO, CIDADE, ESTADO */

SELECT C.NOME, C.SEXO, C.EMAIL, T.TIPO, T.NUMERO, E.BAIRRO, E.CIDADE, E.ESTADO 
FROM CLIENTE C
    INNER JOIN TELEFONE T
    ON C.IDCLIENTE = T.ID_CLIENTE
    INNER JOIN ENDERECO E
    ON C.IDCLIENTE = E.ID_CLIENTE;


/* VIEW 
CRIAÇÃO DE UMA VIEW*/

CREATE VIEW RELATORIO AS 
SELECT C.NOME, 
       C.SEXO, 
       C.EMAIL, 
       T.TIPO, 
       T.NUMERO, 
       E.BAIRRO, 
       E.CIDADE, 
       E.ESTADO 
FROM CLIENTE C
    INNER JOIN TELEFONE T
    ON C.IDCLIENTE = T.ID_CLIENTE
    INNER JOIN ENDERECO E
    ON C.IDCLIENTE = E.ID_CLIENTE;


/* UTILIZANDO A VIEW QUE FOI CRIADA | O FROM RELATORIO É O NOME DA WIEW QUE FOI CRIADA */
SELECT NOME, SEXO, EMAIL, TIPO, NUMERO, BAIRRO, CIDADE, ESTADO FROM RELATORIO;
/* DELETE DE UMA VIEW */
DROP VIEW RELATORIO;

/* INSERINDO UM PREFIXO 
TUDO QUE TIVER V_ É UMA VIEW*/


CREATE VIEW V_RELATORIO AS 
SELECT C.NOME, 
       C.SEXO, 
       C.EMAIL, 
       T.TIPO, 
       T.NUMERO, 
       E.BAIRRO, 
       E.CIDADE, 
       E.ESTADO 
FROM CLIENTE C
    INNER JOIN TELEFONE T
    ON C.IDCLIENTE = T.ID_CLIENTE
    INNER JOIN ENDERECO E
    ON C.IDCLIENTE = E.ID_CLIENTE;


SELECT NOME, NUMERO, ESTADO FROM V_RELATORIO;

+----------+-----------------+--------+
| NOME     | NUMERO          | ESTADO |
+----------+-----------------+--------+
| DAVI     | (34) 98488-3015 | MA     |
| DAVI     | (34) 98488-3025 | MA     |
| DAVI     | (34) 98488-3014 | MA     |
| MÁRCIA   | (34) 98488-3035 | MG     |
| BENJAMIN | (34) 98488-3115 | MG     |
| MARCELA  | (34) 98488-3415 | MG     |
| BENJAMIN | (34) 98488-3515 | MG     |
| ANTONIO  | (34) 98488-3715 | MG     |
| FLAVIO   | 68976565        | MG     |
| FLAVIO   | 99656675        | MG     |
| GIOVANA  | 33567765        | RJ     |
| GIOVANA  | NULL            | RJ     |
| GIOVANA  | NULL            | RJ     |
| KARLA    | NULL            | RJ     |
| DANIELE  | 88965676        | ES     |
| EDUARDO  | 89966809        | PR     |
| ANTONIO  | 88679978        | SP     |
| ANTONIO  | NULL            | PR     |
| ELAINE   | NULL            | SP     |
| CARMEM   | 77455786        | RJ     |
| CARMEM   | 89766554        | RJ     |
| ADRIANA  | 77755785        | RJ     |
| ADRIANA  | 44522578        | RJ     |
+----------+-----------------+--------+

SELECT NOME, TIPO, BAIRRO, CIDADE, ESTADO FROM V_RELATORIO
WHERE SEXO = 'F' AND(BAIRRO='CENTRO' AND ESTADO='RJ');

/* Column 'ID_CLIENTE' in on clause is ambiguous
valtou usar a técnica de ponteramento */

SELECT C.NOME, C.SEXO, C.EMAIL, T.TIPO, T.NUMERO, E.BAIRRO, E.CIDADE, E.ESTADO
FROM CLIENTE C
    INNER JOIN TELEFONE T
    ON C.IDCLIENTE = T.ID_CLIENTE
    INNER JOIN ENDERECO  E
    ON C.IDCLIENTE = E.ID_CLIENTE

WHERE SEXO = 'F' AND(BAIRRO='CENTRO' AND ESTADO='RJ');


CREATE VIEW V_CAMPANHA_DE_MARKETING AS  
SELECT C.IDCLIENTE, C.NOME, C.EMAIL, T.TIPO, T.NUMERO, E.BAIRRO, E.CIDADE, E.ESTADO
FROM CLIENTE  C 
  INNER JOIN TELEFONE  T
  ON C.IDCLIENTE = T.ID_CLIENTE
  INNER JOIN ENDERECO  E
  ON C.IDCLIENTE = E.ID_CLIENTE

WHERE SEXO ='F' AND(BAIRRO ='CENTRO' AND ESTADO ='RJ');

SHOW TABLES;

SELECT IDCLIENTE, NOME, EMAIL, TIPO, NUMERO, BAIRRO, CIDADE, ESTADO FROM V_CAMPANHA_DE_MARKETING;

/* UPDATE, INSERT E DELETE - DML */

INSERT INTO V_RELATORIO VALUES(
'ANDREIA','F','ANDREIA@UOL.COM.BR','CEL','873547864','CENTRO','VITORIA','ES'
);

ERROR 1394 (HY000): Can not insert into join view 'comercio.v_relatorio' without fields list
ERROR 1395 (HY000): Can not delete from join view 'comercio.v_relatorio'

/* Quando usar uma view você não pode usar comandos de  INSERT, DELETE 
SOMENTE UPDATE */

/* UPDATE EM UMA VIEW */
SELECT IDCLIENTE, NOME, SEXO, EMAIL, CPF FROM CLIENTE 
WHERE NOME ='GIOVANA';

+-----------+---------+------+-------+---------+
| IDCLIENTE | NOME    | SEXO | EMAIL | CPF     |
+-----------+---------+------+-------+---------+
|        11 | GIOVANA | F    | NULL  | 0876655 |
+-----------+---------+------+-------+---------+

UPDATE V_CAMPANHA_DE_MARKETING
SET NOME = 'MARIA'
WHERE IDCLIENTE = 11;

/************************************ USANDO ORDER BY *************************************/
CREATE DATABASE TESTE;

USE TESTE;

CREATE TABLE ALUNOS(
  IDALUNO INT PRIMARY KEY AUTO_INCREMENT,
  NOME  VARCHAR(30) NOT NULL,
  SEXO ENUM('F', 'M') NOT NULL,
  IDADE INT

);

ALTER TABLE ALUNOS 
MODIFY COLUMN IDADE CHAR(3) NOT NULL;

INSERT INTO ALUNOS VALUES(NULL, 'RAFAEL', 'M', '22');
INSERT INTO ALUNOS VALUES(NULL, 'LUCAS', 'M', '19');
INSERT INTO ALUNOS VALUES(NULL, 'MARIA', 'F', '22');
INSERT INTO ALUNOS VALUES(NULL, 'LIANA', 'F', '16');
INSERT INTO ALUNOS VALUES(NULL, 'SELMA', 'F', '28');
INSERT INTO ALUNOS VALUES(NULL, 'IGOR', 'M', '22');
INSERT INTO ALUNOS VALUES(NULL, 'LETÍCIA', 'F', '26');

SELECT IDALUNO, NOME, SEXO, IDADE FROM ALUNOS;

+---------+---------+------+-------+
| IDALUNO | NOME    | SEXO | IDADE |
+---------+---------+------+-------+
|       1 | RAFAEL  | M    | 22    |
|       2 | LUCAS   | M    | 19    |
|       3 | MARIA   | F    | 22    |
|       4 | LIANA   | F    | 16    |
|       5 | SELMA   | F    | 28    |
|       6 | IGOR    | M    | 22    |
|       7 | LETÍCIA | F    | 26    |
+---------+---------+------+-------+

SELECT IDALUNO, NOME, SEXO, IDADE FROM ALUNOS
ORDER BY IDADE;

+---------+---------+------+-------+
| IDALUNO | NOME    | SEXO | IDADE |
+---------+---------+------+-------+
|       4 | LIANA   | F    | 16    |
|       2 | LUCAS   | M    | 19    |
|       1 | RAFAEL  | M    | 22    |
|       3 | MARIA   | F    | 22    |
|       6 | IGOR    | M    | 22    |
|       7 | LETÍCIA | F    | 26    |
|       5 | SELMA   | F    | 28    |
+---------+---------+------+-------+


SELECT C.IDCLIENTE, C.NOME, C.EMAIL, T.TIPO, T.NUMERO, E.BAIRRO, E.CIDADE, E.ESTADO
FROM CLIENTE  C 
  INNER JOIN TELEFONE  T
  ON C.IDCLIENTE = T.ID_CLIENTE
  INNER JOIN ENDERECO  E
  ON C.IDCLIENTE = E.ID_CLIENTE

ORDER BY NOME;

