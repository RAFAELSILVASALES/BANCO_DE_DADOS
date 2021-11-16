USE PROJETO;

CREATE TABLE ALUNO(
  IDALUNO INT PRIMARY KEY AUTO_INCREMENT,
  NOME VARCHAR(20) NOT NULL,
  SEXO ENUM('F', 'M') NOT NULL,
  IDADE CHAR(3) NOT NULL

);

DELIMITER $

STATUS
-- COLOQUE OS PARÂMETROS E LOGO EM SEGUIDA O TIPO DE DADO
CREATE PROCEDURE ALUNO(P_NOME VARCHAR(20), 
                       P_SEXO ENUM('F', 'M'),
                       P_IDADE CHAR(3))

BEGIN 

        INSERT INTO ALUNO VALUES(NULL, P_NOME, P_SEXO, P_IDADE);
END 
$

DELIMITER ;

CALL ALUNO('RAFAEL', 'M', '22');


SELECT IDALUNO, NOME, SEXO, IDADE FROM ALUNO;
+---------+--------+------+-------+
| IDALUNO | NOME   | SEXO | IDADE |
+---------+--------+------+-------+
|       1 | RAFAEL | M    | 22    |
+---------+--------+------+-------+


