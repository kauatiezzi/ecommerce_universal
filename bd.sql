-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30/05/2025 às 04:36
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ecommerce_uniara`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `carrinho`
--

CREATE TABLE `carrinho` (
  `id_carrinho` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `data_criacao` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `carrinho`
--

INSERT INTO `carrinho` (`id_carrinho`, `id_cliente`, `data_criacao`) VALUES
(1, 1, '2025-05-28 13:08:23'),
(2, 3, '2025-05-28 13:08:23'),
(3, 5, '2025-05-28 13:08:23'),
(4, 11, '2025-05-28 14:02:48'),
(5, 12, '2025-05-28 14:02:48'),
(6, 13, '2025-05-28 14:02:48');

-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nome_categoria` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nome_categoria`, `descricao`) VALUES
(1, 'Eletrônicos', 'Dispositivos eletrônicos em geral.'),
(2, 'Roupas', 'Vestuário masculino, feminino e infantil.'),
(3, 'Alimentos', 'Produtos alimentícios e bebidas.'),
(4, 'Livros', 'Livros de diversos gêneros.'),
(5, 'Ferramentas', 'Ferramentas manuais e elétricas.'),
(6, 'Decoração', 'Itens para decoração de casa.'),
(7, 'Esportes', 'Artigos esportivos e vestuário para prática de exercícios.'),
(8, 'Brinquedos', 'Brinquedos para todas as idades.'),
(9, 'Casa e Jardim', 'Itens para casa, cozinha e jardinagem.');

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nome_completo` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `data_cadastro` datetime DEFAULT current_timestamp(),
  `ultima_compra` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nome_completo`, `email`, `senha`, `telefone`, `data_nascimento`, `data_cadastro`, `ultima_compra`) VALUES
(1, 'João Silva', 'joao.silva@email.com', 'senha123', '11987654321', '1990-05-15', '2023-01-10 10:00:00', '2024-04-20 14:30:00'),
(2, 'Maria Oliveira', 'maria.oliver@email.com', 'senha456', '21912345678', '1988-11-22', '2023-02-20 11:15:00', '2024-05-10 09:00:00'),
(3, 'Carlos Pereira', 'carlos.p@email.com', 'senha789', '31998761234', '1995-03-01', '2023-03-01 12:00:00', '2024-05-25 16:00:00'),
(4, 'Ana Souza', 'ana.souza@email.com', 'senhaabc', '41911223344', '1992-07-30', '2023-04-05 09:30:00', NULL),
(5, 'Pedro Rocha', 'pedro.r@email.com', 'senhaxyz', '51988776655', '1985-01-10', '2023-05-10 14:00:00', '2024-03-10 10:00:00'),
(6, 'Laura Santos', 'laura.s@email.com', 'senha111', '61999887766', '1998-09-03', '2023-06-12 17:00:00', '2024-05-20 11:30:00'),
(7, 'Fernando Costa', 'fernando.c@email.com', 'senha222', '71987651234', '1970-02-28', '2023-07-01 08:00:00', '2024-05-18 15:00:00'),
(8, 'Isabela Mendes', 'isabela.m@email.com', 'senha333', '81912348765', '1993-12-05', '2023-08-15 13:00:00', '2024-05-01 12:00:00'),
(9, 'Ricardo Almeida', 'ricardo.a@email.com', 'senha444', '91998765432', '1980-06-20', '2023-09-01 09:00:00', '2024-05-05 10:00:00'),
(10, 'Julia Lima', 'julia.l@email.com', 'senha555', '11911112222', '1997-04-18', '2023-10-01 16:00:00', '2024-05-15 13:00:00'),
(11, 'Mariana Ferreira', 'mariana.f@email.com', 'senha666', '11977665544', '1991-08-01', '2023-11-01 09:00:00', '2024-05-10 10:00:00'),
(12, 'Gabriel Nunes', 'gabriel.n@email.com', 'senha777', '11966554433', '1987-04-25', '2023-12-05 14:00:00', '2024-05-22 17:00:00'),
(13, 'Sofia Dias', 'sofia.d@email.com', 'senha888', '11955443322', '1999-01-12', '2024-01-15 11:00:00', '2024-05-28 08:00:00'),
(14, 'Lucas Barbosa', 'lucas.b@email.com', 'senha999', '11944332211', '1982-10-03', '2024-02-01 16:00:00', '2024-04-15 11:00:00'),
(15, 'Helena Godoy', 'helena.g@email.com', 'senha000', '11933221100', '1994-06-19', '2024-03-10 10:00:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `endereco`
--

CREATE TABLE `endereco` (
  `id_endereco` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `rua` varchar(255) NOT NULL,
  `numero` varchar(50) DEFAULT NULL,
  `cidade` varchar(100) NOT NULL,
  `estado` varchar(100) NOT NULL,
  `cep` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `endereco`
--

INSERT INTO `endereco` (`id_endereco`, `id_cliente`, `rua`, `numero`, `cidade`, `estado`, `cep`) VALUES
(1, 1, 'Rua das Flores', '100', 'São Paulo', 'SP', '01000-000'),
(2, 1, 'Av. Principal', '500', 'São Paulo', 'SP', '02000-000'),
(3, 2, 'Rua da Paz', '25', 'Rio de Janeiro', 'RJ', '20000-000'),
(4, 3, 'Rua do Sol', '300', 'Belo Horizonte', 'MG', '30000-000'),
(5, 4, 'Rua da Praia', '10', 'Florianópolis', 'SC', '88000-000'),
(6, 5, 'Rua das Árvores', '50', 'Porto Alegre', 'RS', '90000-000'),
(7, 6, 'Rua da Alegria', '123', 'Brasília', 'DF', '70000-000'),
(8, 7, 'Rua do Comércio', '456', 'Salvador', 'BA', '40000-000'),
(9, 8, 'Rua da Amizade', '789', 'Recife', 'PE', '50000-000'),
(10, 9, 'Rua da Montanha', '99', 'Curitiba', 'PR', '80000-000'),
(11, 10, 'Rua da Felicidade', '1', 'Fortaleza', 'CE', '60000-000'),
(12, 11, 'Rua da Tecnologia', '200', 'São Paulo', 'SP', '03000-000'),
(13, 12, 'Av. das Inovações', '75', 'Campinas', 'SP', '13000-000'),
(14, 13, 'Rua das Artes', '10', 'Curitiba', 'PR', '81000-000'),
(15, 14, 'Estrada Velha', '999', 'Ribeirão Preto', 'SP', '14000-000'),
(16, 15, 'Rua Nova', '50', 'Belo Horizonte', 'MG', '31000-000'),
(17, 1, 'Rua do Teste', '1', 'São Paulo', 'SP', '01000-001'),
(18, 2, 'Av. do Teste', '2', 'Rio de Janeiro', 'RJ', '20000-001');

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedores`
--

