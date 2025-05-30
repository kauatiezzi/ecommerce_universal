CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome_completo VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    data_nascimento DATE,
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP, 
    ultima_compra DATETIME NULL 
);


CREATE TABLE Endereco (
    id_endereco INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    rua VARCHAR(255) NOT NULL,
    numero VARCHAR(50),
    cidade VARCHAR(100) NOT NULL,
    estado VARCHAR(100) NOT NULL,
    cep VARCHAR(10) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

CREATE TABLE Categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome_categoria VARCHAR(100) UNIQUE NOT NULL,
    descricao TEXT
);

CREATE TABLE Produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    id_categoria INT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL, 
    estoque INT NOT NULL DEFAULT 0,
    data_inclusao DATETIME DEFAULT CURRENT_TIMESTAMP, 
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria),
    CHECK (estoque >= 0) 
);

CREATE TABLE Carrinho (
    id_carrinho INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL UNIQUE,
    data_criacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

CREATE TABLE Itens_Carrinho (
    id_item_carrinho INT PRIMARY KEY AUTO_INCREMENT,
    id_carrinho INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    FOREIGN KEY (id_carrinho) REFERENCES Carrinho(id_carrinho),
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto),
    UNIQUE (id_carrinho, id_produto), 
    CHECK (quantidade > 0)
);

CREATE TABLE Pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_endereco INT NOT NULL, 
    data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Pendente', 'Processando', 'Enviado', 'Entregue', 'Cancelado') NOT NULL DEFAULT 'Pendente',
    total_pedido DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_endereco) REFERENCES Endereco(id_endereco)
);

CREATE TABLE Itens_Pedidos (
    id_item_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto),
    UNIQUE (id_pedido, id_produto),
    CHECK (quantidade > 0)
);

CREATE TABLE Pagamentos (
    id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    valor_pago DECIMAL(10, 2) NOT NULL,
    data_pagamento DATETIME DEFAULT CURRENT_TIMESTAMP,
    metodo_pagamento VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido)
);

CREATE TABLE Fornecedores (
    id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    contato VARCHAR(255),
    cnpj VARCHAR(18) UNIQUE
);

CREATE TABLE Produtos_Fornecedor (
    id_produto INT NOT NULL,
    id_fornecedor INT NOT NULL,
    PRIMARY KEY (id_produto, id_fornecedor), 
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto),
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedores(id_fornecedor)
);







-- Clientes
INSERT INTO Clientes (nome_completo, email, senha, telefone, data_nascimento, data_cadastro, ultima_compra) VALUES
('João Silva', 'joao.silva@email.com', 'senha123', '11987654321', '1990-05-15', '2023-01-10 10:00:00', '2024-04-20 14:30:00'),
('Maria Oliveira', 'maria.oliver@email.com', 'senha456', '21912345678', '1988-11-22', '2023-02-20 11:15:00', '2024-05-10 09:00:00'),
('Carlos Pereira', 'carlos.p@email.com', 'senha789', '31998761234', '1995-03-01', '2023-03-01 12:00:00', '2024-05-25 16:00:00'),
('Ana Souza', 'ana.souza@email.com', 'senhaabc', '41911223344', '1992-07-30', '2023-04-05 09:30:00', NULL), -- Cliente sem compra
('Pedro Rocha', 'pedro.r@email.com', 'senhaxyz', '51988776655', '1985-01-10', '2023-05-10 14:00:00', '2024-03-10 10:00:00'),
('Laura Santos', 'laura.s@email.com', 'senha111', '61999887766', '1998-09-03', '2023-06-12 17:00:00', '2024-05-20 11:30:00'),
('Fernando Costa', 'fernando.c@email.com', 'senha222', '71987651234', '1970-02-28', '2023-07-01 08:00:00', '2024-05-18 15:00:00'),
('Isabela Mendes', 'isabela.m@email.com', 'senha333', '81912348765', '1993-12-05', '2023-08-15 13:00:00', '2024-05-01 12:00:00'),
('Ricardo Almeida', 'ricardo.a@email.com', 'senha444', '91998765432', '1980-06-20', '2023-09-01 09:00:00', '2024-05-05 10:00:00'),
('Julia Lima', 'julia.l@email.com', 'senha555', '11911112222', '1997-04-18', '2023-10-01 16:00:00', '2024-05-15 13:00:00');


