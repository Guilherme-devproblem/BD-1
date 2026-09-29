CREATE DATABASE db_katchau;

USE db_katchau;

CREATE TABLE tb_carros (
			placa VARCHAR (7),
			marca VARCHAR (15),
			modelo VARCHAR (15),
			ano INT,
			combustivel VARCHAR (1)
			PRIMARY KEY (placa)
);

INSERT INTO tb_carros (placa,marca,modelo,ano,combustivel) VALUES
		('ABC1234','Ford','Corcell II',1982,'G'),
		('JKG5678','Ford','Focus',2001,'A'),
		('LKO8954','Renault','Clio',2007,'F'),
		('MMS1609','WolkWagen','Fusca',1973,'F'),
		('ASD123','Honda','Civic',2010,'F'),
		('gtr4596','GM','Corsa',2004,'A');

CREATE TABLE tb_vendedores (
			cod INT,
			nome VARCHAR (40),
			carro VARCHAR (7),
			cidade VARCHAR (30),
			estado VARCHAR (2),
			comissao DECIMAL (4, 2),
			PRIMARY KEY (cod),
			FOREIGN KEY (carro) REFERENCES tb_carros (placa)
);

INSERT INTO tb_vendedores (cod,nome,carro,cidade,estado,comissao) VALUES
		(1,'Juca da Silva','ABC1234','Pelotas','RS',3.50),
		(3,'Antonio Vieira','JKG5678','Dois Vizinhos','PR',5.00),
		(44,'Julieta da Silva',NULL,'Verê','PR',2.50),
		(6 ,'Maria Francisca','LKO8954','Dois Vizinhos','PR',2.00),
		(45,'Marieta da Silva',NULL,'Verê','PR',2.80),
		(9,'juca silva',NULL,'PELOTAS','RS',3.50),
		(18,'Maria Guedes','MMS1609','Brasília','DF',5.40),
		(20,'Jian de Barros','ASD123','Curitiba','PR',3.40),
		(28,'Fagundes de Azevedo',NULL,'Verê','PR',2.80),
		(40,'Ari Ribas','gtr4596','Erechim','RS',3.50);

INSERT INTO tb_carros (placa, marca, modelo, ano, combustivel) VALUES
	('LMN5050', 'GM', 'Corsa',2002, 'G'),
	('JFA2699', 'Nissan', 'Kicks',2021, 'F'),
	('QLP3587', 'Volkswagen', 'Gol', 2003, 'F'),
	('BMO6677', 'BMW', '320i',2015, 'G');

SELECT * FROM tb_carros;

UPDATE tb_carros SET modelo = 'Corsa Sedan', ano = 2002 WHERE placa = 'LMN5050';
UPDATE tb_carros SET combustivel = 'A' WHERE placa = 'JFA2699';

UPDATE tb_vendedores SET carro = 'LMN5050' WHERE cod = 44;
UPDATE tb_vendedores SET carro = 'JFA2699' WHERE cod = 45;
UPDATE tb_vendedores SET carro = 'QLP3587' WHERE cod = 9;
UPDATE tb_vendedores SET carro = 'BMO6677' WHERE cod = 28;

SELECT * FROM tb_vendedores;