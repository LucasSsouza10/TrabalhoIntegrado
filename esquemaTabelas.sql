CREATE TABLE UFs (
	nome_UF varchar(2) primary key
);

CREATE TABLE pessoa_fisica (
	cpf varchar(11) primary key,
	nome varchar(50) not null,
	data_de_nascimento date not null,
	estado_civil varchar(15) not null,
	UF varchar(2) references UFs(nome_UF) not null
);

CREATE TABLE divida (
	num_contrato varchar(15) primary key,
	cpf varchar(11) references pessoa_fisica(cpf) not null,
	cnpj varchar(14) not null,
	data date not null,
	valor_da_divida numeric not null
);

CREATE TABLE acoes_judiciais (
	numero_do_processo varchar(20) primary key,
	cpf_do_reu varchar(11) references pessoa_fisica(cpf) not null,
	ident_autor varchar(14) not null,
	situacao_do_processo varchar(15) not null check (situacao_do_processo = 'em espera' or situacao_do_processo = 'em andamento' or situacao_do_processo = 'finalizada'),
	data date not null,
	valor_acao numeric not null
);