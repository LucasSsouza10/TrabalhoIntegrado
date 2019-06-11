CREATE OR REPLACE FUNCTION consultar_estados(d1 date, d2 date)
RETURNS table(nome_UF varchar(2), soma_div numeric, qtd_devedores bigint, qtd_div bigint, soma_acoes numeric, qtd_acoes bigint) AS $$
	BEGIN
		RETURN QUERY EXECUTE'
		SELECT estados.nome_UF as nome_UF, sum_div as soma_div, qnt_devedores as qtd_devedores, coalesce(qnt_div, 0) as qtd_div, coalesce(sum_acoes, 0) as soma_acoes, coalesce(qnt_acoes, 0) as qtd_acoes
		FROM UFs as estados
		LEFT JOIN
			(SELECT UF, sum(valor_da_divida) as sum_div, count(distinct p.cpf) as qnt_devedores, count(d.num_contrato) as qnt_div
			FROM divida d INNER JOIN pessoa_fisica p ON d.cpf = p.cpf
			WHERE data BETWEEN $1 and $2			GROUP BY UF) as dis
		ON estados.nome_UF = dis.UF
		FULL OUTER JOIN
			(SELECT UF, sum(valor_acao) as sum_acoes, count(numero_do_processo) as qnt_acoes
			FROM acoes_judiciais a INNER JOIN pessoa_fisica p ON a.cpf_do_reu = p.cpf
			WHERE data BETWEEN $1 AND $2
			GROUP BY UF ) as acs
		ON estados.nome_UF = acs.UF
		ORDER BY estados.nome_UF'
		USING d1, d2;
	END;
$$ language 'plpgsql';


CREATE OR REPLACE FUNCTION consultar_pessoas(trecho varchar, d1 double precision, d2 double precision)
RETURNS table(cpf varchar(11), nome varchar(50), data_do_nascimento date, estado_civil varchar(15), qtd_dividas bigint, qtd_processo bigint) AS $$
	BEGIN 
		RETURN QUERY EXECUTE'
		SELECT p.cpf as cpf, p.nome, p.data_do_nascimento, p.estado_civil, coalesce(qnt_dividas, 0) as qtd_dividas, coalesce(qnt_processo, 0) as qtd_processos
		FROM pessoa_fisica p 
		LEFT JOIN 
			(SELECT cpf_do_reu, COUNT(numero_do_processo) as qnt_processo
			FROM acoes_judiciais
			WHERE extract(year from data) >= $2 AND extract(year from data) <= $3
			GROUP BY cpf_do_reu) as a 
		ON p.cpf = a.cpf_do_reu
		LEFT JOIN
			(SELECT div.cpf, COUNT(num_contrato) as qnt_dividas
			 FROM divida div
			 WHERE extract(year from data) >= $2 AND extract(year from data) <= $3
			 GROUP BY div.cpf) as d 
		ON p.cpf = d.cpf
		WHERE p.nome LIKE $1
		ORDER BY p.nome'
		USING trecho, d1, d2;
	END;
$$ language 'plpgsql';

SELECT nome_UF, soma_div, qtd_devedores, qtd_div, soma_acoes, qtd_acoes FROM consultar_estados('1938-01-01', '2019-01-01');

SELECT cpf, nome, data_do_nascimento, estado_civil, qtd_dividas, qtd_processo FROM consultar_pessoas('%ANA%', 1938, 2019);
