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
INSERT INTO Carrinho (id_cliente) VALUES
(1), -- João tem um carrinho
(3), -- Carlos tem um carrinho
(5); -- Pedro tem um carrinho


-- Itens_Carrinho
INSERT INTO Itens_Carrinho (id_carrinho, id_produto, quantidade) VALUES
(1, 1, 1),  -- Carrinho 1 (João): 1 Smartphone X (Produto 1)
(1, 3, 2),  -- Carrinho 1 (João): 2 Camisetas Algodão (Produto 3)
(2, 5, 3),  -- Carrinho 2 (Carlos): 3 Café Torrado e Moído (Produto 5)
(2, 9, 1),  -- Carrinho 2 (Carlos): 1 Furadeira de Impacto (Produto 9)
(3, 7, 1);  -- Carrinho 3 (Pedro): 1 O Pequeno Príncipe (Produto 7)


-- Pedidos
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


INSERT INTO Clientes (nome_completo, email, senha, telefone, data_nascimento, data_cadastro, ultima_compra) VALUES
('Mariana Ferreira', 'mariana.f@email.com', 'senha666', '11977665544', '1991-08-01', '2023-11-01 09:00:00', '2024-05-10 10:00:00'),
('Gabriel Nunes', 'gabriel.n@email.com', 'senha777', '11966554433', '1987-04-25', '2023-12-05 14:00:00', '2024-05-22 17:00:00'),
('Sofia Dias', 'sofia.d@email.com', 'senha888', '11955443322', '1999-01-12', '2024-01-15 11:00:00', '2024-05-28 08:00:00'),
('Lucas Barbosa', 'lucas.b@email.com', 'senha999', '11944332211', '1982-10-03', '2024-02-01 16:00:00', '2024-04-15 11:00:00'),
('Helena Godoy', 'helena.g@email.com', 'senha000', '11933221100', '1994-06-19', '2024-03-10 10:00:00', NULL); -- Novo cliente sem compra ainda

-- 2. Mais Endereços (Associados aos novos e alguns clientes existentes)
INSERT INTO Endereco (id_cliente, rua, numero, cidade, estado, cep) VALUES
(11, 'Rua da Tecnologia', '200', 'São Paulo', 'SP', '03000-000'), -- Mariana
(12, 'Av. das Inovações', '75', 'Campinas', 'SP', '13000-000'), -- Gabriel
(13, 'Rua das Artes', '10', 'Curitiba', 'PR', '81000-000'), -- Sofia
(14, 'Estrada Velha', '999', 'Ribeirão Preto', 'SP', '14000-000'), -- Lucas
(15, 'Rua Nova', '50', 'Belo Horizonte', 'MG', '31000-000'), -- Helena
(1, 'Rua do Teste', '1', 'São Paulo', 'SP', '01000-001'), -- Endereço adicional para João
(2, 'Av. do Teste', '2', 'Rio de Janeiro', 'RJ', '20000-001'); -- Endereço adicional para Maria

-- 3. Mais Categorias
INSERT INTO Categorias (nome_categoria, descricao) VALUES
('Esportes', 'Artigos esportivos e vestuário para prática de exercícios.'),
('Brinquedos', 'Brinquedos para todas as idades.'),
('Casa e Jardim', 'Itens para casa, cozinha e jardinagem.');

-- 4. Mais Produtos (Associados às novas e algumas categorias existentes)
INSERT INTO Produtos (id_categoria, nome, descricao, preco, estoque, data_inclusao) VALUES
(1, 'Notebook Gamer', 'Notebook potente para jogos e trabalho.', 4500.00, 20, '2023-07-01 10:00:00'),
(2, 'Tênis de Corrida', 'Tênis leve e confortável para corrida.', 299.90, 80, '2023-08-05 11:00:00'),
(7, 'Bola de Futebol', 'Bola oficial de futebol de campo.', 89.90, 150, '2023-09-01 12:00:00'),
(8, 'LEGO Cidade', 'Conjunto de blocos de montar da série Cidade.', 150.00, 60, '2023-10-10 13:00:00'),
(8, 'Boneca Encantada', 'Boneca com acessórios e sons.', 75.00, 100, '2023-10-15 14:00:00'),
(9, 'Kit Ferramentas Jardim', 'Kit completo para jardinagem amadora.', 120.00, 40, '2023-11-01 15:00:00'),
(9, 'Panela Antiaderente', 'Panela de alta qualidade com revestimento antiaderente.', 99.00, 100, '2023-11-10 16:00:00'),
(3, 'Chocolate Belga 100g', 'Chocolate amargo importado.', 25.00, 200, '2024-01-20 09:00:00'),
(4, 'Livro de Receitas', 'Livro com diversas receitas culinárias.', 60.00, 50, '2024-02-15 10:00:00'),
(5, 'Parafusadeira Elétrica', 'Parafusadeira sem fio com bateria de lítio.', 350.00, 25, '2024-03-01 11:00:00');

