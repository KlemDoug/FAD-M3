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
CREATE TABLE CADASTRO_EMPRESA (
  CNPJ INTEGER PRIMARY KEY,
  Nome VARCHAR(255),
  Telefone INTEGER,
  Endereco VARCHAR(255),
  ID_Cad_Tec INTEGER,
  FOREIGN KEY (ID_Cad_Tec) REFERENCES CADASTRO_EMPRESA(CNPJ)
);
 
CREATE TABLE CADASTRO_TECNOLOGIA(
  ID_Cad_Tec INTEGER primary KEY,
  Nome VARCHAR(255),
  Area VARCHAR(255),
  CNPJ INTEGER,
  FOREIGN Key (CNPJ) REFERENCES CADASTRO_TECNOLOGIA(ID_Cad_Tec)
);
 
CREATE TABLE CADASTRO_EMP_TEC(
  CNPJ INTEGER,
  ID_Cad_Tec INTEGER,
  CONSTRAINT pk_EMP_TEC PRIMARY KEY (CNPJ, ID_Cad_Tec),
  CONSTRAINT fk_CNPJ FOREIGN KEY (CNPJ) REFERENCES CADASTRO_EMPRESA(CNPJ),
  CONSTRAINT fk_ID_Cad_Tec FOREIGN KEY (ID_Cad_Tec) REFERENCES CADASTRO_TECNOLOGIA(ID_Cad_Tec)
);

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
```

<sub>***Nota: supõe-se nesse modelo do projeto que todas as notas trabalhadas serão números inteiros. É possível trabalhar com números decimais, se for necessário; basta colocar 'float(input())' em substituição.***</sub>


###########################################################################################################
