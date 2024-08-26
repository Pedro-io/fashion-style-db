# Banco de Dados de Loja de Roupas - Fashion Style

Este repositório contém o código SQL para um banco de dados fictício de uma loja de roupas chamada "Fashion Style". O projeto inclui tabelas para produtos, clientes, vendas e itens de venda, bem como dados fictícios e exemplos de consultas para atender às necessidades do gerente da loja.


### Pré-requisitos

* MySQL instalado e configurado em seu sistema.

### Instalação

1. Clone este repositório:
   ```bash
   git clone https://github.com/Pedro-io/fashion-style-db.git
   ```

2. Crie um novo banco de dados no MySQL:
   ```sql
   CREATE DATABASE fashion_style;
   ```


### Tabelas

O banco de dados contém as seguintes tabelas:

**1. Produto:**

```sql
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
```

**2. Cliente:**

```sql
CREATE TABLE Cliente (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  Nome VARCHAR(255) NOT NULL,
  Email VARCHAR(255) UNIQUE,
  Telefone VARCHAR(20)
);
```

**3. Venda:**

```sql
CREATE TABLE Venda (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  Data DATE NOT NULL,
  ClienteID INT NOT NULL,
  FOREIGN KEY (ClienteID) REFERENCES Cliente(ID)
);
```

**4. ItemVenda:**

```sql
CREATE TABLE ItemVenda (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  VendaID INT NOT NULL,
  ProdutoID INT NOT NULL,
  Quantidade INT NOT NULL,
  FOREIGN KEY (VendaID) REFERENCES Venda(ID),
  FOREIGN KEY (ProdutoID) REFERENCES Produto(ID)
);
```

### Dados Fictícios

O arquivo `fashion_style.sql` contém os dados fictícios para as tabelas. Você pode encontrar os dados dentro do arquivo, incluindo produtos, clientes, vendas e itens de venda.

### Consultas de Exemplo

O arquivo `consultas.sql` contém exemplos de consultas SQL que o gerente da loja pode usar para obter informações relevantes sobre as vendas, estoque e clientes. Veja alguns exemplos:

**1. Produtos com estoque abaixo de 10 unidades:**

```sql
SELECT Nome, QuantidadeEstoque
FROM Produto
WHERE QuantidadeEstoque < 10;
```

**2. Valor total das vendas de um cliente específico:**

```sql
SELECT SUM(p.Preco * iv.Quantidade) AS ValorTotalVendas
FROM ItemVenda iv
JOIN Venda v ON iv.VendaID = v.ID
JOIN Produto p ON iv.ProdutoID = p.ID
JOIN Cliente c ON v.ClienteID = c.ID
WHERE c.Nome = 'João Santos';
```

**3. Quantidade de camisetas vendidas em um determinado mês:**

```sql
SELECT SUM(iv.Quantidade) AS TotalCamisetasVendidas
FROM ItemVenda iv
JOIN Venda v ON iv.VendaID = v.ID
JOIN Produto p ON iv.ProdutoID = p.ID
WHERE p.Categoria = 'Camiseta'
AND v.Data BETWEEN '2023-03-01' AND '2023-03-31';
```

### Uso

1. Conecte-se ao banco de dados `fashion_style` usando o MySQL:
   ```bash
   mysql -u seu_usuario -p fashion_style
   ```

2. Execute as consultas SQL no arquivo `consultas.sql` para obter informações do banco de dados.



### Arquivos do Projeto

* `fashion_style.sql`: Script SQL para criar o banco de dados e inserir os dados fictícios.
* `consultas.sql`: Arquivo com exemplos de consultas SQL.
* `README.md`: Este arquivo.

