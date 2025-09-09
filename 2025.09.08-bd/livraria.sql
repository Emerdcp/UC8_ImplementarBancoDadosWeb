-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09/09/2025 às 03:13
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `livraria`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `t_livro`
--

CREATE TABLE `t_livro` (
  `ID_LIVRO` int(11) NOT NULL,
  `TITULO` varchar(150) DEFAULT NULL,
  `AUTOR` varchar(100) DEFAULT NULL,
  `GENERO` varchar(50) DEFAULT NULL,
  `PRECO` float DEFAULT NULL,
  `ANO_PUBLICACAO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `t_livro`
--

INSERT INTO `t_livro` (`ID_LIVRO`, `TITULO`, `AUTOR`, `GENERO`, `PRECO`, `ANO_PUBLICACAO`) VALUES
(1, 'Harry Potter E As Relíquias Da Morte', 'J. K. Rowling', 'Romance de fantasia', 59.9, 2010),
(2, 'Harry Potter E A Ordem Da Fênix', 'J. K. Rowling', 'Romance de fantasia', 39.9, 2007),
(3, 'Harry Potter E O Cálice De Fogo', 'J. K. Rowling', 'Romance de fantasia', 29.9, 2005);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `t_livro`
--
ALTER TABLE `t_livro`
  ADD PRIMARY KEY (`ID_LIVRO`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `t_livro`
--
ALTER TABLE `t_livro`
  MODIFY `ID_LIVRO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
