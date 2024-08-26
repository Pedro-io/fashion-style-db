-- Consultas para o gerente da loja

-- 1. Produtos com estoque abaixo de 10 unidades:
SELECT Nome, QuantidadeEstoque
FROM Produto
WHERE QuantidadeEstoque < 10;

-- 2. Valor total das vendas de um cliente específico:
SELECT SUM(p.Preco * iv.Quantidade) AS ValorTotalVendas
FROM ItemVenda iv
JOIN Venda v ON iv.VendaID = v.ID
JOIN Produto p ON iv.ProdutoID = p.ID
JOIN Cliente c ON v.ClienteID = c.ID
WHERE c.Nome = 'João Santos';

-- 3. Quantidade de camisetas vendidas em um determinado mês:
SELECT SUM(iv.Quantidade) AS TotalCamisetasVendidas
FROM ItemVenda iv
JOIN Venda v ON iv.VendaID = v.ID
JOIN Produto p ON iv.ProdutoID = p.ID
WHERE p.Categoria = 'Camiseta'
AND v.Data BETWEEN '2023-03-01' AND '2023-03-31';

-- 4. Listar todos os produtos da categoria 'Calça'
SELECT Nome, Preco, QuantidadeEstoque
FROM Produto
WHERE Categoria = 'Calça';

-- 5. Valor total das vendas por categoria de produto
SELECT p.Categoria, SUM(p.Preco * iv.Quantidade) AS ValorTotalVendas
FROM ItemVenda iv
JOIN Venda v ON iv.VendaID = v.ID
JOIN Produto p ON iv.ProdutoID = p.ID
GROUP BY p.Categoria;

-- 6. Listar os clientes que realizaram compras em um determinado período
SELECT DISTINCT c.Nome
FROM Cliente c
JOIN Venda v ON c.ID = v.ClienteID
WHERE v.Data BETWEEN '2023-03-01' AND '2023-03-31';

-- 7. Listar os produtos mais vendidos em ordem decrescente de quantidade vendida
SELECT p.Nome, SUM(iv.Quantidade) AS QuantidadeVendida
FROM ItemVenda iv
JOIN Produto p ON iv.ProdutoID = p.ID
GROUP BY p.Nome
ORDER BY QuantidadeVendida DESC;

-- 8. Listar os clientes que realizaram compras acima de um determinado valor
SELECT c.Nome, SUM(p.Preco * iv.Quantidade) AS ValorTotalCompra
FROM Cliente c
JOIN Venda v ON c.ID = v.ClienteID
JOIN ItemVenda iv ON v.ID = iv.VendaID
JOIN Produto p ON iv.ProdutoID = p.ID
GROUP BY c.Nome
HAVING ValorTotalCompra > 100;

-- 9. Listar os produtos com estoque abaixo de um determinado limite
SELECT Nome, QuantidadeEstoque
FROM Produto
WHERE QuantidadeEstoque < 10;

-- 10. Listar os produtos com maior e menor preço
SELECT Nome, Preco
FROM Produto
ORDER BY Preco DESC
LIMIT 1;

SELECT Nome, Preco
FROM Produto
ORDER BY Preco ASC
LIMIT 1;