-- Endereco
-- Os id_cliente aqui devem corresponder aos IDs gerados automaticamente na tabela Clientes.
-- Se os Clientes foram inseridos na ordem acima, seus IDs serão 1, 2, 3...
INSERT INTO Endereco (id_cliente, rua, numero, cidade, estado, cep) VALUES
(1, 'Rua das Flores', '100', 'São Paulo', 'SP', '01000-000'),
(1, 'Av. Principal', '500', 'São Paulo', 'SP', '02000-000'),
(2, 'Rua da Paz', '25', 'Rio de Janeiro', 'RJ', '20000-000'),
(3, 'Rua do Sol', '300', 'Belo Horizonte', 'MG', '30000-000'),
(4, 'Rua da Praia', '10', 'Florianópolis', 'SC', '88000-000'),
(5, 'Rua das Árvores', '50', 'Porto Alegre', 'RS', '90000-000'),
(6, 'Rua da Alegria', '123', 'Brasília', 'DF', '70000-000'),
(7, 'Rua do Comércio', '456', 'Salvador', 'BA', '40000-000'),
(8, 'Rua da Amizade', '789', 'Recife', 'PE', '50000-000'),
(9, 'Rua da Montanha', '99', 'Curitiba', 'PR', '80000-000'),
(10, 'Rua da Felicidade', '1', 'Fortaleza', 'CE', '60000-000');

-- Categorias
INSERT INTO Categorias (nome_categoria, descricao) VALUES
('Eletrônicos', 'Dispositivos eletrônicos em geral.'),
('Roupas', 'Vestuário masculino, feminino e infantil.'),
('Alimentos', 'Produtos alimentícios e bebidas.'),
('Livros', 'Livros de diversos gêneros.'),
('Ferramentas', 'Ferramentas manuais e elétricas.'),
('Decoração', 'Itens para decoração de casa.');

-- Produtos
-- Os id_categoria aqui devem corresponder aos IDs gerados automaticamente na tabela Categorias.
INSERT INTO Produtos (id_categoria, nome, descricao, preco, estoque, data_inclusao) VALUES
(1, 'Smartphone X', 'Celular de última geração com câmera 108MP.', 2500.00, 50, '2023-01-01 08:00:00'),
(1, 'Fone de Ouvido Bluetooth', 'Fone sem fio com cancelamento de ruído.', 350.00, 120, '2023-01-05 09:00:00'),
(2, 'Camiseta Algodão', 'Camiseta básica 100% algodão.', 59.90, 300, '2023-02-10 10:00:00'),
(2, 'Calça Jeans Skinny', 'Calça jeans moderna e confortável.', 120.00, 150, '2023-02-15 11:00:00'),
(3, 'Café Torrado e Moído', 'Café especial 250g.', 18.50, 500, '2023-03-01 12:00:00'),
(3, 'Biscoito Integral', 'Biscoito saudável com grãos.', 7.00, 400, '2023-03-05 13:00:00'),
(4, 'O Pequeno Príncipe', 'Livro clássico de Antoine de Saint-Exupéry.', 35.00, 80, '2023-04-01 14:00:00'),
(4, 'A Arte da Guerra', 'Livro de Sun Tzu sobre estratégia.', 45.00, 60, '2023-04-05 15:00:00'),
(5, 'Furadeira de Impacto', 'Furadeira potente para uso doméstico.', 280.00, 30, '2023-05-01 16:00:00'),
(5, 'Jogo de Chaves Allen', 'Conjunto completo de chaves Allen.', 65.00, 100, '2023-05-05 17:00:00'),
(6, 'Vaso Decorativo Cerâmica', 'Vaso elegante para sala.', 90.00, 70, '2023-06-01 09:00:00'),
(6, 'Almofada Geométrica', 'Almofada com estampa moderna.', 45.00, 100, '2023-06-05 10:00:00');


-- Carrinho
-- Os id_cliente aqui devem corresponder aos IDs gerados automaticamente na tabela Clientes.
INSERT INTO Carrinho (id_cliente) VALUES
(1), -- João tem um carrinho
(3), -- Carlos tem um carrinho
(5); -- Pedro tem um carrinho


