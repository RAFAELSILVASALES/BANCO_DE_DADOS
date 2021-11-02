CREATE DATABASE ACER;

USE ACER;

 /* A34 - ORGANIZAÇÃO DE CHAVES - CONSTRAINT (REGRA) */

CREATE TABLE CLIENTE(
IDCLIENTE INT,
NOME VARCHAR(30) NOT NULL
);

CREATE TABLE TELEFONE(
IDTELEFONE INT, 
TIPO ENUM('CEL', 'RES', 'COM') NOT NULL,
ID_CLIENTE INT

);

ALTER TABLE CLIENTE ADD CONSTRAINT PK_CLIENTE 
PRIMARY KEY (IDCLIENTE);

ALTER TABLE TELEFONE ADD CONSTRAINT FK_CLIENTE_TELEFONE
FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE);


SHOW CREATE TABLE CLIENTE;

SHOW CREATE TABLE TELEFONE;


/* DICIONARIO DE DADOS */
SHOW DATABASES;

USE USE INFORMATION_SCHEMA;

SHOW TABLES;

DESC TABLE_CONSTRAINTS;
+--------------------+-------------+------+-----+---------+-------+
| Field              | Type        | Null | Key | Default | Extra |
+--------------------+-------------+------+-----+---------+-------+
| CONSTRAINT_CATALOG | varchar(64) | YES  |     | NULL    |       |
| | varchar(64) | YES  |     | NULL    |       |
| CONSTRAINT_NAME    | varchar(64) | YES  |     | NULL    |       |
| TABLE_SCHEMA       | varchar(64) | YES  |     | NULL    |       |
| TABLE_NAME         | varchar(64) | YES  |     | NULL    |       |
| CONSTRAINT_TYPE    | varchar(11) | NO   |     |         |       |
| ENFORCED           | varchar(3)  | NO   |     |         |       |
+--------------------+-------------+------+-----+---------+-------+

SELECT CONSTRAINT_SCHEMA AS "BANCO",
       TABLE_NAME  AS   "TABELA",
       CONSTRAINT_NAME AS "NOME DA REGRA",
       CONSTRAINT_TYPE AS "TIPO"
       FROM TABLE_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = "acer";


USE ACER;

ALTER TABLE TELEFONE 
DROP FOREIGN KEY FK_CLIENTE_TELEFONE;


ALTER TABLE TELEFONE ADD CONSTRAINT FK_CLIENTE_TELEFONE
FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE);


