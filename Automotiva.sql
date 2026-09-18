CREATE DATABASE db_Automotiva;

USE db_Automotiva

CREATE TABLE tbl_cliente (
	cod_cliente VARCHAR(20),
	nome VARCHAR (40) ,
	cpf_cnpj VARCHAR(20),
	email VARCHAR(50),
	endereco VARCHAR(100),
	PRIMARY KEY (cod_cliente)
);

INSERT INTO tbl_cliente(cod_cliente,nome,cpf_cnpj,email,endereco) VALUES
		(40,'José' ,'123.456.789-00', 'contato@limpezapro.com.br', 'Rua das Vassouras, 105 - Bairro Limpinho'),
		(52,'André', '987.654.321-11', 'atendimento@cleanhouse.com.br', 'Avenida dos Detergentes, 480, Apt 12 - Jardim Brilho'),
		(21,'Lotus', '456.789.012-22', 'cliente.teste@email.com', 'Rua Sabão de Pedra, 89 - Vila Fachada');

SELECT * FROM tbl_cliente;

CREATE TABLE tbl_pedido (
	cod_pedido INT,
	data_pedido DATE ,
	valor_total FLOAT,
	statos VARCHAR(20),
	PRIMARY KEY (cod_pedido)
);
 
 INSERT INTO tbl_pedido(cod_pedido, data_pedido, valor_total, statos) VALUES
	(12 , '28-09-22' , 123.45 , 'Médio'),
	(23 , '21-01-24' , 9842.12, 'Ruim' ),
	(32 , '12-05-28' , 100, 'Bom');

 SELECT * FROM tbl_pedido

 CREATE TABLE tbl_peca (
	cod_peca INT,
	descricao VARCHAR(40),
	categoria VARCHAR(20),
	marca VARCHAR(20),
	preco_venda INT,
	estoque INT,
	PRIMARY KEY (cod_peca),

);
 
 INSERT INTO tbl_peca(cod_peca,descricao,categoria,marca ,preco_venda,estoque) VALUES
	(123 , 'Carros' , 'Motor','Ejhno' ,' 1200', '50000'),
	(231 , 'Motos' , 'Motor','Ejhno' ,' 34200', '2000'),
	(321 ,'Caminhão' , 'Motor','Ejhno' ,' 5123', '25000');

 SELECT * FROM tbl_peca

 CREATE TABLE tbl_itempedido (
  cod_pedido INT,
  cod_peca INT,
  quantidade INT,
  preco_unitario INT,
  desconto_item VARCHAR(5),
  sub_total INT,
  PRIMARY KEY (cod_pedido,cod_peca),
  FOREIGN KEY (cod_pedido) REFERENCES tbl_pedido(cod_pedido),
  FOREIGN KEY (cod_peca) REFERENCES tbl_peca (cod_peca)
);
 
 INSERT INTO tbl_itempedido(cod_pedido,cod_peca,quantidade,preco_unitario,desconto_item,sub_total) VALUES
	(12,123 , 1200 ,50, '8%', 4010 ),
	(23,231 , 2420 ,40,'2%', 5292),
	(32,321 , 2084 , 30,'12%', 2131);

 SELECT * FROM tbl_itempedido
 
 
 CREATE TABLE tbl_fornecedor (
  cod_fornecedor INT,
  razao_social VARCHAR (20),
  cnpj VARCHAR (30),
  email VARCHAR(60),
  endereco  VARCHAR(100),
  PRIMARY KEY (cod_fornecedor)
);
 
 INSERT INTO tbl_fornecedor(cod_fornecedor,razao_social,cnpj,email,endereco) VALUES
	(2023,'Composição' , '12.345.678/0001-90' ,'vendas@autopeçasnacional.com.br', 'Avenida das Oficinas, 150 - Bairro Industrial'),
	(3098,'Uso Formal' , '98.765.432/0001-10' ,'comercial@distribuidoraparafusos.com.br','Rua do Pistão, 89 - Vila Motor'),
	(4032,'Proteção' , '45.678.901/0001-23' , 'contato@mecanicaglobal.com.br','Alameda dos Autopeças, 430 - Jardim Peças');

 SELECT * FROM tbl_fornecedor

  CREATE TABLE tbl_fornecedorpeca (
  cod_fornecedor INT,
  cod_peca INT,
  preco_compra float,
  prazo_entrega_dias VARCHAR(30),
  ativo  VARCHAR(20),
  PRIMARY KEY (cod_fornecedor,cod_peca),
  FOREIGN KEY (cod_fornecedor) REFERENCES tbl_fornecedor (cod_fornecedor),
  FOREIGN KEY (cod_peca) REFERENCES tbl_peca (cod_peca)
);
 
 INSERT INTO tbl_fornecedorpeca(cod_fornecedor,cod_peca,preco_compra,prazo_entrega_dias,ativo) VALUES
	(2023,123 , 5000 ,'Em 54 dias', 'Imobilizado'),
	(3098,231 , 1000 ,'Em 42 dias','Saldo em Caixa '),
	(4032,321 , 1500 , 'em 23 dias','Estoque');

 SELECT * FROM tbl_fornecedorpeca