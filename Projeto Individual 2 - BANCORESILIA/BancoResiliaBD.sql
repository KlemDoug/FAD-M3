------------------------------------------------------------------
--  SENAC/RESILIA - Formação em Análise de Dados (FAD)          --
--  Projeto Individual 2 - Módulo 3 - Banco Resilia             --
--  PostgreSQL 15 -*- coding: utf-8 -*-                         --
--  Criado por: Douglas Klem Portugal do Amaral                 --
--  Data de criação: 28/03/2023                                 --
--  versão = 6.19(64-bit)                                       --
------------------------------------------------------------------
--
--BANCO DE DADOS BANCORESILIA--
--
--criação das tabelas para cada entidade--
--
--entidade1--
CREATE TABLE CADASTRO_EMPRESA(
  CNPJ INTEGER NOT NULL PRIMARY KEY,
  Nome VARCHAR(255),
  Telefone INTEGER,
  Endereco VARCHAR(255)
);
--
--entidade2--
CREATE TABLE CADASTRO_TECNOLOGIA(
  ID_Cad_Tec INTEGER NOT NULL PRIMARY KEY,
  Nome VARCHAR(255),
  Area VARCHAR(255)
);
--
--entidade3--
CREATE TABLE RELATORIO(
	ID_Relatorio INTEGER NOT NULL PRIMARY KEY,
	Data_Compilacao DATE,
	CNPJ INTEGER NOT NULL
);
ALTER TABLE RELATORIO
ADD CONSTRAINT fk_CNPJ
FOREIGN KEY (CNPJ)
REFERENCES CADASTRO_EMPRESA(CNPJ);
--
--entidade4--
CREATE TABLE CURSOS(
  ID_Curso INTEGER NOT NULL PRIMARY KEY,
  Nome VARCHAR(255),
  CargaHoraria INTEGER,
  Palestrante VARCHAR(255),
  Turno VARCHAR(255),
  Stack VARCHAR(255),
  CNPJ INTEGER NOT NULL
);
ALTER TABLE CURSOS
ADD CONSTRAINT fk_CNPJ
FOREIGN KEY (CNPJ)
REFERENCES CADASTRO_EMPRESA(CNPJ);
--
--entidade5--
CREATE TABLE RELATORIO_TECNOLOGIA(
	ID_Relatorio INTEGER NOT NULL,
	ID_Cad_Tec INTEGER NOT NULL,
	CONSTRAINT pk_RELATORIO_TECNOLOGIA PRIMARY KEY (ID_Relatorio, ID_Cad_Tec),
	CONSTRAINT fk_ID_Relatorio FOREIGN KEY (ID_Relatorio) REFERENCES RELATORIO(ID_Relatorio),
    CONSTRAINT fk_ID_Cad_Tec FOREIGN KEY (ID_Cad_Tec) REFERENCES CADASTRO_TECNOLOGIA(ID_Cad_Tec)
);
--
--entidade6--
CREATE TABLE EMPRESA_CURSOS(
	CNPJ INTEGER NOT NULL,
	ID_Curso INTEGER NOT NULL, 
	CONSTRAINT pk_EMPRESA_CURSOS PRIMARY KEY (CNPJ, ID_Curso),
	CONSTRAINT fk_CNPJ FOREIGN KEY (CNPJ) REFERENCES CADASTRO_EMPRESA(CNPJ),
    CONSTRAINT fk_ID_Curso FOREIGN KEY (ID_Curso) REFERENCES CURSOS(ID_Curso)
);
--
--finalização das tabelas para cada entidade--
------------------------------------------------------------------