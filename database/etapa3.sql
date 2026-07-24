/*
	Responsável: Francisco Chagas Soares Neto
	Nome do sistema: JESTer
	Versão: 1.0
*/

-- Criação da base de dados:

DROP DATABASE IF EXISTS JESTer;

CREATE DATABASE JESTer;

USE JESTer;

-- Criação das tabelas contidas no diagrama ER:

CREATE TABLE categoria (
	id_categoria INT NOT NULL AUTO_INCREMENT,
	nome		 VARCHAR(100) NOT NULL,
	descricao	 VARCHAR(255),
	status		 VARCHAR(10) NOT NULL DEFAULT 'ATIVO',
	
	PRIMARY KEY (id_categoria) 
);

CREATE TABLE fornecedor (
	id_fornecedor INT NOT NULL AUTO_INCREMENT,
	nome		  VARCHAR(150) NOT NULL,
	cnpj		  VARCHAR(18) NOT NULL UNIQUE,
	telefone	  VARCHAR(20) NOT NULL,
	email		  VARCHAR(150) NOT NULL UNIQUE,
	status		  VARCHAR(10) NOT NULL DEFAULT 'ATIVO',
	
	PRIMARY KEY (id_fornecedor)
);

CREATE TABLE produto (
	id_produto	   INT NOT NULL AUTO_INCREMENT,
	nome		   VARCHAR(150) NOT NULL,
	descricao	   VARCHAR(255),
	codigo_barras  VARCHAR(20) UNIQUE,
	preco_compra   DECIMAL(10,2) NOT NULL,
	preco_venda	   DECIMAL(10,2) NOT NULL,
	estoque_atual  INT  NOT NULL,
	estoque_minimo INT NOT NULL,
	status		   VARCHAR(10) NOT NULL DEFAULT 'ATIVO',
	id_categoria   INT NOT NULL,
	id_fornecedor  INT NOT NULL,
	
	PRIMARY KEY (id_produto),
	
	CONSTRAINT fk_produto_categoria
		FOREIGN KEY (id_categoria)
		REFERENCES categoria(id_categoria),
		
	CONSTRAINT fk_produto_fornecedor
		FOREIGN KEY (id_fornecedor)
		REFERENCES fornecedor(id_fornecedor)
);


CREATE TABLE usuario (
	id_usuario INT NOT NULL AUTO_INCREMENT,
	nome	   VARCHAR(100) NOT NULL,
	email	   VARCHAR(150) NOT NULL UNIQUE,
	senha	   VARCHAR(255) NOT NULL,
	perfil	   VARCHAR(20) NOT NULL,
	status	   VARCHAR(10) NOT NULL DEFAULT 'ATIVO',
	
	PRIMARY KEY (id_usuario)
);

CREATE TABLE tipo_movimentacao (
	id_tipo_movimentacao INT NOT NULL AUTO_INCREMENT,
	operacao			 VARCHAR(20) NOT NULL UNIQUE,
	descricao			 VARCHAR(255),
	
	PRIMARY KEY (id_tipo_movimentacao)
);

CREATE TABLE movimentacao (
	id_movimentacao		 INT NOT NULL AUTO_INCREMENT,
	id_produto			 INT NOT NULL,
	id_usuario			 INT NOT NULL,
	id_tipo_movimentacao INT NOT NULL,
	quantidade			 INT NOT NULL,
	data_movimentacao 	 DATETIME NOT NULL,
	observacao			 VARCHAR(255),
	
	PRIMARY KEY (id_movimentacao),
	
	CONSTRAINT fk_movimentacao_produto
		FOREIGN KEY (id_produto)
		REFERENCES produto(id_produto),
		
	CONSTRAINT fk_movimentacao_usuario
		FOREIGN KEY (id_usuario)
		REFERENCES usuario(id_usuario),
		
	CONSTRAINT fk_movimentacao_tipo_movimentacao
		FOREIGN KEY (id_tipo_movimentacao)
		REFERENCES tipo_movimentacao(id_tipo_movimentacao)
);

-- Inserção de dados nas tabelas:

INSERT INTO categoria (
	nome,
	descricao
)
VALUES
	('Vestuário',   'Roupas, calçados e acessórios.'),
	('Eletrônicos', 'Dispositivos tecnológicos.'),
	('Cosméticos',  'Produtos de beleza e higiene pessoal.'),
	('Alimentos',   'Itens comestíveis e bebidas.'),
	('Mobiliário',  'Móveis e peças decorativas.');

