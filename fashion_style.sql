-- Criação do banco de dados
CREATE DATABASE fashion_style;

-- Uso do banco de dados
USE fashion_style;

-- Criação da tabela Produto
CREATE TABLE Produto (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  Nome VARCHAR(255) NOT NULL,
  Descricao VARCHAR(500),
  Categoria VARCHAR(50) NOT NULL,
  Tamanho VARCHAR(10) NOT NULL,
  Cor VARCHAR(50) NOT NULL,
  Preco DECIMAL(10,2) NOT NULL,
  QuantidadeEstoque INT NOT NULL
);

-- Criação da tabela Cliente
CREATE TABLE Cliente (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  Nome VARCHAR(255) NOT NULL,
  Email VARCHAR(255) UNIQUE,
  Telefone VARCHAR(20)
);

-- Criação da tabela Venda
CREATE TABLE Venda (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  Data DATE NOT NULL,
  ClienteID INT NOT NULL,
  FOREIGN KEY (ClienteID) REFERENCES Cliente(ID)
);

-- Criação da tabela ItemVenda
CREATE TABLE ItemVenda (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  VendaID INT NOT NULL,
  ProdutoID INT NOT NULL,
  Quantidade INT NOT NULL,
  FOREIGN KEY (VendaID) REFERENCES Venda(ID),
  FOREIGN KEY (ProdutoID) REFERENCES Produto(ID)
);

-- Inserindo dados na tabela Produto
INSERT INTO Produto (Nome, Descricao, Categoria, Tamanho, Cor, Preco, QuantidadeEstoque) VALUES
  ('Camiseta', 'Camiseta básica de algodão', 'Camiseta', 'M', 'Azul', 29.99, 50),
  ('Calça Jeans', 'Calça jeans skinny', 'Calça', '38', 'Preto', 99.99, 30),
  ('Vestido Floral', 'Vestido midi floral', 'Vestido', 'M', 'Vermelho', 79.99, 20),
  ('Blusa de Lã', 'Blusa de lã com gola alta', 'Blusa', 'M', 'Bege', 49.99, 15),
  ('Sapatênis', 'Sapatênis casual', 'Calçado', '40', 'Marrom', 89.99, 10);

-- Inserindo dados na tabela Cliente
INSERT INTO Cliente (Nome, Email, Telefone) VALUES
  ('Maria Silva', 'maria.silva@email.com', '11999999999'),
  ('João Santos', 'joao.santos@email.com', '21988888888'),
  ('Ana Oliveira', 'ana.oliveira@email.com', '12977777777'),
  ('Pedro Gomes', 'pedro.gomes@email.com', '19966666666');

-- Inserindo dados na tabela Venda
INSERT INTO Venda (Data, ClienteID) VALUES
  ('2023-03-10', 1),
  ('2023-03-15', 2),
  ('2023-03-20', 3);

-- Inserindo dados na tabela ItemVenda
INSERT INTO ItemVenda (VendaID, ProdutoID, Quantidade) VALUES
  (1, 1, 2),
  (1, 2, 1),
  (2, 3, 1),
  (3, 4, 2);
