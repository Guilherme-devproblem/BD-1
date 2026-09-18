CREATE DATABASE db_clinicamedica

USE db_clinicamedica

CREATE TABLE tbl_paciente (
    RG VARCHAR(30),
    nome VARCHAR(20),
    endereco VARCHAR(30),
    convenio VARCHAR(20),
    PRIMARY KEY (RG)
);

INSERT tbl_paciente(RG,nome,endereco,convenio) VALUES
        ('12.345.678-9','André','Rua da Tristeza 873','FAMILIAR'),
        ('45.678.901-2','Aline','Rua da Felicidade 271','INDIVIDUAL'),
        ('89.012.345-X','Ambar','Rua da Tristeza 097','EMPRESARIAL');

SELECT * FROM   tbl_paciente;

CREATE TABLE tbl_consulta(
    cod_consulta INT,
    data_consulta DATE,
    hora VARCHAR(10),
    RG VARCHAR(30),
    CRM VARCHAR(20),
    PRIMARY KEY (RG,CRM),
    FOREIGN KEY (CRM) REFERENCES tbl_medico (CRM),
    FOREIGN KEY (RG) REFERENCES tbl_paciente(RG)
);

INSERT tbl_consulta(cod_consulta,data_consulta,hora,RG,CRM) VALUES
        (431,'26-09-25','21:00','12.345.678-9','CRM/SP 123456'),
        (242,'27-01-27','20:30','45.678.901-2','CRM/SP 987654'),
        (623,'29-12-28','19:20','89.012.345-X','CRM/SP 456789');

SELECT * FROM   tbl_consulta;

CREATE TABLE tbl_medico (
    CRM VARCHAR(20),
    nome VARCHAR(20),
    RG VARCHAR(30),
    PRIMARY KEY (CRM)
);

INSERT tbl_medico(CRM,nome,RG) VALUES
        ('CRM/SP 123456','Geraldo','34.567.890-1'),
        ('CRM/SP 987654','Alice','56.789.012-3'),
        ('CRM/SP 456789','Esmeralda','78.901.234-5');

SELECT * FROM   tbl_medico;