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
--consultas para as perguntas do escopo do projeto--
--
--1.Qual empresa utiliza o maior número de tecnologias na última pesquisa (2/2022)?
SELECT CADASTRO_EMPRESA.CNPJ, CADASTRO_EMPRESA.Nome, COUNT(*) AS NUM_TEC
FROM CADASTRO_EMPRESA
LEFT JOIN RELATORIO
ON CADASTRO_EMPRESA.CNPJ = RELATORIO.CNPJ
LEFT JOIN RELATORIO_TECNOLOGIA
ON RELATORIO.ID_Relatorio = RELATORIO_TECNOLOGIA.ID_Relatorio
WHERE RELATORIO.Data_Compilacao >= '2022-07-01' AND RELATORIO.Data_Compilacao <= '2022-12-31'
GROUP BY CADASTRO_EMPRESA.CNPJ, CADASTRO_EMPRESA.Nome
ORDER BY NUM_TEC DESC
LIMIT 1;
--
--2. Qual empresa utilizava o menor número de tecnologias na pesquisa anterior (1/2022)?
SELECT CADASTRO_EMPRESA.CNPJ, CADASTRO_EMPRESA.Nome, COUNT(*) AS NUM_TEC
FROM CADASTRO_EMPRESA
LEFT JOIN RELATORIO
ON CADASTRO_EMPRESA.CNPJ = RELATORIO.CNPJ
LEFT JOIN RELATORIO_TECNOLOGIA
ON RELATORIO.ID_Relatorio = RELATORIO_TECNOLOGIA.ID_Relatorio
WHERE RELATORIO.Data_Compilacao >= '2022-01-01' AND RELATORIO.Data_Compilacao <= '2022-06-30'
GROUP BY CADASTRO_EMPRESA.CNPJ, CADASTRO_EMPRESA.Nome
ORDER BY NUM_TEC ASC
LIMIT 1;
--
--3. Quantas empresas utilizam tecnologias da área de “Dados” atualmente?
SELECT COUNT (CADASTRO_EMPRESA.CNPJ)
FROM CADASTRO_EMPRESA
JOIN RELATORIO
ON CADASTRO_EMPRESA.CNPJ = RELATORIO.CNPJ
JOIN RELATORIO_TECNOLOGIA 
ON RELATORIO.ID_Relatorio = RELATORIO_TECNOLOGIA.ID_Relatorio
JOIN CADASTRO_TECNOLOGIA 
ON RELATORIO_TECNOLOGIA.ID_Cad_Tec = CADASTRO_TECNOLOGIA.ID_Cad_Tec
WHERE CADASTRO_TECNOLOGIA.Area = 'Dados' AND RELATORIO.Data_Compilacao > '2022-07-01';
--
--4. Quantas empresas utilizam tecnologias que não são da área de “Dados” atualmente?
SELECT COUNT (DISTINCT CADASTRO_EMPRESA.CNPJ)
FROM CADASTRO_EMPRESA
JOIN RELATORIO
ON CADASTRO_EMPRESA.CNPJ = RELATORIO.CNPJ
JOIN RELATORIO_TECNOLOGIA 
ON RELATORIO.ID_Relatorio = RELATORIO_TECNOLOGIA.ID_Relatorio
JOIN CADASTRO_TECNOLOGIA 
ON RELATORIO_TECNOLOGIA.ID_Cad_Tec = CADASTRO_TECNOLOGIA.ID_Cad_Tec
WHERE CADASTRO_TECNOLOGIA.Area != 'Dados' AND RELATORIO.Data_Compilacao > '2022-07-01';
--
--finalização das consultas--
-------------------------------------------------------------------