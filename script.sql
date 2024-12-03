-- Criação do Banco de Dados
CREATE DATABASE IF NOT EXISTS Oficina;
USE Oficina;

-- Tabela Clientes
CREATE TABLE IF NOT EXISTS Clientes (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    endereco VARCHAR(255)
);

-- Tabela Veículo
CREATE TABLE IF NOT EXISTS Veiculo (
    idVeiculo INT AUTO_INCREMENT PRIMARY KEY,
    modelo VARCHAR(30) NOT NULL,
    placa CHAR(7) NOT NULL UNIQUE,
    ano INT NOT NULL,
    Clientes_idCliente INT NOT NULL,
    FOREIGN KEY (Clientes_idCliente) REFERENCES Clientes(idCliente)
);

-- Tabela Mecânico
CREATE TABLE IF NOT EXISTS Mecanico (
    idMecanico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    endereco VARCHAR(255),
    especialidade VARCHAR(255)
);

-- Tabela Equipe de Mecânicos
CREATE TABLE IF NOT EXISTS Equipe_Mecanicos (
    idEquipe INT AUTO_INCREMENT PRIMARY KEY,
    nomeEquipe VARCHAR(20) NOT NULL
);

-- Tabela Mecânico/Equipe de Mecânicos
CREATE TABLE IF NOT EXISTS Mecanico_Equipe_Mecanicos (
    Mecanico_idMecanico INT NOT NULL,
    Equipe_Mecanicos_idEquipe INT NOT NULL,
    PRIMARY KEY (Mecanico_idMecanico, Equipe_Mecanicos_idEquipe),
    FOREIGN KEY (Mecanico_idMecanico) REFERENCES Mecanico(idMecanico),
    FOREIGN KEY (Equipe_Mecanicos_idEquipe) REFERENCES Equipe_Mecanicos(idEquipe)
);


-- Tabela Ordem de Serviço (OS)
CREATE TABLE IF NOT EXISTS Ordem_Servico (
    numeroOS INT AUTO_INCREMENT PRIMARY KEY,
    dataEmissao DATE NOT NULL,
    dataEntrega DATE,
    valorTotal FLOAT,
    status VARCHAR(15),
    autorizado BOOLEAN DEFAULT FALSE,
    Veiculo_idVeiculo INT NOT NULL,
    Equipe_Mecanicos_idEquipe INT NOT NULL,
    FOREIGN KEY (Veiculo_idVeiculo) REFERENCES Veiculo(idVeiculo),
    FOREIGN KEY (Equipe_Mecanicos_idEquipe) REFERENCES Equipe_Mecanicos(idEquipe)
);

-- Tabela Peça
CREATE TABLE IF NOT EXISTS Peca (
    idPeca INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    valor FLOAT NOT NULL
);

-- Tabela Peça/Ordem de Serviço (OS)
CREATE TABLE IF NOT EXISTS Peca_OS (
    Peca_idPeca INT NOT NULL,
    OS_numeroOS INT NOT NULL,
    OS_Equipe_Mecanicos_idEquipe INT NOT NULL,
    quantidade INT NOT NULL,
    PRIMARY KEY (Peca_idPeca, OS_numeroOS, OS_Equipe_Mecanicos_idEquipe),
    FOREIGN KEY (Peca_idPeca) REFERENCES Peca(idPeca),
    FOREIGN KEY (OS_numeroOS) REFERENCES Ordem_Servico(numeroOS),
    FOREIGN KEY (OS_Equipe_Mecanicos_idEquipe) REFERENCES Equipe_Mecanicos(idEquipe)
);

-- Tabela Serviço
CREATE TABLE IF NOT EXISTS Servico (
    idServico INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(1000) NOT NULL,
    valor FLOAT NOT NULL
);

-- Tabela Serviço/Ordem de Serviço (OS)
CREATE TABLE IF NOT EXISTS Servico_OS (
    Servico_idServico INT NOT NULL,
    OS_numeroOS INT NOT NULL,
    OS_Equipe_Mecanicos_idEquipe INT NOT NULL,
    valorMaoDeObra FLOAT,
    PRIMARY KEY (Servico_idServico, OS_numeroOS, OS_Equipe_Mecanicos_idEquipe),
    FOREIGN KEY (Servico_idServico) REFERENCES Servico(idServico),
    FOREIGN KEY (OS_numeroOS) REFERENCES Ordem_Servico(numeroOS),
    FOREIGN KEY (OS_Equipe_Mecanicos_idEquipe) REFERENCES Equipe_Mecanicos(idEquipe)
);


