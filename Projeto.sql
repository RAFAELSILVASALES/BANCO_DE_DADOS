CREATE DATABASE PROJETO;
USE PROJETO;

CREATE TABLE USUARIO(
  IDUSUARIO INT PRIMARY KEY AUTO_INCREMENT,
  NOME VARCHAR(30) NOT NULL,
  EMAIL VARCHAR(50) NOT NULL,
  SENHA VARCHAR(8) NOT NULL

);

INSERT INTO USUARIO VALUES(NULL,'Rafael da Silva Sales', 'rafaelssss35445@bol', 'rubi345#');

/* PROCEDURE */
 DEMILITER $ 

 STATUS 

 CREATE PROCEDURE DADOS_USUARIO(P_NOME VARCHAR(30), 
                                P_EMAIL VARCHAR(50), 
                                P_SENHA VARCHAR(8))
BEGIN 
    INSERT INTO USUARIO VALUES(NULL, P_NOME, P_EMAIL, P_SENHA);

END 
$
DELIMITER ;

CALL DADOS_USUARIO('Letícia da Silva', 'leticia345@gmail.com','senha343');
CALL DADOS_USUARIO('Maria da Silva', 'maria83646@gmail.com', '12345678');

+-----------+-----------------------+----------------------+----------+
| IDUSUARIO | NOME                  | EMAIL                | SENHA    |
+-----------+-----------------------+----------------------+----------+
|         1 | Rafael da Silva Sales | rafaelssss35445@bol  | rubi345# |
|         2 | Letícia da Silva      | leticia345@gmail.com | senha343 |
|         3 | Maria da Silva        | maria83646@gmail.com | 12345678 |
+-----------+-----------------------+----------------------+----------+
