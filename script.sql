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

INSERT INTO Empresa (cnpj,nome,email,senha,cep,logradouro,bairro,numero,imagem) VALUES 
('34328194000170','McDonalds','mc_jardins@mcdonalds.com.br','mcdonalds','91110000','AV. ASSIS BRASIL','JARDINS',4320,'https://www.019agora.com.br/wp-content/uploads/2019/12/loja-mcd.jpg'),
('21248062000197','Burger King','bk_saoluiz@burgerking.com.br','burgerking','31270672','AV PRESIDENTE ANTONIO CARLOS','SÃO LUIZ','7808','https://www.saboravida.com.br/wp-content/uploads/2020/12/burger-king-inaugura-em-sp-restaurante-idealizado-pelos-consumidores-1.jpg'),
('92215100000153','KFC','kfc_moncoes@kfc.com.br','kfc','04576000','AVENIDA JORNALISTA ROBERTO MARINHO','CIDADE MONCOES',2050,'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/kfc-open-thanksgiving-1637539246.jpg');

INSERT INTO Funcionario (nome, email, senha, fkEmpresa) VALUES
('João Silva','joao_silva@mcdonalds.com.br','joao',1),
('Carmen Julia','carmen_lucia@burguerking.com.br','carmen',2),
('Maria Ribeiro','maria_ribeiro@kfc.com.br','maria',3);

-- FUNCIONARIOS MART
INSERT INTO Empresa (cnpj,nome,email,senha,cep,logradouro,bairro,numero,imagem) VALUES
('14785236932587','MarT','mart@mart.com.br','mart','01414001','Rua Haddock Lobo','Cerqueira César','595','https://i.imgur.com/XhQWbY3.png');

INSERT INTO Funcionario (nome, email, senha, fkEmpresa) VALUES
('Ana Marques','ana@mart.com.br','ana',4),
('Danilo Kovacs','danilo@mart.com.br','danilo',4),
('Pedro Fontes','pedro@mart.com.br','pedro',4),
('Nickolas Junior','nickolas@mart.com.br','nickolas',4),
('Guilherme Silva','guilherme@mart.com.br','guilherme',4);

INSERT INTO Totem (hostname,local,status,fkEmpresa) VALUES
('mc-totem-1','1 ANDAR A1','ativo',1),
('mc-totem-2','1 ANDAR A2','ativo',1),
('mc-totem-3','1 ANDAR A3','inativo',1),
('mc-totem-4','1 ANDAR A4','ativo',1),
('bk-totem-1','1 ANDAR A1','ativo',2),
('bk-totem-2','1 ANDAR A2','ativo',2),
('bk-totem-3','1 ANDAR A3','ativo',2),
('kfc-totem-1','1 ANDAR A1','ativo',3),
('kfc-totem-2','1 ANDAR A2','inativo',3);

INSERT INTO Componente (tipo,modelo,fkTotem) VALUES
('PROCESSADOR','Intel Celeron n3350 Quad Core 1,10 GHz',1),
('PROCESSADOR','Intel Celeron n3350 Quad Core 1,10 GHz',2),
('PROCESSADOR','Intel Celeron n3350 Quad Core 1,10 GHz',3),
('PROCESSADOR','Intel Celeron n3350 Quad Core 1,10 GHz',4),
('PROCESSADOR','INTEL CORE I3 10100 6MBCH 3.6GHZ',5),
('PROCESSADOR','INTEL CORE I3 10100 6MBCH 3.6GHZ',6),
('PROCESSADOR','INTEL CORE I3 10100 6MBCH 3.6GHZ',7),
('PROCESSADOR','INTEL CORE I3 10100 6MBCH 3.6GHZ',8),
('PROCESSADOR','INTEL CORE I3 10100 6MBCH 3.6GHZ',9),
('DISCO','Seagate Pipeline HD ST3500312CS 500GB',1),
('DISCO','Seagate Pipeline HD ST3500312CS 500GB',2),
('DISCO','Seagate Pipeline HD ST3500312CS 500GB',3),
('DISCO','Seagate Pipeline HD ST3500312CS 500GB',4),
('DISCO','SSD Kingston A400, 480GB SA400S37/480G',5),
('DISCO','SSD Kingston A400, 480GB SA400S37/480G',6),
('DISCO','SSD Kingston A400, 480GB SA400S37/480G',7),
('DISCO','SSD Kingston A400, 480GB SA400S37/480G',8),
('DISCO','SSD Kingston A400, 480GB SA400S37/480G',9),
('MEMORIA','Kingston 4 GB DDR3 1333 MHz',1),
('MEMORIA','Kingston 4 GB DDR3 1333 MHz',2),
('MEMORIA','Kingston 4 GB DDR3 1333 MHz',3),
('MEMORIA','Kingston 4 GB DDR3 1333 MHz',4),
('MEMORIA','Corsair 2 GB DDR3 1333 MHz',5),
('MEMORIA','Corsair 2 GB DDR3 1333 MHz',6),
('MEMORIA','Corsair 2 GB DDR3 1333 MHz',7),
('MEMORIA','Corsair 2 GB DDR3 1333 MHz',8),
('MEMORIA','Corsair 2 GB DDR3 1333 MHz',9),
('MEMORIA','Corsair 2 GB DDR3 1333 MHz',9),
('SISTEMA','Ubuntu',1),
('SISTEMA','Ubuntu',2),
('SISTEMA','Ubuntu',3),
('SISTEMA','Ubuntu',4),
('SISTEMA','Windows',5),
('SISTEMA','Windows',6),
('SISTEMA','Windows',7),
('SISTEMA','Windows',8),
('SISTEMA','Windows',9);

