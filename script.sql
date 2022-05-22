CREATE DATABASE mart;
USE mart;

CREATE TABLE Empresa (
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
cnpj CHAR(14),
nome VARCHAR(45),
email VARCHAR(100) UNIQUE,
senha VARCHAR(40),
cep CHAR(8),
logradouro VARCHAR(200),
bairro VARCHAR(45),
numero INT,
imagem VARCHAR(200),
CONSTRAINT unq_cnpj UNIQUE (cnpj)
);

CREATE TABLE Funcionario (
idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
email VARCHAR(100) UNIQUE,
senha VARCHAR(40),
fkEmpresa INT
);

CREATE TABLE Totem (
idTotem INT PRIMARY KEY AUTO_INCREMENT,
hostname VARCHAR(45) UNIQUE,
local VARCHAR(45),
status VARCHAR(12),
dataManutencao DATETIME DEFAULT CURRENT_TIMESTAMP,
fkEmpresa INT,
CONSTRAINT chk_status CHECK (status = 'ativo' OR status = 'inativo' OR status = 'manutencao')
);

CREATE TABLE Componente (
idComponente INT PRIMARY KEY AUTO_INCREMENT,
tipo VARCHAR(45),
modelo VARCHAR(200),
fkTotem INT
);

CREATE TABLE Historico (
idHistorico INT PRIMARY KEY AUTO_INCREMENT,
fkComponente INT,
fkUnidadeMedida INT,
medicao VARCHAR(45),
dataHora DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE UnidadeMedida (
idUnidadeMedida INT PRIMARY KEY AUTO_INCREMENT,
unidadeMedida VARCHAR(45)
);

INSERT INTO UnidadeMedida (unidadeMedida) VALUES
('%'),
('H');

-- ADIÇÃO DE ON DELETE CASCADE PARA QUE OS REGISTROS ATRELADOS A FK TAMBÉM SERÃO EXCLUÍDOS
ALTER TABLE Funcionario ADD FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa);
ALTER TABLE Totem ADD FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa) ON DELETE CASCADE;
ALTER TABLE Componente ADD FOREIGN KEY (fkTotem) REFERENCES Totem(idTotem) ON DELETE CASCADE;
ALTER TABLE Historico ADD FOREIGN KEY (fkComponente) REFERENCES Componente(idComponente) ON DELETE CASCADE;
ALTER TABLE Historico ADD FOREIGN KEY (fkUnidadeMedida) REFERENCES UnidadeMedida (idUnidadeMedida) ON DELETE CASCADE;