-- Itens_Carrinho
-- Os id_carrinho e id_produto aqui devem corresponder aos IDs gerados automaticamente nas tabelas Carrinho e Produtos.
INSERT INTO Itens_Carrinho (id_carrinho, id_produto, quantidade) VALUES
(1, 1, 1),  -- Carrinho 1 (João): 1 Smartphone X (Produto 1)
(1, 3, 2),  -- Carrinho 1 (João): 2 Camisetas Algodão (Produto 3)
(2, 5, 3),  -- Carrinho 2 (Carlos): 3 Café Torrado e Moído (Produto 5)
(2, 9, 1),  -- Carrinho 2 (Carlos): 1 Furadeira de Impacto (Produto 9)
(3, 7, 1);  -- Carrinho 3 (Pedro): 1 O Pequeno Príncipe (Produto 7)


-- Pedidos
-- Os id_cliente e id_endereco aqui devem corresponder aos IDs gerados automaticamente nas tabelas Clientes e Endereco.
INSERT INTO Pedidos (id_cliente, id_endereco, data_pedido, status, total_pedido) VALUES
(1, 1, '2024-04-20 14:30:00', 'Entregue', 2500.00 + 59.90*2), -- Pedido João (Endereço 1)
(2, 3, '2024-05-10 09:00:00', 'Entregue', 18.50*2 + 120.00), -- Pedido Maria (Endereço 3)
(3, 4, '2024-05-25 16:00:00', 'Processando', 350.00 + 7.00*5), -- Pedido Carlos (Endereço 4)
(1, 2, '2024-03-15 10:00:00', 'Entregue', 45.00), -- Pedido João (Endereço 2)
(5, 5, '2024-03-10 10:00:00', 'Entregue', 65.00), -- Pedido Pedro (Endereço 5)
(6, 6, '2024-05-20 11:30:00', 'Pendente', 90.00 + 45.00*2), -- Pedido Laura (Endereço 6)
(7, 7, '2024-05-18 15:00:00', 'Enviado', 280.00); -- Pedido Fernando (Endereço 7)


-- Itens_Pedidos
-- Os id_pedido e id_produto aqui devem corresponder aos IDs gerados automaticamente nas tabelas Pedidos e Produtos.
INSERT INTO Itens_Pedidos (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 1, 2500.00),
(1, 3, 2, 59.90),
(2, 5, 2, 18.50),
(2, 4, 1, 120.00),
(3, 2, 1, 350.00),
(3, 6, 5, 7.00),
(4, 8, 1, 45.00),
(5, 10, 1, 65.00),
(6, 11, 1, 90.00),
(6, 12, 2, 45.00),
(7, 9, 1, 280.00);


-- Pagamentos
-- Os id_pedido aqui devem corresponder aos IDs gerados automaticamente na tabela Pedidos.
INSERT INTO Pagamentos (id_pedido, valor_pago, data_pagamento, metodo_pagamento) VALUES
(1, 2619.80, '2024-04-20 14:31:00', 'Cartão de Crédito'),
(2, 157.00, '2024-05-10 09:01:00', 'PIX'),
(3, 385.00, '2024-05-25 16:01:00', 'Boleto'),
(4, 45.00, '2024-03-15 10:01:00', 'Cartão de Crédito'),
(5, 65.00, '2024-03-10 10:01:00', 'PIX'),
(6, 180.00, '2024-05-20 11:31:00', 'Cartão de Crédito'),
(7, 280.00, '2024-05-18 15:01:00', 'Boleto');


-- Fornecedores
INSERT INTO Fornecedores (nome, contato, cnpj) VALUES
('Tech Eletronicos LTDA', 'contato@techeletronicos.com', '11.222.333/0001-44'),
('Moda Leve S.A.', 'vendas@modaleve.com', '22.333.444/0001-55'),
('Gourmet Foods BR', 'comercial@gourmetfoods.com.br', '33.444.555/0001-66'),
('Editora Sabedoria', 'editora@sabedoria.com', '44.555.666/0001-77'),
('Ferramentas Premium', 'suporte@ferramentaspremium.com', '55.666.777/0001-88');

-- Produtos_Fornecedor
-- Os id_produto e id_fornecedor aqui devem corresponder aos IDs gerados automaticamente nas tabelas Produtos e Fornecedores.
INSERT INTO Produtos_Fornecedor (id_produto, id_fornecedor) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3),
(6, 3),
(7, 4),
(8, 4),
(9, 5),
(10, 5),
(1, 5); -- Exemplo: Smartphone X (Produto 1) também fornecido pela Ferramentas Premium (Fornecedor 5)

-- 5. Queries para Responder às Perguntas do Projeto
-- Lembre-se de ajustar as datas 'YYYY-MM-DD' para o período desejado nas cláusulas WHERE.

