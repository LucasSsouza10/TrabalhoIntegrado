-- Function: consultar_acoes(character varying)

-- DROP FUNCTION consultar_acoes(character varying, smallint, smallint);

CREATE OR REPLACE FUNCTION consultar_acoes(cpf_aux varchar, anoI integer, anoF integer)
  RETURNS TABLE(numero_do_processo character varying, ident_autor character varying, situacao character varying, data date, valor numeric) AS
$BODY$
	BEGIN
		RETURN QUERY EXECUTE '
		SELECT a.numero_do_processo, a.ident_autor, a.situacao_do_processo, a.data,  a.valor_acao FROM acoes_judiciais a
		WHERE cpf_do_reu = $1
		AND extract(YEAR FROM a.data)BETWEEN $2 AND $3'
		USING cpf_aux, anoI, anoF;
	END;
$BODY$
  LANGUAGE plpgsql;

-- DROP FUNCTION consultar_dividas(character varying, smallint, smallint);

CREATE OR REPLACE FUNCTION consultar_dividas(cpf_aux varchar, anoI integer, anoF integer)
  RETURNS TABLE(contrato character varying, cnpj character varying, data date, valor numeric) AS
$BODY$
	BEGIN
		RETURN QUERY EXECUTE '
		SELECT d.num_contrato, d.cnpj, d.data, d.valor_da_divida FROM divida d
		WHERE cpf = $1
		AND extract(YEAR FROM d.data) BETWEEN $2 AND $3'
		USING cpf_aux, anoI, anoF;
	END;
$BODY$
  LANGUAGE plpgsql;


--Funcao para busca avancada dos estados
CREATE OR REPLACE FUNCTION consultar_uf(d1 varchar)
RETURNS table(nome varchar, capital varchar, regiao varchar) AS $$
	BEGIN
		RETURN QUERY EXECUTE'
		SELECT u.nome, u.capital, u.regiao FROM UFs as u WHERE nome_uf = $1'
		USING d1;
	END;
$$ language 'plpgsql';