CREATE TABLE `fornecedores` (
  `id_fornecedor` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `contato` varchar(255) DEFAULT NULL,
  `cnpj` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `fornecedores`
--

INSERT INTO `fornecedores` (`id_fornecedor`, `nome`, `contato`, `cnpj`) VALUES
(1, 'Tech Eletronicos LTDA', 'contato@techeletronicos.com', '11.222.333/0001-44'),
(2, 'Moda Leve S.A.', 'vendas@modaleve.com', '22.333.444/0001-55'),
(3, 'Gourmet Foods BR', 'comercial@gourmetfoods.com.br', '33.444.555/0001-66'),
(4, 'Editora Sabedoria', 'editora@sabedoria.com', '44.555.666/0001-77'),
(5, 'Ferramentas Premium', 'suporte@ferramentaspremium.com', '55.666.777/0001-88'),
(6, 'GigaByte Tech', 'vendas@gigabyte.com', '66.777.888/0001-99'),
(7, 'SportMania LTDA', 'contato@sportmania.com', '77.888.999/0001-00'),
(8, 'Mundo Divertido Brinquedos', 'brinquedos@mundodivertido.com', '88.999.000/0001-11'),
(9, 'Lar & Conforto', 'sac@larconforto.com', '99.000.111/0001-22');

-- --------------------------------------------------------

--
-- Estrutura para tabela `itens_carrinho`
--

CREATE TABLE `itens_carrinho` (
  `id_item_carrinho` int(11) NOT NULL,
  `id_carrinho` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL
) ;

--
-- Despejando dados para a tabela `itens_carrinho`
--

INSERT INTO `itens_carrinho` (`id_item_carrinho`, `id_carrinho`, `id_produto`, `quantidade`) VALUES
(1, 1, 1, 1),
(2, 1, 3, 2),
(3, 2, 5, 3),
(4, 2, 9, 1),
(5, 3, 7, 1),
(6, 4, 13, 1),
(7, 4, 15, 2),
(8, 5, 14, 1),
(9, 5, 17, 1),
(10, 6, 12, 1),
(11, 6, 16, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `itens_pedidos`
--

CREATE TABLE `itens_pedidos` (
  `id_item_pedido` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL
) ;

--
-- Despejando dados para a tabela `itens_pedidos`
--

INSERT INTO `itens_pedidos` (`id_item_pedido`, `id_pedido`, `id_produto`, `quantidade`, `preco_unitario`) VALUES
(1, 1, 1, 1, 2500.00),
(2, 1, 3, 2, 59.90),
(3, 2, 5, 2, 18.50),
(4, 2, 4, 1, 120.00),
(5, 3, 2, 1, 350.00),
(6, 3, 6, 5, 7.00),
(7, 4, 8, 1, 45.00),
(8, 5, 10, 1, 65.00),
(9, 6, 11, 1, 90.00),
(10, 6, 12, 2, 45.00),
(11, 7, 9, 1, 280.00),
(12, 8, 13, 1, 4500.00),
(13, 8, 15, 1, 89.90),
(14, 9, 14, 2, 299.90),
(15, 10, 16, 1, 150.00),
(16, 10, 15, 1, 75.00),
(17, 11, 18, 3, 25.00),
(18, 11, 19, 1, 60.00),
(19, 12, 20, 1, 350.00),
(20, 12, 12, 1, 45.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagamentos`
--

CREATE TABLE `pagamentos` (
  `id_pagamento` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `valor_pago` decimal(10,2) NOT NULL,
  `data_pagamento` datetime DEFAULT current_timestamp(),
  `metodo_pagamento` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pagamentos`
--

INSERT INTO `pagamentos` (`id_pagamento`, `id_pedido`, `valor_pago`, `data_pagamento`, `metodo_pagamento`) VALUES
(1, 1, 2619.80, '2024-04-20 14:31:00', 'Cartão de Crédito'),
(2, 2, 157.00, '2024-05-10 09:01:00', 'PIX'),
(3, 3, 385.00, '2024-05-25 16:01:00', 'Boleto'),
(4, 4, 45.00, '2024-03-15 10:01:00', 'Cartão de Crédito'),
(5, 5, 65.00, '2024-03-10 10:01:00', 'PIX'),
(6, 6, 180.00, '2024-05-20 11:31:00', 'Cartão de Crédito'),
(7, 7, 280.00, '2024-05-18 15:01:00', 'Boleto'),
(8, 8, 4589.90, '2024-05-10 10:05:00', 'Cartão de Crédito'),
(9, 9, 599.80, '2024-05-22 17:05:00', 'PIX'),
(10, 10, 225.00, '2024-05-28 08:05:00', 'Boleto'),
(11, 11, 135.00, '2024-05-27 10:05:00', 'Cartão de Crédito'),
(12, 12, 395.00, '2024-05-20 14:05:00', 'Transferência Bancária');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_endereco` int(11) NOT NULL,
  `data_pedido` datetime DEFAULT current_timestamp(),
  `status` enum('Pendente','Processando','Enviado','Entregue','Cancelado') NOT NULL DEFAULT 'Pendente',
  `total_pedido` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `id_cliente`, `id_endereco`, `data_pedido`, `status`, `total_pedido`) VALUES
(1, 1, 1, '2024-04-20 14:30:00', 'Entregue', 2619.80),
(2, 2, 3, '2024-05-10 09:00:00', 'Entregue', 157.00),
(3, 3, 4, '2024-05-25 16:00:00', 'Processando', 385.00),
(4, 1, 2, '2024-03-15 10:00:00', 'Entregue', 45.00),
(5, 5, 5, '2024-03-10 10:00:00', 'Entregue', 65.00),
(6, 6, 6, '2024-05-20 11:30:00', 'Pendente', 180.00),
(7, 7, 7, '2024-05-18 15:00:00', 'Enviado', 280.00),
(8, 11, 11, '2024-05-10 10:00:00', 'Entregue', 4589.90),
(9, 12, 12, '2024-05-22 17:00:00', 'Entregue', 599.80),
(10, 13, 13, '2024-05-28 08:00:00', 'Pendente', 225.00),
(11, 1, 12, '2024-05-27 10:00:00', 'Processando', 135.00),
(12, 9, 9, '2024-05-20 14:00:00', 'Entregue', 395.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `id_produto` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descricao` text DEFAULT NULL,
  `preco` decimal(10,2) NOT NULL,
  `estoque` int(11) NOT NULL DEFAULT 0,
  `data_inclusao` datetime DEFAULT current_timestamp()
) ;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`id_produto`, `id_categoria`, `nome`, `descricao`, `preco`, `estoque`, `data_inclusao`) VALUES
(1, 1, 'Smartphone X', 'Celular de última geração com câmera 108MP.', 2500.00, 50, '2023-01-01 08:00:00'),
(2, 1, 'Fone de Ouvido Bluetooth', 'Fone sem fio com cancelamento de ruído.', 350.00, 120, '2023-01-05 09:00:00'),
(3, 2, 'Camiseta Algodão', 'Camiseta básica 100% algodão.', 59.90, 300, '2023-02-10 10:00:00'),
(4, 2, 'Calça Jeans Skinny', 'Calça jeans moderna e confortável.', 120.00, 150, '2023-02-15 11:00:00'),
(5, 3, 'Café Torrado e Moído', 'Café especial 250g.', 18.50, 500, '2023-03-01 12:00:00'),
(6, 3, 'Biscoito Integral', 'Biscoito saudável com grãos.', 7.00, 400, '2023-03-05 13:00:00'),
(7, 4, 'O Pequeno Príncipe', 'Livro clássico de Antoine de Saint-Exupéry.', 35.00, 80, '2023-04-01 14:00:00'),
(8, 4, 'A Arte da Guerra', 'Livro de Sun Tzu sobre estratégia.', 45.00, 60, '2023-04-05 15:00:00'),
(9, 5, 'Furadeira de Impacto', 'Furadeira potente para uso doméstico.', 280.00, 30, '2023-05-01 16:00:00'),
(10, 5, 'Jogo de Chaves Allen', 'Conjunto completo de chaves Allen.', 65.00, 100, '2023-05-05 17:00:00'),
(11, 6, 'Vaso Decorativo Cerâmica', 'Vaso elegante para sala.', 90.00, 70, '2023-06-01 09:00:00'),
(12, 6, 'Almofada Geométrica', 'Almofada com estampa moderna.', 45.00, 100, '2023-06-05 10:00:00'),
(13, 1, 'Notebook Gamer', 'Notebook potente para jogos e trabalho.', 4500.00, 20, '2023-07-01 10:00:00'),
(14, 2, 'Tênis de Corrida', 'Tênis leve e confortável para corrida.', 299.90, 80, '2023-08-05 11:00:00'),
(15, 7, 'Bola de Futebol', 'Bola oficial de futebol de campo.', 89.90, 150, '2023-09-01 12:00:00'),
(16, 8, 'LEGO Cidade', 'Conjunto de blocos de montar da série Cidade.', 150.00, 60, '2023-10-10 13:00:00'),
(17, 8, 'Boneca Encantada', 'Boneca com acessórios e sons.', 75.00, 100, '2023-10-15 14:00:00'),
(18, 9, 'Kit Ferramentas Jardim', 'Kit completo para jardinagem amadora.', 120.00, 40, '2023-11-01 15:00:00'),
(19, 9, 'Panela Antiaderente', 'Panela de alta qualidade com revestimento antiaderente.', 99.00, 100, '2023-11-10 16:00:00'),
(20, 3, 'Chocolate Belga 100g', 'Chocolate amargo importado.', 25.00, 200, '2024-01-20 09:00:00'),
(21, 4, 'Livro de Receitas', 'Livro com diversas receitas culinárias.', 60.00, 50, '2024-02-15 10:00:00'),
(22, 5, 'Parafusadeira Elétrica', 'Parafusadeira sem fio com bateria de lítio.', 350.00, 25, '2024-03-01 11:00:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos_fornecedor`
--

CREATE TABLE `produtos_fornecedor` (
  `id_produto` int(11) NOT NULL,
  `id_fornecedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos_fornecedor`
--

INSERT INTO `produtos_fornecedor` (`id_produto`, `id_fornecedor`) VALUES
(1, 1),
(1, 5),
(1, 6),
(2, 1),
(3, 2),
(4, 2),
(5, 3),
(6, 3),
(7, 4),
(8, 4),
(9, 5),
(10, 5),
(12, 9),
(13, 6),
(14, 7),
(15, 8),
(16, 8),
(17, 9),
(18, 3),
(19, 4),
(20, 5);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `carrinho`
--
ALTER TABLE `carrinho`
  ADD PRIMARY KEY (`id_carrinho`),
  ADD UNIQUE KEY `id_cliente` (`id_cliente`);

--
-- Índices de tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `nome_categoria` (`nome_categoria`);

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices de tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`id_endereco`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Índices de tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  ADD PRIMARY KEY (`id_fornecedor`),
  ADD UNIQUE KEY `cnpj` (`cnpj`);

--
-- Índices de tabela `itens_carrinho`
--
ALTER TABLE `itens_carrinho`
  ADD PRIMARY KEY (`id_item_carrinho`),
  ADD UNIQUE KEY `id_carrinho` (`id_carrinho`,`id_produto`),
  ADD KEY `id_produto` (`id_produto`);

--
-- Índices de tabela `itens_pedidos`
--
ALTER TABLE `itens_pedidos`
  ADD PRIMARY KEY (`id_item_pedido`),
  ADD UNIQUE KEY `id_pedido` (`id_pedido`,`id_produto`),
  ADD KEY `id_produto` (`id_produto`);

--
-- Índices de tabela `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD PRIMARY KEY (`id_pagamento`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Índices de tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_endereco` (`id_endereco`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id_produto`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Índices de tabela `produtos_fornecedor`
--
ALTER TABLE `produtos_fornecedor`
  ADD PRIMARY KEY (`id_produto`,`id_fornecedor`),
  ADD KEY `id_fornecedor` (`id_fornecedor`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `carrinho`
--
ALTER TABLE `carrinho`
  MODIFY `id_carrinho` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `id_endereco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  MODIFY `id_fornecedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `itens_carrinho`
--
ALTER TABLE `itens_carrinho`
  MODIFY `id_item_carrinho` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `itens_pedidos`
--
ALTER TABLE `itens_pedidos`
  MODIFY `id_item_pedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pagamentos`
--
ALTER TABLE `pagamentos`
  MODIFY `id_pagamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `carrinho`
--
ALTER TABLE `carrinho`
  ADD CONSTRAINT `carrinho_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`);

--
-- Restrições para tabelas `endereco`
--
ALTER TABLE `endereco`
  ADD CONSTRAINT `endereco_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`);

--
-- Restrições para tabelas `itens_carrinho`
--
ALTER TABLE `itens_carrinho`
  ADD CONSTRAINT `itens_carrinho_ibfk_1` FOREIGN KEY (`id_carrinho`) REFERENCES `carrinho` (`id_carrinho`),
  ADD CONSTRAINT `itens_carrinho_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`);

--
-- Restrições para tabelas `itens_pedidos`
--
ALTER TABLE `itens_pedidos`
  ADD CONSTRAINT `itens_pedidos_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  ADD CONSTRAINT `itens_pedidos_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`);

--
-- Restrições para tabelas `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD CONSTRAINT `pagamentos_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`);

--
-- Restrições para tabelas `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`id_endereco`) REFERENCES `endereco` (`id_endereco`);

--
-- Restrições para tabelas `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);

--
-- Restrições para tabelas `produtos_fornecedor`
--
ALTER TABLE `produtos_fornecedor`
  ADD CONSTRAINT `produtos_fornecedor_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`),
  ADD CONSTRAINT `produtos_fornecedor_ibfk_2` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedores` (`id_fornecedor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