INSERT INTO Historico (fkComponente,medicao, fkUnidadeMedida) VALUES
(1,'29', 1), -- INICIO PROCESSADOR PORCENTAGEM
(2,'30', 1),
(3,'0', 1),--
(4,'20', 1),
(5,'15', 1),
(6,'32', 1),
(7,'75', 1),
(8,'22', 1),
(9,'0', 1), -- FIM PROCESSADOR PORCENTAGEM
(10,'43', 1), -- INICIO DISCO
(11,'82', 1),
(12,'0', 1),
(13,'54', 1),
(14,'96', 1),
(15,'15', 1),
(16,'22', 1),
(17,'39', 1),
(18,'0', 1), -- FIM DISCO
(19,'9.6', 1), -- INICIO MEMORIA
(20,'35', 1),
(21,'0', 1),--
(22,'89', 1),
(23,'27', 1),
(24,'12', 1),
(25,'45', 1),
(26,'62', 1),
(27,'0', 1),
(28,'0', 1), -- FIM MEMORIA
(29,'3 days, 06:56:03', 2), -- INICIO SISTEMA TEMPO
(30,'2 days, 04:00:00', 2),
(31,'0 days, 00:00:00', 2), --
(32,'0 days, 16:05;37', 2),
(33,'4 days, 02:27:00', 2),
(34,'3 days, 01:07:41', 2),
(35,'2 days, 14:13:21', 2),
(36,'1 day, 02:07:32', 2),
(37,'0 days, 00:00:00', 2); -- FIM SISTEMA TEMPO

INSERT INTO UnidadeMedida (unidadeMedida) VALUES
('%'),
('H');

INSERT INTO Empresa (cnpj,nome,email,senha,cep,logradouro,bairro,numero,imagem) VALUES 
('41214523695412','McDonalds','mc_itamarati@mcdonalds.com.br','mc@@2001','13568781','RUA AUGUSTO MARIA PATRIZZI','RESIDENCIAL ITAMARATI',625,'https://www.hypeness.com.br/1/2021/05/8a2f7118-mcdonalds-azul.jpeg'),
('24630178224201','Burger King','bk_jardimsol@burguerking.com.br','burgerking','13610827','Rua Maria Fercem','JARDIM DO SOL','284','https://www.tscti.com.br/wp-content/uploads/2015/10/burgerking.jpeg'),
('55223366447711','KFC','kfc_centro@kfc.com.br','kfc','13800156','RUA TRES DE ABRIL','CENTRO',987,'https://media-cdn.tripadvisor.com/media/photo-s/07/bb/bc/7d/kfc.jpg');

INSERT INTO Totem (hostname,local,status,fkEmpresa) VALUES
('mc-totem-5','1 ANDAR A1','ativo',5),
('mc-totem-6','1 ANDAR A2','ativo',5),
('mc-totem-7','1 ANDAR A3','inativo',5),
('bk-totem-4','1 ANDAR A1','ativo',6),
('bk-totem-5','1 ANDAR A2','ativo',6),
('bk-totem-6','1 ANDAR A3','ativo',6),
('kfc-totem-3','1 ANDAR A1','ativo',7),
('kfc-totem-4','1 ANDAR A2','inativo',7);

-- ADIÇÃO DE ON DELETE CASCADE PARA QUE OS REGISTROS ATRELADOS A FK TAMBÉM SERÃO EXCLUÍDOS
ALTER TABLE Funcionario ADD FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa);
ALTER TABLE Totem ADD FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa) ON DELETE CASCADE;
ALTER TABLE Componente ADD FOREIGN KEY (fkTotem) REFERENCES Totem(idTotem) ON DELETE CASCADE;
ALTER TABLE Historico ADD FOREIGN KEY (fkComponente) REFERENCES Componente(idComponente) ON DELETE CASCADE;
ALTER TABLE Historico ADD FOREIGN KEY (fkUnidadeMedida) REFERENCES UnidadeMedida (idUnidadeMedida) ON DELETE CASCADE;