CREATE DATABASE FORTIFICAR;

USE FORTIFICAR;

-- Tabela de Funcionários
CREATE TABLE ANALISTAS (
    ID_ANALI INT PRIMARY KEY AUTO_INCREMENT,
    NOME_ANALI VARCHAR(255) NOT NULL,
    CARGO_ANALI VARCHAR(100) NOT NULL,
    EMAIL_ANALI VARCHAR(100) UNIQUE NOT NULL,
    TELEFONE_ANALI VARCHAR(20) NOT NULL
);

CREATE TABLE INSTITUICAO (
    ID_INST INT PRIMARY KEY AUTO_INCREMENT,
    NOME_INST VARCHAR(255) NOT NULL,
    CNPJ_INST VARCHAR(20) UNIQUE NOT NULL,
    LOGRADOURO_INST VARCHAR(100) NOT NULL,
    NUMERO_INST VARCHAR(100) NOT NULL,
    BAIRRO_INST VARCHAR(100) NOT NULL,
    CIDADE_INST VARCHAR(100) NOT NULL,
    UF_INST CHAR(2) NOT NULL,
    TELEFONE_INST VARCHAR(20) NOT NULL,
    EMAIL_INST VARCHAR(100) NOT NULL,
    DATA_CADASTRO_INST TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    STATUS_INST BOOLEAN DEFAULT FALSE
);

-- Tabela de Editais
CREATE TABLE EDITAIS (
    ID_EDITAL INT PRIMARY KEY AUTO_INCREMENT,
    NOME_EDITAL VARCHAR(255) NOT NULL,
    DESC_EDITAL TEXT,
    DATA_ABERTURA_EDITAL DATE NOT NULL,
    DATA_FECHAMENTO_EDITAL DATE NOT NULL,
    STATUS_EDITAL BOOLEAN DEFAULT TRUE
);

-- Tabela de Projetos
CREATE TABLE PROJETOS (
    ID_PROJETO INT PRIMARY KEY AUTO_INCREMENT,
    ID_INSTITUICAO INT,
    ID_EDITAL INT,
    ID_ANALISTA INT,
    NOME_PROJETO VARCHAR(255) NOT NULL,
    DESC_PROJETO TEXT,
    DATA_SUBMISSAO_PROJETO TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    STATUS_PROJETO BOOLEAN DEFAULT FALSE,
    VALOR_APROVADO_PROJ DECIMAL(15, 2),
    FOREIGN KEY (ID_INSTITUICAO) REFERENCES INSTITUICAO(ID_INST),
    FOREIGN KEY (ID_EDITAL) REFERENCES EDITAIS(ID_EDITAL),
    FOREIGN KEY (ID_ANALISTA) REFERENCES ANALISTAS(ID_ANALI)
);

-- Tabela de Despesas dos Projetos
CREATE TABLE DESPESAS (
    ID_DESPESA INT PRIMARY KEY AUTO_INCREMENT,
    ID_PROJETO INT,
    DATA_DESPESA DATE NOT NULL,
    VALOR DECIMAL(15, 2) NOT NULL,
    DESCRICAO VARCHAR(255),
    FOREIGN KEY (ID_PROJETO) REFERENCES PROJETOS(ID_PROJETO)
);

-- Tabela de Temáticas de Projetos
CREATE TABLE ODS (
    ID_ODS INT PRIMARY KEY,
    NOME_ODS VARCHAR(255) NOT NULL,
    DESC_ODS TEXT
);

-- Relacionamento entre Projetos e ODS
CREATE TABLE PROJETO_ODS (
    ID_PROJETO INT,
    ID_ODS INT,
    PRIMARY KEY (ID_PROJETO,ID_ODS),
    FOREIGN KEY (ID_PROJETO) REFERENCES PROJETOS(ID_PROJETO),
    FOREIGN KEY (ID_ODS) REFERENCES ODS(ID_ODS)
);
