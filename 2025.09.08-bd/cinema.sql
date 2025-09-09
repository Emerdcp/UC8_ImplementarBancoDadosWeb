-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09/09/2025 às 03:11
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
-- Banco de dados: `cinema`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `t_filmes`
--

CREATE TABLE `t_filmes` (
  `ID_FILME` int(11) NOT NULL,
  `TITULO` varchar(150) DEFAULT NULL,
  `DIRETOR` varchar(100) DEFAULT NULL,
  `GENERO` varchar(50) DEFAULT NULL,
  `DURACAO` float DEFAULT NULL,
  `CLASSIFICACAO` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `t_filmes`
--

INSERT INTO `t_filmes` (`ID_FILME`, `TITULO`, `DIRETOR`, `GENERO`, `DURACAO`, `CLASSIFICACAO`) VALUES
(1, 'Harry Potter e as Relíquias da Morte – Parte 1', 'David Yates', 'Drama/Aventura/Ação/Fantasia', 146, 'PG-13'),
(2, 'Harry Potter e a Ordem da Fênix', 'David Yates', 'Drama/Aventura/Ação/Fantasia', 138, 'PG-13'),
(3, 'Harry Potter e o Cálice de Fogo', 'Mike Newell', 'Fantasia', 156, 'PG-13');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `t_filmes`
--
ALTER TABLE `t_filmes`
  ADD PRIMARY KEY (`ID_FILME`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `t_filmes`
--
ALTER TABLE `t_filmes`
  MODIFY `ID_FILME` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
