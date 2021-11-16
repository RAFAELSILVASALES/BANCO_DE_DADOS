/* ESTRUTURA DE UMA TRIGGER */

CREATE TRIGGER NOME -- O nome da trigger 
-- essa trigger eu posso usar antes (BEFORE) ou depois (AFTER) de um evento
-- acontecer, esse evento pode ser insert , delete , update em uma tabela
BEFORE/AFTER INSERT/DELETE/UPDATE ON TABELA
FOR EACH ROW (PARA CADA LINHA)
BEGIN -> INICIO

		QUALQUER COMANDO SQL

END -> FIM
-- NEW, OLD 
-- NOVO , VELHO
USE PROJETO;

CREATE TABLE USUARIO(
	IDUSUARIO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	LOGIN VARCHAR(10) NOT NULL,
	SENHA VARCHAR(10) NOT NULL
);

INSERT INTO USUARIO VALUES(NULL, 'RAFAEL', '@RAFAEL_23','2399495');

INSERT INTO USUARIO VALUES(NULL, 'LETÍCIA,', '@LETÍCIA23','345455');

SELECT IDUSUARIO, NOME, LOGIN, SENHA FROM USUARIO;

+-----------+--------+------------+---------+
| IDUSUARIO | NOME   | LOGIN      | SENHA   |
+-----------+--------+------------+---------+
|         1 | RAFAEL | @RAFAEL_23 | 2399495 |
+-----------+--------+------------+---------+

/* TRIGGER */
CREATE TABLE BACKUP_USUARIO(
	IDBACKUP INT PRIMARY KEY AUTO_INCREMENT,
	IDUSUARIO INT,
	NOME VARCHAR(30) NOT NULL,
	LOGIN VARCHAR(10) NOT NULL

);
-- DELIMITER $
CREATE TRIGGER BACK_USUARIO
BEFORE DELETE ON USUARIO
FOR EACH ROW 

BEGIN 

   INSERT INTO BACKUP_USUARIO VALUES(NULL, OLD.IDUSUARIO,OLD.NOME, OLD.LOGIN);



END 
$

DELIMITER ;

DELETE FROM USUARIO 
WHERE IDUSUARIO = 1;

SELECT IDBACKUP, IDUSUARIO, NOME, LOGIN FROM BACKUP_USUARIO;

+----------+-----------+--------+------------+
| IDBACKUP | IDUSUARIO | NOME   | LOGIN      |
+----------+-----------+--------+------------+
|        1 |         1 | RAFAEL | @RAFAEL_23 |
+----------+-----------+--------+------------+


SELECT IDUSUARIO, NOME, LOGIN, SENHA FROM USUARIO;

+-----------+----------+------------+--------+
| IDUSUARIO | NOME     | LOGIN      | SENHA  |
+-----------+----------+------------+--------+
|         2 | LETÍCIA, | @LETÍCIA23 | 345455 |
+-----------+----------+------------+--------+



/* EXEMPLO*/

CREATE TABLE CARRO(
  IDCARRO INT PRIMARY KEY AUTO_INCREMENT,
  MODELO VARCHAR(40) NOT NULL,
  PLACA VARCHAR(30) NOT NULL UNIQUE

);

INSERT INTO CARRO VALUES(NULL,' Gol', 'HTM-20');
INSERT INTO CARRO VALUES(NULL,' Uno', 'JGE-7513');
INSERT INTO CARRO VALUES(NULL,'Palio', 'JSK-9985');
INSERT INTO CARRO VALUES(NULL,' Fox ', 'MRZ-8349');
INSERT INTO CARRO VALUES(NULL,' Siena ', 'GTV-9456');
INSERT INTO CARRO VALUES(NULL,'Celta', 'JMW-6502');
INSERT INTO CARRO VALUES(NULL,'HB20 ', 'CJH-7730');
INSERT INTO CARRO VALUES(NULL,' Voyage', 'HEH-7396');
INSERT INTO CARRO VALUES(NULL,'Corsa Sedan ', 'NEG-6127');
INSERT INTO CARRO VALUES(NULL,'Onix ', 'ICV-7163');