-- 5. Mais Carrinhos (Associados aos novos clientes)
INSERT INTO Carrinho (id_cliente) VALUES
(11), -- Mariana
(12), -- Gabriel
(13); -- Sofia

-- 6. Mais Itens de Carrinho (Nos novos carrinhos)
INSERT INTO Itens_Carrinho (id_carrinho, id_produto, quantidade) VALUES
(4, 13, 1), -- Carrinho de Mariana: Notebook Gamer
(4, 15, 2), -- Carrinho de Mariana: Boneca Encantada
(5, 14, 1), -- Carrinho de Gabriel: Tênis de Corrida
(5, 17, 1), -- Carrinho de Gabriel: Panela Antiaderente
(6, 12, 1), -- Carrinho de Sofia: Almofada Geométrica
(6, 16, 1); -- Carrinho de Sofia: Kit Ferramentas Jardim

-- 7. Mais Pedidos (para os novos clientes e alguns clientes existentes)
INSERT INTO Pedidos (id_cliente, id_endereco, data_pedido, status, total_pedido) VALUES
(11, 11, '2024-05-10 10:00:00', 'Entregue', 4500.00 + 89.90), -- Mariana: Notebook + Bola de Futebol
(12, 12, '2024-05-22 17:00:00', 'Entregue', 299.90*2), -- Gabriel: 2 Tênis de Corrida
(13, 13, '2024-05-28 08:00:00', 'Pendente', 150.00 + 75.00), -- Sofia: LEGO + Boneca
(1, 12, '2024-05-27 10:00:00', 'Processando', 25.00*3 + 60.00), -- João (novo end): 3 Chocolate + Livro
(9, 9, '2024-05-20 14:00:00', 'Entregue', 350.00 + 45.00); -- Ricardo: Parafusadeira + Almofada

-- 8. Mais Itens de Pedido
INSERT INTO Itens_Pedidos (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(8, 13, 1, 4500.00), -- Pedido 8 (Mariana): Notebook Gamer
(8, 15, 1, 89.90), -- Pedido 8 (Mariana): Bola de Futebol
(9, 14, 2, 299.90), -- Pedido 9 (Gabriel): Tênis de Corrida
(10, 16, 1, 150.00), -- Pedido 10 (Sofia): LEGO Cidade
(10, 15, 1, 75.00), -- Pedido 10 (Sofia): Boneca Encantada
(11, 18, 3, 25.00), -- Pedido 11 (João): Chocolate Belga
(11, 19, 1, 60.00), -- Pedido 11 (João): Livro de Receitas
(12, 20, 1, 350.00), -- Pedido 12 (Ricardo): Parafusadeira Elétrica
(12, 12, 1, 45.00); -- Pedido 12 (Ricardo): Almofada Geométrica

-- 9. Mais Pagamentos
INSERT INTO Pagamentos (id_pedido, valor_pago, data_pagamento, metodo_pagamento) VALUES
(8, 4589.90, '2024-05-10 10:05:00', 'Cartão de Crédito'),
(9, 599.80, '2024-05-22 17:05:00', 'PIX'),
(10, 225.00, '2024-05-28 08:05:00', 'Boleto'),
(11, 135.00, '2024-05-27 10:05:00', 'Cartão de Crédito'),
(12, 395.00, '2024-05-20 14:05:00', 'Transferência Bancária');

-- 10. Mais Fornecedores
INSERT INTO Fornecedores (nome, contato, cnpj) VALUES
('GigaByte Tech', 'vendas@gigabyte.com', '66.777.888/0001-99'),
('SportMania LTDA', 'contato@sportmania.com', '77.888.999/0001-00'),
('Mundo Divertido Brinquedos', 'brinquedos@mundodivertido.com', '88.999.000/0001-11'),
('Lar & Conforto', 'sac@larconforto.com', '99.000.111/0001-22');

-- 11. Mais Produtos_Fornecedor
INSERT INTO Produtos_Fornecedor (id_produto, id_fornecedor) VALUES
(13, 6), -- Notebook Gamer da GigaByte Tech
(14, 7), -- Tênis de Corrida da SportMania
(15, 8), -- Boneca Encantada da Mundo Divertido
(16, 8), -- LEGO Cidade da Mundo Divertido
(17, 9), -- Panela Antiaderente da Lar & Conforto
(18, 3), -- Chocolate Belga da Gourmet Foods BR (fornecedor existente)
(19, 4), -- Livro de Receitas da Editora Sabedoria (fornecedor existente)
(20, 5), -- Parafusadeira Elétrica da Ferramentas Premium (fornecedor existente)
(12, 9), -- Almofada Geométrica da Lar & Conforto (fornecedor novo)
(1, 6); -- Smartphone X (Produto 1) também fornecido pela GigaByte Tech (Fornecedor 6)