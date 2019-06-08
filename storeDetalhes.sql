-- Function: consultar_acoes(character varying)

-- DROP FUNCTION consultar_acoes(character varying);

CREATE OR REPLACE FUNCTION consultar_acoes(IN cpf_aux character varying)
  RETURNS TABLE(numero_do_processo character varying, ident_autor character varying, situacao character varying, data date, valor numeric) AS
$BODY$
	BEGIN
		RETURN QUERY 
		SELECT a.numero_do_processo, a.ident_autor, a.situacao_do_processo, a.data,  a.valor_acao FROM acoes_judiciais a
		WHERE cpf_do_reu = cpf_aux;
	END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION consultar_acoes(character varying)
  OWNER TO postgres;
-- Function: consultar_dividas(character varying)


-- DROP FUNCTION consultar_dividas(character varying);

CREATE OR REPLACE FUNCTION consultar_dividas(IN cpf_aux character varying)
  RETURNS TABLE(contrato character varying, cnpj character varying, data date, valor numeric) AS
$BODY$
	BEGIN
		RETURN QUERY 
		SELECT divida.num_contrato, divida.cnpj, divida.data, divida.valor_da_divida FROM divida
		WHERE cpf = cpf_aux;
	END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION consultar_dividas(character varying)
  OWNER TO postgres;