-- Inserção de Dados para Testes

-- Inserindo dados na tabela Clientes
INSERT INTO Clientes (nome, endereco) 
VALUES ('João Silva', 'Rua das Flores, 123'),
	('Maria Oliveira', 'Av. Brasil, 456');

-- Inserindo dados na tabela Veículo
INSERT INTO Veiculo (modelo, placa, ano, Clientes_idCliente) 
VALUES ('Fiat Uno', 'ABC1234', 2010, 1),
	('Toyota Corolla', 'XYZ5678', 2020, 2);

-- Inserindo dados na tabela Mecânico
INSERT INTO Mecanico (nome, endereco, especialidade) 
VALUES ('Carlos Andrade', 'Rua dos Mecânicos, 100', 'Motor'),
	('Fernanda Costa', 'Av. Mecânica, 200', 'Suspensão');

-- Inserindo dados na tabela Equipe de Mecânicos
INSERT INTO Equipe_Mecanicos (nomeEquipe) 
VALUES ('Equipe Alpha'),
	('Equipe Beta');
    
-- Inserindo dados na tabela Mecânico/Equipe de Mecânicos
INSERT INTO Mecanico_Equipe_Mecanicos (Mecanico_idMecanico, Equipe_Mecanicos_idEquipe) 
VALUES (1, 1),
	(2, 2);

-- Inserindo dados na tabela Ordem de Serviço (OS)
INSERT INTO Ordem_Servico (dataEmissao, dataEntrega, valorTotal, status, autorizado, Veiculo_idVeiculo, Equipe_Mecanicos_idEquipe) 
VALUES ('2024-11-01', '2024-11-10', 500.00, 'Aberto', TRUE, 1, 1),
	('2024-11-05', NULL, 300.00, 'Em andamento', FALSE, 2, 2);

-- Inserindo dados na tabela Peça
INSERT INTO Peca (nome, valor) 
VALUES ('Filtro de óleo', 50.00),
	('Pastilha de freio', 100.00);

-- Inserindo dados na tabela Peça/Ordem de Serviço (OS)
INSERT INTO Peca_OS (Peca_idPeca, OS_numeroOS, OS_Equipe_Mecanicos_idEquipe, quantidade) 
VALUES (1, 3, 1, 2),
       (2, 4, 2, 4);

-- Inserindo dados na tabela Serviço
INSERT INTO Servico (descricao, valor) 
VALUES ('Troca de óleo', 200.00),
	('Revisão completa', 400.00);
    
-- Inserindo dados na tabela Serviço/Ordem de Serviço (OS)
INSERT INTO Servico_OS (Servico_idServico, OS_numeroOS, OS_Equipe_Mecanicos_idEquipe, valorMaoDeObra) VALUES
(1, 3, 1, 50.00),
(2, 4, 2, 100.00);


-- Consultas SQL

-- Recuperações simples com SELECT
SELECT * FROM Clientes;

-- Filtro com WHERE
SELECT * FROM Ordem_Servico WHERE autorizado = TRUE;

-- Atributos derivados
SELECT Veiculo_idVeiculo, placa, (valorTotal + 100) AS CustoEstimado FROM Ordem_Servico, Veiculo;

-- Ordenação com ORDER BY
SELECT * FROM Peca ORDER BY valor DESC;

-- Filtro em grupos (HAVING)
SELECT OS_numeroOS, SUM(valorMaoDeObra) AS TotalMaoDeObra
FROM Servico_OS
GROUP BY OS_numeroOS
HAVING TotalMaoDeObra > 50;

-- Junção entre tabelas
SELECT 
    c.nome AS Cliente,
    v.modelo AS Veiculo,
    o.valorTotal AS ValorOS
FROM Clientes c
INNER JOIN Veiculo v ON c.idCliente = v.Clientes_idCliente
INNER JOIN Ordem_Servico o ON v.idVeiculo = o.Veiculo_idVeiculo;
