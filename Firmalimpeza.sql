CREATE DATABASE db_FirmaLimpeza;

USE db_FirmaLimpeza

CREATE TABLE tbl_Produto (
	cod_pro INT,
	nome VARCHAR (40),
	categoria VARCHAR (20),
	preco VARCHAR (10)
	PRIMARY KEY (cod_pro)
);

INSERT INTO tbl_Produto (cod_pro,nome,categoria,preco) VALUES
		(40, 'Azul de anjo ', 'Sabao', 9.50),
		(52, 'Limpa Diabo', 'Desinfetante', 14.50),
		(21, 'Esfrega-cao', 'Esponja', 6.20);

SELECT * FROM tbl_Produto;

CREATE TABLE tbl_Cliente (
	cod_cli INT,
	statos VARCHAR (10),
	nome VARCHAR (20),
	endereco VARCHAR (40),
	telefone VARCHAR (20),
	Limt_cred INT,
	PRIMARY KEY (cod_cli)
);
 
 INSERT INTO tbl_Cliente(cod_cli, statos, nome, endereco, telefone,Limt_cred) VALUES
	(1 , 'Bom' , 'Guilherme Bombado' , 'Beco do Esteroide', 11-03064-4018, 3064  ),
	(2 , 'Ruim' , 'Holocasto da silva', 'Beco do mal Lula', 11-01945-1313, 1945 ),
	(3 , 'Medio' , 'Batman Haymunndi ', 'Beco do bem Bolsonaro', 11-02222-1414, 2222 );

 SELECT * FROM tbl_Cliente

 CREATE TABLE tbl_pedido (
	numero INT,
	data_elaboracao DATE,
	quantidade INT,
	cod_pro INT,
	cod_cli INT,
	PRIMARY KEY (numero),
	FOREIGN KEY (cod_pro) REFERENCES tbl_Produto (cod_pro),
	FOREIGN KEY (cod_cli) REFERENCES tbl_Cliente (cod_cli)
);
 
 INSERT INTO tbl_pedido(numero,data_elaboracao,quantidade,cod_pro,cod_cli) VALUES
	(123 , '15-02-27' , 4011,40 , 1),
	(231 , '18-01-27' , 5292 ,52, 2),
	(321 , '26-07-27' , 2131 ,21, 3);

 SELECT * FROM tbl_pedido

 CREATE TABLE tbl_endereco (
    cod_endereco INT,
	rua VARCHAR(100),
	bairro VARCHAR(100),
	cidade VARCHAR(100),
	cep VARCHAR(100),
	logadrouro VARCHAR(100),
	cod_cli INT,
	PRIMARY KEY (cod_endereco,cod_cli),
	FOREIGN KEY (cod_cli) REFERENCES tbl_Cliente (cod_cli)
);
 
 INSERT INTO tbl_endereco(cod_endereco,cod_cli,rua,bairro,cidade,cep,logadrouro) VALUES
	(4012,1 , 'Rua da Tristeza 873' ,'Tristeza', 'São Paulo', '4010-040' ,'Rua'),
	(3245,2 , 'Rua da Felicidade 271' ,'Felicidade','São Paulo', '5292-052','Rua'),
	(2145,3 , 'Rua da Tristeza 097' , 'Tristeza','São Paulo', '2131-021', 'Rua');

 SELECT * FROM tbl_endereco
 
 
 CREATE TABLE tbl_telefone (
    cod_telefone INT,
	cod_cli INT,
	numero VARCHAR(20),
	tipo VARCHAR(20),
	PRIMARY KEY (cod_telefone,cod_cli),
	FOREIGN KEY (cod_cli) REFERENCES tbl_Cliente (cod_cli)
);
 
 INSERT INTO tbl_telefone(cod_telefone,cod_cli,numero,tipo) VALUES
	(20,1 , '11-98765-3064' ,'Residencial'),
	(30,2 , '11-92361-4081' ,'Celular'),
	(40,3 , '11-96642-4552' , 'Celular');

 SELECT * FROM tbl_telefone