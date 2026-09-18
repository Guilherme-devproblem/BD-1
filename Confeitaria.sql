CREATE DATABASE db_confeitaria

USE db_confeitaria

CREATE TABLE tbl_cliente (
    cod_cli INT,
    nome VARCHAR(20),
    endereco VARCHAR(30),
    PRIMARY KEY (cod_cli)
);

INSERT tbl_cliente(cod_cli,nome,endereco) VALUES
        (43,'André','Rua da Tristeza 873'),
        (23,'Aline','Rua da Felicidade 271'),
        (46,'Ambar','Rua da Tristeza 097');

SELECT * FROM   tbl_cliente;

CREATE TABLE tbl_pedido(
    cod_pedido INT,
    data_pedido DATE,
    valor_total FLOAT,
    PRIMARY KEY (cod_pedido)
);

INSERT tbl_pedido (cod_pedido,data_pedido,valor_total) VALUES
        (12,'05/08/25',54),
        (09,'26/02/27',13),
        (17,'13/01/28',98);

SELECT * FROM   tbl_pedido;

CREATE TABLE tbl_produto(
    cod_produto INT,
    valor_kg FLOAT,
    descricao VARCHAR(30),
    PRIMARY KEY (cod_produto)
);

INSERT tbl_produto (cod_produto,valor_kg,descricao) VALUES
        (851,58.03,'FRAGIL'),
        (401,1234.97,'TÓXICO'),
        (211,341.67,'INFLAMAVEL');

SELECT * FROM   tbl_produto;

CREATE TABLE tbl_telefone_cliente(
    cod_cli INT,
    telefone VARCHAR(20),
    PRIMARY KEY (telefone,cod_cli),
    FOREIGN KEY (cod_cli) REFERENCES tbl_cliente (cod_cli)
);

INSERT tbl_telefone_cliente(cod_cli,telefone) VALUES
        (43,'11-98765-3064'),
        (23,'11-92361-4081'),
        (46,'11-96642-4552');

SELECT * FROM   tbl_telefone_cliente;

CREATE TABLE tbl_Itempedido(
    quantidade INT,
    cod_pedido INT,
    cod_produto INT,
    PRIMARY KEY (cod_pedido,cod_produto),
    FOREIGN KEY (cod_pedido) REFERENCES tbl_pedido (cod_pedido),
    FOREIGN KEY (cod_produto) REFERENCES tbl_produto (cod_produto)
);

INSERT tbl_Itempedido (quantidade,cod_pedido,cod_produto) VALUES
        (1242,12 ,851),
        (5002,09,401),
        (182,17,211);

SELECT * FROM   tbl_Itempedido;