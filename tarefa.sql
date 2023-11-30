-- Tabela Região
CREATE TABLE Regiao (
    Id_Regiao INT PRIMARY KEY,
    Nome_Regiao VARCHAR(255),
    Dimensao_Regiao INT
);

-- Tabela Veículo
CREATE TABLE Veiculo (
    Id_Veiculo INT PRIMARY KEY,
    Cor_Veiculo VARCHAR(50),
    Placa_Veiculo VARCHAR(20)
);

-- Tabela Vendedor
CREATE TABLE Vendedor (
    Id_Vendedor INT PRIMARY KEY,
    Nome_Vendedor VARCHAR(255),
    Id_Regiao INT,
    FOREIGN KEY (Id_Regiao) REFERENCES Regiao(Id_Regiao)
);

-- Tabela Responsável
CREATE TABLE Responsavel (
    Id_Responsavel INT PRIMARY KEY,
    Id_Vendedor INT,
    Id_Veiculo INT,
    Data_Responsavel DATE,
    FOREIGN KEY (Id_Vendedor) REFERENCES Vendedor(Id_Vendedor),
    FOREIGN KEY (Id_Veiculo) REFERENCES Veiculo(Id_Veiculo)
);

-- Tabela Cliente
CREATE TABLE Cliente (
    Id_Cliente INT PRIMARY KEY,
    Nome_Cliente VARCHAR(255),
    CPF_Cliente VARCHAR(15),
    Data_Nasc DATE
);

-- Tabela Nota Fiscal
CREATE TABLE Nota_Fiscal (
    Id_Nota INT PRIMARY KEY,
    Data_Hora DATETIME,
    Id_Vendedor INT,
    Id_Cliente INT,
    FOREIGN KEY (Id_Vendedor) REFERENCES Vendedor(Id_Vendedor),
    FOREIGN KEY (Id_Cliente) REFERENCES Cliente(Id_Cliente)
);

-- Tabela Ponto Estratégico
CREATE TABLE Ponto_Estrategico (
    Id_Ponto INT PRIMARY KEY,
    Desc_Ponto VARCHAR(255),
    Id_Reg INT,
    Data_Pedido DATE,
    FOREIGN KEY (Id_Reg) REFERENCES Regiao(Id_Regiao)
);

-- Tabela Produto
CREATE TABLE Produto (
    Id_Produto INT PRIMARY KEY,
    Preco_Produto DECIMAL(10, 2),
    Desc_Produto VARCHAR(255),
    Quantidade_Produto INT
);

-- Tabela Itens Nota
CREATE TABLE Itens_Nota (
    Id_Item INT PRIMARY KEY,
    Id_Produto INT,
    Quantidade_Item INT,
    Id_Nota INT,
    FOREIGN KEY (Id_Produto) REFERENCES Produto(Id_Produto),
    FOREIGN KEY (Id_Nota) REFERENCES Nota_Fiscal(Id_Nota)
);

-- Inserções para a tabela Região
INSERT INTO Regiao (Id_Regiao, Nome_Regiao, Dimensao_Regiao)
VALUES
    (1, 'Região A', 100),
    (2, 'Região B', 150),
    (3, 'Região C', 120),
    (4, 'Região D', 200),
    (5, 'Região E', 180),
    (6, 'Região F', 90),
    (7, 'Região G', 130),
    (8, 'Região H', 160),
    (9, 'Região I', 110),
    (10, 'Região J', 140);

-- Inserções para a tabela Veiculo
INSERT INTO Veiculo (Id_Veiculo, Cor_Veiculo, Placa_Veiculo)
VALUES
    (1, 'Azul', 'ABC123'),
    (2, 'Preto', 'XYZ789'),
    (3, 'Branco', 'DEF456'),
    (4, 'Vermelho', 'GHI789'),
    (5, 'Verde', 'JKL012'),
    (6, 'Amarelo', 'MNO345'),
    (7, 'Prata', 'PQR678'),
    (8, 'Cinza', 'STU901'),
    (9, 'Roxo', 'VWX234'),
    (10, 'Laranja', 'YZA567');

