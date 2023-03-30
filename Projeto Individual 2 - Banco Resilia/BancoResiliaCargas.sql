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
--início dos registros para popular o banco de dados--
--
--registros da tabela 1--
INSERT INTO CADASTRO_EMPRESA VALUES
(77382821,'Statkraft',47240670,'Lilleakerveien 6, NO-0283 Oslo, Norway'),
(22000049,'IBM Brasil',20031170,'Av. República do Chile, 330 Centro, RJ'),
(01590944,'Itaú',20050005,'Rua Sete de Setembro 99a Centro, RJ'),
(55558992,'EBANX',96123456,'Rua Marechal Deodoro, 630 Curitiba,PR');
--
--registros da tabela 2--
INSERT INTO CADASTRO_TECNOLOGIA VALUES
(100,'JavaScript','Desenvolvimento Web'),
(200,'Unity','Desenvolvimento de Jogos'),
(300,'SQL','Dados'),
(400,'Ruby','Desenvolvimento de Software'),
(500,'Tableau','Dados'),
(600,'TCP/IP','Infraestrutura de Redes'),
(700, 'VPN','Segurança da Informação'),
(800,'Oracle','Dados'),
(900,'Unreal Engine','Desenvolvimento de Jogos');
--
--registros da tabela 3--
INSERT INTO RELATORIO VALUES
(11111,'2022-03-09',77382821),
(22222,'2022-04-19',22000049),
(33333,'2022-06-03',01590944),
(44444,'2022-05-14',55558992),
(77777,'2022-08-30',77382821),
(88888,'2022-10-23',22000049),
(99999,'2022-09-08',01590944),
(10101,'2022-07-10',55558992);
--
--registros da tabela 4--
INSERT INTO CURSOS VALUES
(993848,'Infraestrutura de Redes',430,'Edgard Simas','Tarde','back-end',77382821),
(228293,'Desenvolvimento Web Mobile',500,'Daniel Sanches','Manhã','full-stack',77382821),
(1279182,'Cloud Computing',540,'Bruno Veritas','Manhã','servers',22000049),
(1212121,'Modelagem para Jogos Eletrônicos',670,'Amanda Caldas','Manhã','back-end',22000049),
(1231231,'Automação de Sistemas',330,'Denilson Dantas','Tarde','devops',01590944),
(1234123,'Introdução ao Machine Learning',200,'Daniel Marques','Tarde','inteligência artificial',55558992),
(2345234,'Soluções para Big Data',290,'Américo Rodrigues','Noite','engenharia de dados',55558992),
(5674567,'APIs e Integrações',310,'Vítor Moura','Manhã','back-end',55558992),
(1282890,'Ciberssegurança',490,'Douglas Portugal','Noite','segurança da informação',01590944),
(2918376,'Swift e Kotlin para Desenvolvimento Mobile',250,'Jean Faria','Manhã','mobile',55558992);
--
--registros da tabela 5--
INSERT INTO RELATORIO_TECNOLOGIA VALUES
(11111,100),
(22222,200),
(33333,300),
(44444,400),
(77777,500),
(77777,600),
(77777,700),
(88888,800),
(99999,900),
(10101,200),
(11111,200),
(11111,300),
(33333,200),
(44444,600),
(44444,700),
(77777,900),
(77777,100),
(88888,900),
(99999,400),
(11111,400);
--
--registros da tabela 6--
INSERT INTO EMPRESA_CURSOS VALUES
(77382821,993848),
(77382821,228293),
(22000049,1279182),
(22000049,1212121),
(55558992,1234123),
(55558992,2345234),
(55558992,5674567),
(55558992,2918376),
(01590944,1231231),
(01590944,1282890);
--
--finalização dos registros--
------------------------------------------------------------------