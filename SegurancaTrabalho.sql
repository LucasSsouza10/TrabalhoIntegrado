SELECT current_user;

CREATE ROLE funcionario WITH NOINHERIT LOGIN PASSWORD '123456';
GRANT SELECT ON pessoa_fisica, divida, acoes_judiciais, ufs TO funcionario; 

SET ROLE funcionario;
SET ROLE postgres;

DROP table divida;