-- Inserções para a tabela Vendedor
INSERT INTO Vendedor (Id_Vendedor, Nome_Vendedor, Id_Regiao)
VALUES
    (1, 'João Silva', 3),
    (2, 'Maria Oliveira', 5),
    (3, 'Carlos Santos', 1),
    (4, 'Ana Souza', 7),
    (5, 'Roberto Lima', 2),
    (6, 'Fernanda Costa', 9),
    (7, 'Pedro Rocha', 6),
    (8, 'Juliana Pereira', 8),
    (9, 'Lucas Martins', 4),
    (10, 'Aline Ferreira', 10);

-- Inserções para a tabela Responsavel
INSERT INTO Responsavel (Id_Responsavel, Id_Vendedor, Id_Veiculo, Data_Responsavel)
VALUES
    (1, 2, 4, '2023-01-15'),
    (2, 5, 8, '2023-02-20'),
    (3, 8, 2, '2023-03-25'),
    (4, 1, 6, '2023-04-10'),
    (5, 3, 1, '2023-05-05'),
    (6, 7, 10, '2023-06-12'),
    (7, 9, 3, '2023-07-18'),
    (8, 10, 5, '2023-08-22'),
    (9, 4, 9, '2023-09-30'),
    (10, 6, 7, '2023-10-08');

-- Inserções para a tabela Cliente
INSERT INTO Cliente (Id_Cliente, Nome_Cliente, CPF_Cliente, Data_Nasc)
VALUES
    (1, 'Laura Lima', '123.456.789-01', '1990-05-12'),
    (2, 'Rafael Oliveira', '234.567.890-12', '1985-08-28'),
    (3, 'Camila Santos', '345.678.901-23', '1992-03-15'),
    (4, 'Gabriel Rocha', '456.789.012-34', '1988-11-02'),
    (5, 'Isabela Pereira', '567.890.123-45', '1995-07-19'),
    (6, 'Lucas Costa', '678.901.234-56', '1987-04-06'),
    (7, 'Mariana Souza', '789.012.345-67', '1993-09-23'),
    (8, 'Diego Silva', '890.123.456-78', '1984-12-30'),
    (9, 'Juliana Martins', '901.234.567-89', '1998-01-08'),
    (10, 'Vinicius Ferreira', '012.345.678-90', '1986-06-25');

-- Inserções para a tabela Nota Fiscal
INSERT INTO Nota_Fiscal (Id_Nota, Data_Hora, Id_Vendedor, Id_Cliente)
VALUES
    (1, CONVERT(DATETIME, '2023-01-02 08:30:00', 120), 1, 3),
    (2, CONVERT(DATETIME, '2023-02-05 12:15:00', 120), 5, 7),
    (3, CONVERT(DATETIME, '2023-03-10 14:45:00', 120), 8, 5),
    (4, CONVERT(DATETIME, '2023-04-15 10:20:00', 120), 2, 2),
    (5, CONVERT(DATETIME, '2023-05-20 09:00:00', 120), 4, 8),
    (6, CONVERT(DATETIME, '2023-06-25 16:30:00', 120), 7, 10),
    (7, CONVERT(DATETIME, '2023-07-30 11:45:00', 120), 9, 1),
    (8, CONVERT(DATETIME, '2023-08-05 13:00:00', 120), 10, 4),
    (9, CONVERT(DATETIME, '2023-09-12 07:00:00', 120), 3, 6),
    (10, CONVERT(DATETIME, '2023-10-18 15:10:00', 120), 6, 9);

-- Inserções para a tabela Ponto Estratégico
INSERT INTO Ponto_Estrategico (Id_Ponto, Desc_Ponto, Id_Reg, Data_Pedido)
VALUES
    (1, 'Ponto 1', 3, '2023-01-05'),
    (2, 'Ponto 2', 5, '2023-02-08'),
    (3, 'Ponto 3', 8, '2023-03-12'),
    (4, 'Ponto 4', 1, '2023-04-18'),
    (5, 'Ponto 5', 4, '2023-05-22'),
    (6, 'Ponto 6', 7, '2023-06-28'),
    (7, 'Ponto 7', 9, '2023-07-02'),
    (8, 'Ponto 8', 2, '2023-08-10'),
    (9, 'Ponto 9', 6, '2023-09-15'),
    (10, 'Ponto 10', 10, '2023-10-20');

