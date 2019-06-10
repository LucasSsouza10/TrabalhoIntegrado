ALTER TABLE UFs ADD COLUMN nome varchar; 
ALTER TABLE UFs ADD COLUMN capital varchar;
ALTER TABLE UFs ADD COLUMN regiao varchar;

select * from ufs

UPDATE UFs SET nome = 'Amazonas', capital = 'Manaus', regiao = 'Norte' WHERE nome_uf = 'AM';
UPDATE UFs SET nome = 'Roraima', capital = 'Boa Vista', regiao = 'Norte' WHERE nome_uf = 'RR';
UPDATE UFs SET nome = 'Amapá', capital = 'Macapá', regiao = 'Norte' WHERE nome_uf = 'AP';
UPDATE UFs SET nome = 'Pará', capital = 'Belém', regiao = 'Norte' WHERE nome_uf = 'PA';
UPDATE UFs SET nome = 'Tocantins', capital = 'Palmas', regiao = 'Norte' WHERE nome_uf = 'TO';
UPDATE UFs SET nome = 'Rondônia', capital = 'Porto Velho', regiao = 'Norte' WHERE nome_uf = 'RO';
UPDATE UFs SET nome = 'Acre', capital = 'Rio Branco', regiao = 'Norte' WHERE nome_uf = 'AC';
UPDATE UFs SET nome = 'Maranhão', capital = 'São Luís', regiao = 'Nordeste' WHERE nome_uf = 'MA';
UPDATE UFs SET nome = 'Piauí', capital = 'Teresina', regiao = 'Nordeste' WHERE nome_uf = 'PI';
UPDATE UFs SET nome = 'Ceará', capital = 'Fortaleza', regiao = 'Nordeste' WHERE nome_uf = 'CE';
UPDATE UFs SET nome = 'Rio Grande do Norte', capital = 'Natal', regiao = 'Nordeste' WHERE nome_uf = 'RN';
UPDATE UFs SET nome = 'Pernambuco', capital = 'Recife', regiao = 'Nordeste' WHERE nome_uf = 'PE';
UPDATE UFs SET nome = 'Paraíba', capital = 'João Pessoa', regiao = 'Nordeste' WHERE nome_uf = 'PB';
UPDATE UFs SET nome = 'Sergipe', capital = 'Aracaju', regiao = 'Nordeste' WHERE nome_uf = 'SE';
UPDATE UFs SET nome = 'Alagoas', capital = 'Maceió', regiao = 'Nordeste' WHERE nome_uf = 'AL';
UPDATE UFs SET nome = 'Bahia', capital = 'Salvador', regiao = 'Nordeste' WHERE nome_uf = 'BA';
UPDATE UFs SET nome = 'Mato Grosso', capital = 'Cuiabá', regiao = 'Centro-Oeste' WHERE nome_uf = 'MT';
UPDATE UFs SET nome = 'Mato Grosso do Sul', capital = 'Campo Grande', regiao = 'Centro-Oeste' WHERE nome_uf = 'MS';
UPDATE UFs SET nome = 'Goiás', capital = 'Goiânia', regiao = 'Centro-Oeste' WHERE nome_uf = 'GO';
UPDATE UFs SET nome = 'Distrito Federal', capital = 'Brasília', regiao = 'Centro-Oeste' WHERE nome_uf = 'DF';
UPDATE UFs SET nome = 'São Paulo', capital = 'São Paulo', regiao = 'Sudeste' WHERE nome_uf = 'SP';
UPDATE UFs SET nome = 'Espírito Santo', capital = 'Vitória', regiao = 'Sudeste' WHERE nome_uf = 'ES';
UPDATE UFs SET nome = 'Minas Gerais', capital = 'Belo Horizonte', regiao = 'Sudeste' WHERE nome_uf = 'MG';
UPDATE UFs SET nome = 'Rio de Janeiro', capital = 'Rio de Janeiro', regiao = 'Sudeste' WHERE nome_uf = 'RJ';
UPDATE UFs SET nome = 'Paraná', capital = 'Curitiba', regiao = 'Sul' WHERE nome_uf = 'PR';
UPDATE UFs SET nome = 'Rio Grande do Sul', capital = 'Porto Alegre', regiao = 'Sul' WHERE nome_uf = 'RS';
UPDATE UFs SET nome = 'Santa Catarina', capital = 'Florianópolis', regiao = 'Sul' WHERE nome_uf = 'SC';


