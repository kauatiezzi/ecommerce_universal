-- a) Quais são os três produtos mais vendidos em um dado período?
SELECT
    Produtos.nome AS nome_produto,
    SUM(Itens_Pedidos.quantidade) AS total_vendido
FROM
    Pedidos
JOIN
    Itens_Pedidos ON Pedidos.id_pedido = Itens_Pedidos.id_pedido
JOIN
    Produtos ON Itens_Pedidos.id_produto = Produtos.id_produto
WHERE
    Pedidos.data_pedido BETWEEN '2024-01-01' AND '2024-05-31'
GROUP BY
    Produtos.nome
ORDER BY
    total_vendido DESC
LIMIT 3;

-- b) Considerando categoria de produtos, liste os itens vendidos.
SELECT DISTINCT
    Categorias.nome_categoria,
    Produtos.nome AS nome_produto
FROM
    Categorias
JOIN
    Produtos ON Categorias.id_categoria = Produtos.id_categoria
JOIN
    Itens_Pedidos ON Produtos.id_produto = Itens_Pedidos.id_produto
ORDER BY
    Categorias.nome_categoria, Produtos.nome;

-- c) Qual foi o valor total de vendas por categoria em um dado período?
SELECT
    Categorias.nome_categoria,
    SUM(Itens_Pedidos.quantidade * Itens_Pedidos.preco_unitario) AS valor_total_vendas
FROM
    Pedidos
JOIN
    Itens_Pedidos ON Pedidos.id_pedido = Itens_Pedidos.id_pedido
JOIN
    Produtos ON Itens_Pedidos.id_produto = Produtos.id_produto
JOIN
    Categorias ON Produtos.id_categoria = Categorias.id_categoria
WHERE
    Pedidos.data_pedido BETWEEN '2024-01-01' AND '2024-05-31'
GROUP BY
    Categorias.nome_categoria
ORDER BY
    valor_total_vendas DESC;

-- d) Quais são os 10 clientes que mais gastaram em um dado período?
SELECT
    Clientes.nome_completo AS nome_cliente,
    SUM(Itens_Pedidos.quantidade * Itens_Pedidos.preco_unitario) AS valor_total_gasto
FROM
    Clientes
JOIN
    Pedidos ON Clientes.id_cliente = Pedidos.id_cliente
JOIN
    Itens_Pedidos ON Pedidos.id_pedido = Itens_Pedidos.id_pedido
WHERE
    Pedidos.data_pedido BETWEEN '2024-01-01' AND '2024-05-31'
GROUP BY
    Clientes.nome_completo
ORDER BY
    valor_total_gasto DESC
LIMIT 10;

-- e) Quais são os clientes que estão há mais tempo sem comprar nada?
SELECT
    Clientes.nome_completo AS nome_cliente,
    Clientes.email,
    Clientes.ultima_compra,
    DATEDIFF(CURDATE(), Clientes.ultima_compra) AS dias_sem_comprar
FROM
    Clientes
ORDER BY
    dias_sem_comprar DESC;