-- Inserções para a tabela Produto
INSERT INTO Produto (Id_Produto, Preco_Produto, Desc_Produto, Quantidade_Produto)
VALUES
    (1, 50.99, 'Produto A', 100),
    (2, 30.50, 'Produto B', 150),
    (3, 25.75, 'Produto C', 120),
    (4, 60.20, 'Produto D', 200),
    (5, 15.99, 'Produto E', 180),
    (6, 40.75, 'Produto F', 90),
    (7, 55.00, 'Produto G', 130),
    (8, 70.50, 'Produto H', 160),
    (9, 22.30, 'Produto I', 110),
    (10, 18.75, 'Produto J', 140);

-- Inserções para a tabela Itens Nota
INSERT INTO Itens_Nota (Id_Item, Id_Produto, Quantidade_Item, Id_Nota)
VALUES
    (1, 3, 2, 1),
    (2, 8, 3, 2),
    (3, 1, 1, 3),
    (4, 6, 4, 4),
    (5, 5, 2, 5),
    (6, 10, 1, 6),
    (7, 2, 3, 7),
    (8, 7, 2, 8),
    (9, 4, 5, 9),
    (10, 9, 1, 10);

-- Consulta: Seleciona todos os pontos estratégicos com seus detalhes de região
SELECT Ponto_Estrategico.*, Regiao.Nome_Regiao
FROM Ponto_Estrategico
INNER JOIN Regiao ON Ponto_Estrategico.Id_Reg = Regiao.Id_Regiao;

-- Consulta: Seleciona apenas os nomes das regiões
SELECT Nome_Regiao FROM Regiao;

-- Consulta: Seleciona vendedores com detalhes de responsáveis do mês anterior
SELECT Vendedor.*, Responsavel.Id_Veiculo, Responsavel.Data_Responsavel
FROM Vendedor
INNER JOIN Responsavel ON Vendedor.Id_Vendedor = Responsavel.Id_Vendedor
WHERE MONTH(Responsavel.Data_Responsavel) = MONTH(GETDATE()) - 1;

-- Consulta: Seleciona vendedores com detalhes de suas regiões
SELECT Vendedor.*, Regiao.Nome_Regiao
FROM Vendedor
INNER JOIN Regiao ON Vendedor.Id_Regiao = Regiao.Id_Regiao;

-- Consulta: Seleciona produtos vendidos por um vendedor específico
SELECT Produto.*
FROM Produto
INNER JOIN Itens_Nota ON Produto.Id_Produto = Itens_Nota.Id_Produto
INNER JOIN Nota_Fiscal ON Itens_Nota.Id_Nota = Nota_Fiscal.Id_Nota
WHERE Nota_Fiscal.Id_Vendedor = Id_Vendedor;

-- Consulta: Seleciona vendedores que venderam um produto específico
SELECT Vendedor.*
FROM Vendedor
INNER JOIN Nota_Fiscal ON Vendedor.Id_Vendedor = Nota_Fiscal.Id_Vendedor
INNER JOIN Itens_Nota ON Nota_Fiscal.Id_Nota = Itens_Nota.Id_Nota
WHERE Itens_Nota.Id_Produto = Id_Produto;

-- Consulta: Seleciona produtos não associados a notas fiscais
SELECT Produto.*
FROM Produto
LEFT JOIN Itens_Nota ON Produto.Id_Produto = Itens_Nota.Id_Produto
WHERE Itens_Nota.Id_Produto IS NULL;

-- Consulta: Seleciona responsáveis com detalhes de veículos
SELECT Responsavel.*, Veiculo.Cor_Veiculo, Veiculo.Placa_Veiculo
FROM Responsavel
INNER JOIN Veiculo ON Responsavel.Id_Veiculo = Veiculo.Id_Veiculo
WHERE Veiculo.Id_Veiculo = Responsavel.Id_Veiculo;

-- Consulta: Conta a quantidade de itens por nota fiscal
SELECT Id_Nota, COUNT(Id_Item) AS Quantidade_Itens
FROM Itens_Nota
GROUP BY Id_Nota;