INSERT INTO fornecedor (
	nome,
	cnpj,
	telefone,
	email
)
VALUES
	('Alura Fashion Ltda.',				 '12.345.678/0001-90', '(11) 98765-4321', 'contato@alurafashion.com.br'),
	('TechVolt Componentes Eletrônicos', '98.765.432/0001-10', '(21) 93456-7890',  'vendas@techvolt.com.br'),
	('BellaPele Cosméticos e Estética',  '45.678.912/0001-34', '(31) 99887-6655', 'atendimento@bellapele.com'),
	('NutriVita Alimentos Saudáveis', 	 '23.456.789/0001-56', '(51) 3211-4455',  'comercial@nutrivita.com.br'),
	('Design & Conforto Móveis', 		 '34.567.890/0001-78', '(41) 99122-3344', 'projetos@designconforto.com');

INSERT INTO produto (
	nome,
	descricao,
	codigo_barras,
	preco_compra,
	preco_venda,
	estoque_atual,
	estoque_minimo,
	id_categoria,
	id_fornecedor
)
VALUES
	('Camiseta Algodão Premium',            'Camiseta 100% algodão egípcio.',                                                '7891234567890', 25.00,  69.90,  150, 30, 1, 1),
	('Carregador Rápido USB-C 20W',         'Carregador de parede ultra rápido de 20W com saída USB-C.',                     '7899876543210', 18.50,  49.90,  85,  15, 2, 2),
	('Sérum Facial Hidratante 30ml',        'Sérum com ácido hialurônico e vitamina C.',                                     '7894561230001', 32.00,  89.90,  40,  10, 3, 3),
	('Granola Artesanal Passas e Mel 500g', 'Mix de cereais integrais tostados com mel silvestre, castanhas e uvas passas.', '7897894561234', 8.20,   19.90,  200, 50, 4, 4),
	('Cadeira de Escritório Ergonômica',    'Cadeira com regulagem de altura, braços ajustáveis e suporte lombar.',          '7893216549876', 240.00, 549.90, 12,  3,  5, 5);

INSERT INTO usuario (
	nome,
	email,
	senha,
	perfil
)
VALUES
	('Carlos Silva',    'carlos.silva@empresa.com',    '$2a$12$R9h/cIPz0gi.UR3f3r5uHeYg.gG3bcC7m/Nl5aR1i8E4q5O3S2bXa', 'ADMINISTRADOR'),
	('Ana Souza',       'ana.souza@empresa.com',       '$2a$12$K3f8jD1s9aR4fG6hH8jK2uO3mN5bV7cX9zP1qW2eR3tY4uI5o6pOi', 'GERENTE'),
	('Marcos Oliveira', 'marcos.oliveira@empresa.com', '$2a$12$X9zP1qW2eR3tY4uI5o6pOiK3f8jD1s9aR4fG6hH8jK2uO3mN5bV7c', 'ESTOQUISTA'),
	('Juliana Costa',   'juliana.costa@empresa.com',   '$2a$12$mN5bV7cX9zP1qW2eR3tY4uI5o6pOiK3f8jD1s9aR4fG6hH8jK2uO3', 'ESTOQUISTA'),
	('Ricardo Santos',  'ricardo.santos@empresa.com',  '$2a$12$uI5o6pOiK3f8jD1s9aR4fG6hH8jK2uO3mN5bV7cX9zP1qW2eR3tY4', 'ESTOQUISTA');

INSERT INTO tipo_movimentacao (
	operacao,
	descricao
)
VALUES
	('ENTRADA',	   'Registro da entrada de produtos no estoque.'),
	('SAÍDA',      'Registro da saída de produtos do estoque.'),
	('AJUSTE',     'Correção da quantidade em estoque para refletir a contagem física.'),
	('DANIFICADO', 'Baixa de produtos que sofreram danos.'),
	('VENCIDO',	   'Retirada de produtos que ultrapassaram a data de validade.');

