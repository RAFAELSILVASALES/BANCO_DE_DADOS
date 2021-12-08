CREATE DATABASE CURSO;

USE CURSO;

/* tabela que faz auto relacionamento  com ela mesmo. */

CREATE TABLE CURSO_TI(
  IDCURSO INT PRIMARY KEY AUTO_INCREMENT,
  NOME VARCHAR(30) NOT NULL,
  HORAS INT NOT NULL,
  VALOR FLOAT(10,2) NOT NULL,
  ID_PREREQ INT 
);

ALTER TABLE CURSO_TI ADD CONSTRAINT FK_PREREQ 
FOREIGN KEY (ID_PREREQ) REFERENCES CURSO_TI (IDCURSO);


INSERT INTO CURSO_TI VALUES(NULL, 'BD RELACIONAL',20,400.00, NULL);
INSERT INTO CURSO_TI VALUES(NULL, 'BUSINESS INTELLIGENCE',40,800.00,1);
INSERT INTO CURSO_TI VALUES(NULL, 'RELATORIOS AVANCADOS',20,600.00,2);
INSERT INTO CURSO_TI VALUES(NULL, 'LOGICA PROGRAM', 20,400.00,NULL );
INSERT INTO CURSO_TI VALUES(NULL, 'RUBY', 30, 500.00,4);

/*tabela que faz auto relacionamento  com ela mesmo.
   Vai usar a técnica de ponteramento*/
SELECT C.NOME, 
       C.HORAS, 
       C.VALOR, 
       P.NOME FROM CURSO_TI C
       INNER JOIN CURSO_TI P
       ON P.IDCURSO = C.ID_PREREQ;


+-----------------------+-------+--------+-----------------------+
| NOME                  | HORAS | VALOR  | NOME                  |
+-----------------------+-------+--------+-----------------------+
| BD RELACIONAL         |    20 | 400.00 | BUSINESS INTELLIGENCE |
| BUSINESS INTELLIGENCE |    40 | 800.00 | RELATORIOS AVANCADOS  |
| LOGICA PROGRAM        |    20 | 400.00 | RUBY                  |
+-----------------------+-------+--------+-----------------------+

SELECT C.NOME AS "CURSO",
       C.HORAS AS "HORAS",
       C.VALOR  AS "VALOR DO CURSO",
      IFNULL(P.NOME, "-------") AS "PREREQ"
      FROM CURSO_TI C LEFT JOIN CURSO_TI  P
      ON P.IDCURSO = C.ID_PREREQ;

+-----------------------+-------+----------------+-----------------------+
| CURSO                 | HORAS | VALOR DO CURSO | PREREQ                |
+-----------------------+-------+----------------+-----------------------+
| BD RELACIONAL         |    20 |         400.00 | -------               |
| BUSINESS INTELLIGENCE |    40 |         800.00 | BD RELACIONAL         |
| RELATORIOS AVANCADOS  |    20 |         600.00 | BUSINESS INTELLIGENCE |
| LOGICA PROGRAM        |    20 |         400.00 | -------               |
| RUBY                  |    30 |         500.00 | LOGICA PROGRAM        |
+-----------------------+-------+----------------+-----------------------+