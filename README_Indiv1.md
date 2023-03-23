## Descrição ##

Este repositório (FAD-M3) contém os arquivos utilizados para disponibilizar a infraestrutura necessária dos projetos referentes ao Módulo 3 (Banco de Dados e Relacionamento Interpessoal) do curso de Formação em Análise de Dados promovido pela parceria SENAC/Resilia. Neste caso, é detalhado o primeiro projeto individual do módulo:

Foi realizado um contrato para desenvolver um banco de dados que irá armazenar dados importantes que será utilizado pelo sistema RESILIADATA. O sistema irá auxiliar na avaliação de quais são as tecnologias que as empresas parceiras estão utilizando e quais ajustes são necessários nas stacks dos cursos. Há um cadastro de empresa parceira, um cadastro de tecnologias com a opção de selecionar a área (webdev, dados, marketing etc) e uma tabela para registrar quais tecnologias as empresas estão utilizando.

Nessa etapa da criação do banco de dados, foram trabalhados os processos de modelagem prévia para o sistema e os registros das entidades para verificação das informações preenchidas.


###########################################################################################################

## Arquivos ##

* **ConceptRaw.png**: arquivo contendo imagem do modelo conceitual inicial;
* **ConceptUpgrade.png**: arquivo contendo imagem do modelo conceitual aprimorado;
* **LogicRaw.png**: arquivo contendo imagem do modelo lógico inicial;
* **LogicUpgrade.png**: arquivo contendo imagem do modelo lógico aprimorado;
* **Answers.docx**: documento explicativo relatando as etapas da modelagem, suas entidades, relacionamentos e cardinalidades envolvidas, além das respostas às perguntas indagadas no projeto-base; é necessário processo de download desse arquivo para leitura;
* **Answers.pdf**: versão para leitura imediata e com proteção de formatação do Answers.docx;
* **README_Indiv1.md**: arquivo que abriga uma breve descrição do projeto com o título, suas funcionalidades, arquivos presentes na pasta do projeto e o registro final no banco de dados;


###########################################################################################################

## Funcionalidades ##

### * 1: Modelagem ###

Essa etapa foi amplamente discutida e ilustrada com as imagens dos modelos trabalhos no arquivo explicativo 'Answers', ficando a gosto do usuário a leitura offline (.docx) ou diretamente pelo repositório (.pdf).



### * 2: Registro no Banco de Dados ###

Na codificação dos modelos anteriores, foram concebidos de forma fictícia dois ou mais registros para cada entidade existente afim de se checar o preenchimento das informações. Essa etapa do projeto foi trabalhada no SQL Online IDE (https://sqliteonline.com/)  por PostgreSQL, conforme mostrado abaixo:

```sql
--criação das tabelas para cada entidade--
--entidade1--
CREATE TABLE CADASTRO_EMPRESA(
  CNPJ INTEGER PRIMARY KEY,
  Nome VARCHAR(255),
  Telefone INTEGER,
  Endereco VARCHAR(255),
  ID_Cad_Tec INTEGER,
  FOREIGN KEY (ID_Cad_Tec) REFERENCES CADASTRO_EMPRESA(CNPJ)
);

--entidade2--
CREATE TABLE CADASTRO_TECNOLOGIA(
  ID_Cad_Tec INTEGER primary KEY,
  Nome VARCHAR(255),
  Area VARCHAR(255),
  CNPJ INTEGER,
  FOREIGN Key (CNPJ) REFERENCES CADASTRO_TECNOLOGIA(ID_Cad_Tec)
);

--entidade3 (relacionamento promovido)--
CREATE TABLE CADASTRO_EMP_TEC(
  CNPJ INTEGER,
  ID_Cad_Tec INTEGER,
  CONSTRAINT pk_EMP_TEC PRIMARY KEY (CNPJ, ID_Cad_Tec),
  CONSTRAINT fk_CNPJ FOREIGN KEY (CNPJ) REFERENCES CADASTRO_EMPRESA(CNPJ),
  CONSTRAINT fk_ID_Cad_Tec FOREIGN KEY (ID_Cad_Tec) REFERENCES CADASTRO_TECNOLOGIA(ID_Cad_Tec)
);

--entidade4 (entidade do aprimoramento)--
CREATE TABLE CURSOS(
  ID_Curso INTEGER PRIMARY KEY,
  Nome VARCHAR(255),
  CargaHoraria INTEGER,
  Palestrante VARCHAR(255),
  Turno VARCHAR(255),
  Stack VARCHAR(255),
  CNPJ INTEGER,
  FOREIGN KEY (CNPJ) REFERENCES CADASTRO_EMPRESA(CNPJ) 
);
--finalização das tabelas para cada entidade--

--início dos registros e testes de preenchimento de dados--
--registros da entidade 1--
INSERT INTO cadastro_empresa VALUES
(12345670,'XP Investimentos',33344444,'Rua Fofolete da Silva 220'),
(98372932,'Nubank',33212188,'Avenida Senador Ximbinha 1892'),
(12345678,'Itaú',33388399,'Rua Sujeito Suspeito 337');
SELECT * FROM cadastro_empresa;

--registros da entidade 2--
INSERT INTO cadastro_tecnologia VALUES
(00030,'JavaScript','Web Development'),
(393878,'Unix','Game Development'),
(000300,'SQL','Data Analytics');
SELECT * FROM cadastro_tecnologia;

--registros da entidade 3--
INSERT INTO cadastro_emp_tec VALUES
(12345670,00030),
(98372932,393878),
(12345678,000300);
SELECT * FROM cadastro_emp_tec;

--registros da entidade 4--
INSERT INTO cursos VALUES
(993848,'Infraestrutura de Redes',430,'Edgard Simas','Tarde','back-end'),
(228293,'Desenvolvimento Web Mobile',500,'Daniel Sanches','Manhã','full-stack'),
(1279182,'Cloud Computing',540,'Bruno Veritas','Manhã','servers');
SELECT * FROM cursos
--finalização dos registros e testes de preenchimento de dados--
```

<sub>***Cada entidade foi codificada pelo comando CREATE, gerando uma tabela que recebe seus campos e respectivos tipos (ex. 'Area VARCHAR(255)'). Ao final do código, registraram-se as informações pelo comando INSERT INTO para cada uma das entidades. As amostras dos dados no terminal da plataforma pelo uso do comando SELECT * FROM validam a integridade para o recebimento de novos dados posteriormente.***</sub>


###########################################################################################################