INSERT INTO movimentacao (
	id_produto,
	id_usuario,
	id_tipo_movimentacao,
	quantidade,
	data_movimentacao,
	observacao
)
VALUES
	(1, 4, 1, 10, '2026-07-04 15:20:04', 'Reabastecimento de 10 produtos para o estoque.'),
	(2, 2, 2, 5,  '2026-06-28 09:14:52', 'Retirada de 5 produtos para a loja filial.'),
	(3, 5, 3, 42, '2026-05-17 21:37:08', 'Ajuste de contagem de produtos no estoque.'),
	(4, 1, 5, 30, '2026-03-11 16:45:29', 'Retirada de 30 produtos fora do prazo de validade'),
	(5, 3, 4, 2,  '2026-01-08 07:22:41', 'Retirada de 2 produtos danificados do estoque.');

-- Exibição dos dados contidos nas tabelas:

SELECT * FROM categoria;

SELECT
	id_categoria,
	nome,
	status
FROM categoria
WHERE nome IN ('Vestuário', 'Cosméticos');

-- 
SELECT * FROM fornecedor;

SELECT
	id_fornecedor,
	nome,
	telefone
FROM fornecedor
WHERE id_fornecedor = 4;

-- 
SELECT * FROM produto;

SELECT
	id_produto,
	p.nome AS nome_produto,
	codigo_barras,
	estoque_atual,
	c.nome AS categoria,
	f.nome AS fornecedor
FROM produto AS p
INNER JOIN categoria AS c
	ON c.id_categoria = p.id_categoria
INNER JOIN fornecedor AS f
	ON f.id_fornecedor = p.id_fornecedor
WHERE p.estoque_atual >= 85
ORDER BY p.estoque_atual ASC;

-- 
SELECT * FROM usuario;

SELECT
	id_usuario,
	nome,
	perfil,
	status
FROM usuario
WHERE perfil = 'ESTOQUISTA' AND status = 'ATIVO'
ORDER BY nome;

-- 
SELECT * FROM tipo_movimentacao;

SELECT
	id_tipo_movimentacao,
	operacao
FROM tipo_movimentacao
WHERE operacao IN ('SAÍDA', 'DANIFICADO', 'VENCIDO')
ORDER BY id_tipo_movimentacao;

-- 
SELECT * FROM movimentacao;

SELECT
	m.id_movimentacao,
	p.id_produto,
	p.nome AS nome_produto,
	tm.operacao,
	m.quantidade,
	u.id_usuario,
	u.nome AS nome_usuario,
	m.data_movimentacao
FROM movimentacao AS m
INNER JOIN produto AS p
	ON p.id_produto = m.id_produto
INNER JOIN tipo_movimentacao AS tm
	ON m.id_tipo_movimentacao = tm.id_tipo_movimentacao
INNER JOIN usuario AS u
	ON u.id_usuario = m.id_usuario
WHERE m.data_movimentacao > '2026-05-01 00:00:00';

-- Edição dos dados contidos nas tabelas:

UPDATE categoria
SET descricao = 'Dispositivos eletrônicos tecnológicos.'
WHERE id_categoria = 2;

UPDATE fornecedor
SET telefone = '(51) 93211-4455'
WHERE id_fornecedor = 4;

UPDATE produto AS p
INNER JOIN movimentacao AS m
	ON m.id_produto = p.id_produto 
INNER JOIN tipo_movimentacao AS tm
	ON m.id_tipo_movimentacao = tm.id_tipo_movimentacao
SET p.estoque_atual = CASE
	WHEN tm.operacao IN ('SAÍDA', 'DANIFICADO', 'VENCIDO')
		THEN p.estoque_atual - m.quantidade
	WHEN tm.operacao = 'ENTRADA'
		THEN p.estoque_atual + m.quantidade
	WHEN tm.operacao = 'AJUSTE'
		THEN m.quantidade
	ELSE p.estoque_atual
END
WHERE m.id_movimentacao = 3;

UPDATE usuario
SET status = 'INATIVO'
WHERE id_usuario = 5;

UPDATE tipo_movimentacao
SET descricao = 'Retirada de produtos que sofreram danos.'
WHERE id_tipo_movimentacao = 4;

UPDATE movimentacao
SET data_movimentacao = '2026-05-17 12:37:08'
WHERE id_movimentacao = 3;

-- Exclusão dos dados contidos nas tabelas:

DELETE FROM movimentacao
WHERE id_movimentacao = 5;

DELETE FROM tipo_movimentacao
WHERE id_tipo_movimentacao = 4;

DELETE FROM usuario
WHERE id_usuario = 3;

DELETE FROM produto
WHERE id_produto = 5;

DELETE FROM fornecedor
WHERE id_fornecedor = 5;

DELETE FROM categoria
WHERE id_categoria = 5;
