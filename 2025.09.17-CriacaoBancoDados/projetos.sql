-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18/09/2025 às 02:41
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
-- Banco de dados: `projetos`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cad_departamento`
--

CREATE TABLE `cad_departamento` (
  `ID_DEPARTAMENTO` int(11) NOT NULL,
  `DEPART_NOME` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `cad_departamento`
--

INSERT INTO `cad_departamento` (`ID_DEPARTAMENTO`, `DEPART_NOME`) VALUES
(1, 'Centro Cirúrgico'),
(2, 'Centro de Materiais e Esterilização'),
(3, 'Sala de Recuperação Pós-Anestésica');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cad_instrumento`
--

CREATE TABLE `cad_instrumento` (
  `ID_INSTRUMENTO` int(11) NOT NULL,
  `INST_NOME` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `cad_instrumento`
--

INSERT INTO `cad_instrumento` (`ID_INSTRUMENTO`, `INST_NOME`) VALUES
(1, 'Bisturis'),
(2, 'Tesouras'),
(3, 'Pinças');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cad_supervisor`
--

CREATE TABLE `cad_supervisor` (
  `ID_SUPERVISOR` int(11) NOT NULL,
  `DEPART_NOME` varchar(100) DEFAULT NULL,
  `ID_USUARIO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `cad_supervisor`
--

INSERT INTO `cad_supervisor` (`ID_SUPERVISOR`, `DEPART_NOME`, `ID_USUARIO`) VALUES
(4, 'cirurgião-chefe', NULL),
(5, 'coordenador cirúrgico', NULL),
(6, 'Supervisor de Programa', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cad_usuario`
--

CREATE TABLE `cad_usuario` (
  `ID_USUARIO` int(11) NOT NULL,
  `USU_NOME` varchar(100) DEFAULT NULL,
  `ID_SUPERVISOR` int(11) DEFAULT NULL,
  `ID_DEPARTAMENTO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `cad_usuario`
--

INSERT INTO `cad_usuario` (`ID_USUARIO`, `USU_NOME`, `ID_SUPERVISOR`, `ID_DEPARTAMENTO`) VALUES
(4, 'Emerson de Carvalho', 4, 1),
(5, 'Eduardo Fernander', 5, 2),
(6, 'Kadu Fernandes', 6, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cad_veiculo`
--

CREATE TABLE `cad_veiculo` (
  `ID_VEICULO` int(11) NOT NULL,
  `VEIC_NOME` varchar(50) DEFAULT NULL,
  `ID_USUARIO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `cad_veiculo`
--

INSERT INTO `cad_veiculo` (`ID_VEICULO`, `VEIC_NOME`, `ID_USUARIO`) VALUES
(1, 'Ambulância', 4),
(2, 'Carro', 5),
(3, 'Van', 6);

-- --------------------------------------------------------

--
-- Estrutura para tabela `mov_projetos`
--

CREATE TABLE `mov_projetos` (
  `ID_PROJETO` int(11) NOT NULL,
  `PROJETO_NOME` varchar(80) DEFAULT NULL,
  `ID_INSTRUMENTO` int(11) DEFAULT NULL,
  `ID_USUARIO` int(11) DEFAULT NULL,
  `ID_VEICULO` int(11) DEFAULT NULL,
  `ID_DEPARTAMENTO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `mov_projetos`
--

INSERT INTO `mov_projetos` (`ID_PROJETO`, `PROJETO_NOME`, `ID_INSTRUMENTO`, `ID_USUARIO`, `ID_VEICULO`, `ID_DEPARTAMENTO`) VALUES
(1, 'Cirurgia Neurológica', 1, 4, 1, 1),
(2, 'Cirurgia Cardíaca', 2, 5, 2, 2),
(3, 'Cirurgia Ortopédica', 3, 6, 3, 3);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cad_departamento`
--
ALTER TABLE `cad_departamento`
  ADD PRIMARY KEY (`ID_DEPARTAMENTO`);

--
-- Índices de tabela `cad_instrumento`
--
ALTER TABLE `cad_instrumento`
  ADD PRIMARY KEY (`ID_INSTRUMENTO`);

--
-- Índices de tabela `cad_supervisor`
--
ALTER TABLE `cad_supervisor`
  ADD PRIMARY KEY (`ID_SUPERVISOR`),
  ADD KEY `FK_SUPERVISOR_USUARIO` (`ID_USUARIO`);

--
-- Índices de tabela `cad_usuario`
--
ALTER TABLE `cad_usuario`
  ADD PRIMARY KEY (`ID_USUARIO`),
  ADD KEY `FK_USUARIO_SUPERVISOR` (`ID_SUPERVISOR`),
  ADD KEY `FK_USUARIO_DEPARTEMENTO` (`ID_DEPARTAMENTO`);

--
-- Índices de tabela `cad_veiculo`
--
ALTER TABLE `cad_veiculo`
  ADD PRIMARY KEY (`ID_VEICULO`),
  ADD KEY `FK_VEICULO_USUARIO` (`ID_USUARIO`);

--
-- Índices de tabela `mov_projetos`
--
ALTER TABLE `mov_projetos`
  ADD PRIMARY KEY (`ID_PROJETO`),
  ADD KEY `FK_PROJETOS_INSTRUMENTO` (`ID_INSTRUMENTO`),
  ADD KEY `FK_PROJETOS_USUARIO` (`ID_USUARIO`),
  ADD KEY `FK_PROJETOS_VEICULO` (`ID_VEICULO`),
  ADD KEY `FK_PROJETOS_DEPARTAMENTO` (`ID_DEPARTAMENTO`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cad_departamento`
--
ALTER TABLE `cad_departamento`
  MODIFY `ID_DEPARTAMENTO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `cad_instrumento`
--
ALTER TABLE `cad_instrumento`
  MODIFY `ID_INSTRUMENTO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `cad_supervisor`
--
ALTER TABLE `cad_supervisor`
  MODIFY `ID_SUPERVISOR` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `cad_usuario`
--
ALTER TABLE `cad_usuario`
  MODIFY `ID_USUARIO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `cad_veiculo`
--
ALTER TABLE `cad_veiculo`
  MODIFY `ID_VEICULO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `mov_projetos`
--
ALTER TABLE `mov_projetos`
  MODIFY `ID_PROJETO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `cad_supervisor`
--
ALTER TABLE `cad_supervisor`
  ADD CONSTRAINT `FK_SUPERVISOR_USUARIO` FOREIGN KEY (`ID_USUARIO`) REFERENCES `cad_usuario` (`ID_USUARIO`);

--
-- Restrições para tabelas `cad_usuario`
--
ALTER TABLE `cad_usuario`
  ADD CONSTRAINT `FK_USUARIO_DEPARTEMENTO` FOREIGN KEY (`ID_DEPARTAMENTO`) REFERENCES `cad_departamento` (`ID_DEPARTAMENTO`),
  ADD CONSTRAINT `FK_USUARIO_SUPERVISOR` FOREIGN KEY (`ID_SUPERVISOR`) REFERENCES `cad_supervisor` (`ID_SUPERVISOR`);

--
-- Restrições para tabelas `cad_veiculo`
--
ALTER TABLE `cad_veiculo`
  ADD CONSTRAINT `FK_VEICULO_USUARIO` FOREIGN KEY (`ID_USUARIO`) REFERENCES `cad_usuario` (`ID_USUARIO`);

--
-- Restrições para tabelas `mov_projetos`
--
ALTER TABLE `mov_projetos`
  ADD CONSTRAINT `FK_PROJETOS_DEPARTAMENTO` FOREIGN KEY (`ID_DEPARTAMENTO`) REFERENCES `cad_departamento` (`ID_DEPARTAMENTO`),
  ADD CONSTRAINT `FK_PROJETOS_INSTRUMENTO` FOREIGN KEY (`ID_INSTRUMENTO`) REFERENCES `cad_instrumento` (`ID_INSTRUMENTO`),
  ADD CONSTRAINT `FK_PROJETOS_USUARIO` FOREIGN KEY (`ID_USUARIO`) REFERENCES `cad_usuario` (`ID_USUARIO`),
  ADD CONSTRAINT `FK_PROJETOS_VEICULO` FOREIGN KEY (`ID_VEICULO`) REFERENCES `cad_veiculo` (`ID_VEICULO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
