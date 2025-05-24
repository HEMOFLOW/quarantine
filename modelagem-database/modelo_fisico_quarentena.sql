
-- Criação das tabelas
CREATE TABLE Pessoa (
    id_pessoa INT PRIMARY KEY,
    nome VARCHAR(100),
    cpf VARCHAR(14),
    contato VARCHAR(100)
);

CREATE TABLE Doador (
    id_doador INT PRIMARY KEY,
    tipo VARCHAR(50),
    ativo BOOLEAN,
    FOREIGN KEY (id_doador) REFERENCES Pessoa(id_pessoa)
);

CREATE TABLE Atendimento (
    id_atendimento INT PRIMARY KEY,
    FOREIGN KEY (id_atendimento) REFERENCES Pessoa(id_pessoa)
);

CREATE TABLE Regra (
    id_regra INT PRIMARY KEY,
    condicao VARCHAR(100),
    dias_quarentena INT
);

CREATE TABLE Quarentena (
    id_quarentena INT PRIMARY KEY,
    data_inicio DATE,
    data_fim DATE,
    id_doador INT,
    id_regra INT,
    FOREIGN KEY (id_doador) REFERENCES Doador(id_doador),
    FOREIGN KEY (id_regra) REFERENCES Regra(id_regra)
);

CREATE TABLE Agendamento (
    id_agendamento INT PRIMARY KEY,
    data DATE,
    hora TIME,
    tipo VARCHAR(50),
    id_doador INT,
    FOREIGN KEY (id_doador) REFERENCES Doador(id_doador)
);
