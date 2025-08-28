-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 28/08/2025 às 03:09
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
-- Banco de dados: `cadastro`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `pessoa`
--

CREATE TABLE `pessoa` (
  `NOME` varchar(30) NOT NULL,
  `NASCIMENTO` date DEFAULT NULL,
  `SEXO` enum('M','F') DEFAULT NULL,
  `PESO` decimal(5,2) DEFAULT NULL,
  `ALTURA` decimal(3,2) DEFAULT NULL,
  `NACIONALIDADE` varchar(20) DEFAULT 'BRASIL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `pessoa`
--

INSERT INTO `pessoa` (`NOME`, `NASCIMENTO`, `SEXO`, `PESO`, `ALTURA`, `NACIONALIDADE`) VALUES
('Godofredo', '1984-01-02', 'M', 78.50, 1.83, 'Brasil'),
('Maria', '1999-12-30', 'F', 55.20, 1.65, 'Brasil'),
('Marinalva', '1965-04-11', 'F', 77.40, 1.71, 'Alemanha'),
('Endrik', '1995-03-11', 'M', 80.10, 1.77, 'Irlanda'),
('Ana Clara', '2005-04-07', 'F', 57.40, 1.61, 'México'),
('Robert', '1975-04-11', 'M', 75.20, 1.78, 'Brasil');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