-- a) Quais são os três produtos mais vendidos em um dado período?
SELECT
    pr.nome AS nome_produto,
    SUM(ip.quantidade) AS total_vendido
FROM
    Pedidos pe
JOIN
    Itens_Pedidos ip ON pe.id_pedido = ip.id_pedido
JOIN
    Produtos pr ON ip.id_produto = pr.id_produto
WHERE
    pe.data_pedido BETWEEN '2024-01-01' AND '2024-05-31' -- Exemplo: De 1º de janeiro a 31 de maio de 2024
GROUP BY
    pr.nome
ORDER BY
    total_vendido DESC
LIMIT 3;

-- b) Considerando categoria de produtos, liste os itens vendidos.
SELECT DISTINCT
    c.nome_categoria,
    pr.nome AS nome_produto
FROM
    Categorias c
JOIN
    Produtos pr ON c.id_categoria = pr.id_categoria
JOIN
    Itens_Pedidos ip ON pr.id_produto = ip.id_produto
-- Opcional: Para filtrar por um período específico, descomente as linhas abaixo e ajuste as datas:
-- JOIN
--    Pedidos pe ON ip.id_pedido = pe.id_pedido
-- WHERE
--    pe.data_pedido BETWEEN '2024-01-01' AND '2024-05-31'
ORDER BY
    c.nome_categoria, pr.nome;

-- c) Qual é o valor total de vendas por categoria, em um dado período?
SELECT
    c.nome_categoria,
    SUM(ip.quantidade * ip.preco_unitario) AS valor_total_vendas
FROM
    Pedidos pe
JOIN
    Itens_Pedidos ip ON pe.id_pedido = ip.id_pedido
JOIN
    Produtos pr ON ip.id_produto = pr.id_produto
JOIN
    Categorias c ON pr.id_categoria = c.id_categoria
WHERE
    pe.data_pedido BETWEEN '2024-01-01' AND '2024-05-31' -- Exemplo: De 1º de janeiro a 31 de maio de 2024
GROUP BY
    c.nome_categoria
ORDER BY
    valor_total_vendas DESC;

-- d) Quais foram os 10 clientes que mais compraram em um dado período?
SELECT
    cl.nome_completo AS nome_cliente,
    SUM(ip.quantidade * ip.preco_unitario) AS valor_total_gasto
FROM
    Clientes cl
JOIN
    Pedidos pe ON cl.id_cliente = pe.id_cliente
JOIN
    Itens_Pedidos ip ON pe.id_pedido = ip.id_pedido
WHERE
    pe.data_pedido BETWEEN '2024-01-01' AND '2024-05-31' -- Exemplo: De 1º de janeiro a 31 de maio de 2024
GROUP BY
    cl.nome_completo
ORDER BY
    valor_total_gasto DESC
LIMIT 10;

-- e) Quais são os clientes que estão há mais tempo sem comprar nada?
-- Esta query usa a coluna 'ultima_compra' diretamente da tabela Clientes.
SELECT
    cl.nome_completo AS nome_cliente,
    cl.email,
    cl.ultima_compra,
    DATEDIFF(CURDATE(), cl.ultima_compra) AS dias_sem_comprar -- Calcula os dias entre a data atual e a última compra
FROM
    Clientes cl
ORDER BY
    dias_sem_comprar DESC
LIMIT 5; -- Mostra os 5 clientes que estão há mais tempo sem comprar.

-- Alternativa para a questão (e) se a coluna 'ultima_compra' não for atualizada automaticamente
-- ou se você quiser calcular a última data de compra diretamente dos registros de Pedidos:
-- Esta query é mais robusta pois calcula a última compra a partir dos pedidos reais.
SELECT
    cl.nome_completo AS nome_cliente,
    cl.email,
    MAX(pe.data_pedido) AS ultima_compra_registrada,
    DATEDIFF(CURDATE(), MAX(pe.data_pedido)) AS dias_sem_comprar
FROM
    Clientes cl
LEFT JOIN -- Usamos LEFT JOIN para incluir clientes que NUNCA fizeram um pedido
    Pedidos pe ON cl.id_cliente = pe.id_cliente
GROUP BY
    cl.id_cliente, cl.nome_completo, cl.email -- Agrupa por cliente para calcular o MAX da data de pedido
ORDER BY
    dias_sem_comprar DESC; -- Ordena do cliente que está há mais tempo sem comprar para o menos tempo

-- ####################################################################################
-- FIM DO SCRIPT COMPLETO.
-- ####################################################################################