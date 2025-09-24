-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15/08/2025 às 00:11
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

-- O PHPAdmin coloca automaticamente o SQL_MODE em 
-- 'NO_AUTO_VALUE_ON_ZERO'

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `loja`
--
CREATE DATABASE loja -- Cria o Banco de Dados 'loja'
USE loja -- Define que o banco de dados a ser usado e loja

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `ID_Cliente` int(11) NOT NULL,
  `Nome_Cliente` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;  -- Mecanismo de armazrenamento de dados do phpmyadmin

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`ID_Cliente`, `Nome_Cliente`) VALUES
(1, 'João da Silva'),
(2, 'Maria Souza'),
(3, 'Ana Lima'),
(4, 'Gabriel');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `ID_Pedido` int(11) NOT NULL,
  `ID_Cliente` int(11) DEFAULT NULL,
  `ID_Vendedor` int(11) DEFAULT NULL,
  `Quantidade` int(11) NOT NULL,
  `ID_Produto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pedidos`
--

INSERT INTO `pedidos` (`ID_Pedido`, `ID_Cliente`, `ID_Vendedor`, `Quantidade`, `ID_Produto`) VALUES
(1, 1, 1, 3, 2),
(2, 3, 2, 4, 1),
(3, 4, 1, 8, 5),
(4, 2, 1, 7, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `ID_Produto` int(11) NOT NULL,
  `Nome_Produto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`ID_Produto`, `Nome_Produto`) VALUES
(1, 'Camiseta'),
(2, 'Tênis'),
(3, 'Mochila'),
(4, 'Calça Jeans'),
(5, 'Boné');

-- --------------------------------------------------------

--
-- Estrutura para tabela `vendedores`
--

CREATE TABLE `vendedores` (
  `ID_Vendedor` int(11) NOT NULL,
  `Nome_Vendedor` varchar(255) NOT NULL,
  `CPF` varchar(14) NOT NULL,
  `Loja` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `vendedores`
--

INSERT INTO `vendedores` (`ID_Vendedor`, `Nome_Vendedor`, `CPF`, `Loja`) VALUES
(1, 'Carla M.', '123.456.789-00', 'Loja São Paulo'),
(2, 'Pedro N.', '987.654.321-00', 'Loja Rio');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ID_Cliente`);

--
-- Índices de tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`ID_Pedido`),
  ADD KEY `ID_Cliente` (`ID_Cliente`),
  ADD KEY `ID_Vendedor` (`ID_Vendedor`),
  ADD KEY `ID_Produto` (`ID_Produto`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`ID_Produto`);

--
-- Índices de tabela `vendedores`
--
ALTER TABLE `vendedores`
  ADD PRIMARY KEY (`ID_Vendedor`),
  ADD UNIQUE KEY `CPF` (`CPF`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `ID_Cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `ID_Pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `ID_Produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `vendedores`
--
ALTER TABLE `vendedores`
  MODIFY `ID_Vendedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `clientes` (`ID_Cliente`),
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`ID_Vendedor`) REFERENCES `vendedores` (`ID_Vendedor`),
  ADD CONSTRAINT `pedidos_ibfk_3` FOREIGN KEY (`ID_Produto`) REFERENCES `produtos` (`ID_Produto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