DELIMITER $
STATUS

CREATE PROCEDURE CARRO (P_MODELO VARCHAR(40),
											  P_PLACA VARCHAR(30))
				
BEGIN 
 
			INSERT INTO CARRO VALUES(NULL, P_MODELO, P_PLACA);
END 
$

DELIMITER ;

STATUS 

CALL CARRO('HB20', 'HOY-5412');

SELECT IDCARRO, MODELO, PLACA FROM CARRO;

/* TABELA DE BACKUP */

CREATE TABLE BACKUP_CARRO(
	IDBACKUP INT PRIMARY KEY AUTO_INCREMENT,
	IDCARRO INT,
  MODELO VARCHAR(40) NOT NULL,
  PLACA VARCHAR(30) NOT NULL UNIQUE

);


/* TRIGGER */

DELIMITE $
STATUS 

CREATE TRIGGER BACKUP_CARRO 
AFTER INSERT ON CARRO 
FOR EACH ROW 

BEGIN

      INSERT INTO BACKUP_CARRO VALUES(NULL,NEW.IDCARRO, NEW.MODELO, NEW.PLACA);
END
$

DELIMITER ;


/* TESTANDO A TRIGGER */

SELECT IDCARRO, MODELO, PLACA FROM CARRO;

+---------+--------------+----------+
| IDCARRO | MODELO       | PLACA    |
+---------+--------------+----------+
|       1 |  Gol         | HTM-20   |
|       2 |  Uno         | JGE-7513 |
|       3 | Palio        | JSK-9985 |
|       4 |  Fox         | MRZ-8349 |
|       5 |  Siena       | GTV-9456 |
|       6 | Celta        | JMW-6502 |
|       7 | HB20         | CJH-7730 |
|       8 |  Voyage      | HEH-7396 |
|       9 | Corsa Sedan  | NEG-6127 |
|      10 | Onix         | ICV-7163 |
|      11 | Onix         | HAP-2254 |
+---------+--------------+----------+

INSERT INTO CARRO VALUES(NULL, 'Onix','HAP-2254');

SELECT IDBACKUP, IDCARRO, MODELO, PLACA FROM BACKUP_CARRO;


+----------+---------+--------+----------+
| IDBACKUP | IDCARRO | MODELO | PLACA    |
+----------+---------+--------+----------+
|        1 |      11 | Onix   | HAP-2254 |
+----------+---------+--------+----------+


/* TRIGGER UPDATE */


CREATE TABLE BACKUP_CARRO_UPDATE(
	IDBACKUP INT PRIMARY KEY AUTO_INCREMENT,
	IDCARRO INT,
  MODELO VARCHAR(40) NOT NULL,
  PLACA VARCHAR(30) NOT NULL UNIQUE

);

DELIMITER $
STATUS

CREATE TRIGGER BACKUP_CARRO_UPDATE
BEFORE UPDATE ON CARRO 
FOR EACH ROW 

BEGIN 
				INSERT INTO BACKUP_CARRO_UPDATE VALUES(NULL, OLD.IDCARRO,
																										 OLD.MODELO, 
																										 OLD.PLACA);

END
$

DELIMITER ;

SELECT IDCARRO, MODELO, PLACA FROM CARRO
WHERE IDCARRO = '10';

+---------+--------+----------+
| IDCARRO | MODELO | PLACA    |
+---------+--------+----------+
|      10 | Onix   | ICV-7163 |
+---------+--------+----------+

UPDATE CARRO 
SET PLACA ='GYE-7565'
WHERE IDCARRO = 10;

+---------+--------+----------+
| IDCARRO | MODELO | PLACA    |
+---------+--------+----------+
|      10 | Onix   | GYE-7565 |
+---------+--------+----------+

SELECT IDBACKUP, IDCARRO, MODELO, PLACA FROM BACKUP_CARRO_UPDATE;
+----------+---------+--------+----------+
| IDBACKUP | IDCARRO | MODELO | PLACA    |
+----------+---------+--------+----------+
|        1 |      10 | Onix   | ICV-7163 |
+----------+---------+--------+----------+


