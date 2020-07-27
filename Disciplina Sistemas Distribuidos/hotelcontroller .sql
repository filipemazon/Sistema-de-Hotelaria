-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 20-Nov-2018 às 00:33
-- Versão do servidor: 8.0.11
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotelcontroller`
--
CREATE DATABASE IF NOT EXISTS `hotelcontroller` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `hotelcontroller`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `hotel`
--

DROP TABLE IF EXISTS `hotel`;
CREATE TABLE IF NOT EXISTS `hotel` (
  `local` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nT1` int(11) NOT NULL,
  `nT2` int(11) NOT NULL,
  `nT3` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `hotel`
--

INSERT INTO `hotel` VALUES
('São Francisco', 1, 100, 50, 20),
('Nova York', 2, 150, 80, 30),
('Toronto', 3, 200, 100, 50),
('Brasil', 4, 80, 50, 15);

-- --------------------------------------------------------

--
-- Estrutura da tabela `query`
--

DROP TABLE IF EXISTS `query`;
CREATE TABLE IF NOT EXISTS `query` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `string` varchar(900) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `query`
--

INSERT INTO `query` VALUES
(8, 'insert into usuario(nome,cpf,telefone,email,datanasc,tipo,senha) values (\'b\',\'123\',\'123\',\'b\',\'1999-10-10\',\'1\',\'123\')'),
(9, 'insert INTO usuario(nome,cpf,telefone,email,datanasc,tipo,senha) values (\'bb\',\'123\',\'123\',\'bb\',\'1999-10-10\',\'1\',\'123\')');

-- --------------------------------------------------------

--
-- Estrutura da tabela `reserva`
--

DROP TABLE IF EXISTS `reserva`;
CREATE TABLE IF NOT EXISTS `reserva` (
  `tipoQuarto` int(1) NOT NULL,
  `valor` double DEFAULT NULL,
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `numCriancas` int(11) NOT NULL,
  `numAdultos` int(11) NOT NULL,
  `dataEntrada` date NOT NULL,
  `dataSaida` date NOT NULL,
  `extras` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `idUsuario` int(255) NOT NULL,
  `idHotel` int(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reserva_ibfk_1` (`idHotel`),
  KEY `reserva_usuario_id` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `reserva`
--

INSERT INTO `reserva` VALUES
(1, 1800, 1, 2, 2, '2018-10-20', '2018-10-23', '', 1, 3),
(2, 5000, 2, 3, 1, '2019-01-01', '2019-01-04', '', 1, 2),
(3, 10000, 3, 1, 2, '2018-11-05', '2018-11-07', '', 5, 4),
(3, NULL, 4, 2, 2, '2018-12-12', '2018-12-20', '', 5, 2),
(1, NULL, 5, 3, 1, '2018-10-10', '2018-10-12', '', 5, 2),
(2, NULL, 6, 1, 3, '2018-10-20', '2018-10-22', '', 5, 3),
(2, NULL, 7, 2, 3, '2019-10-10', '2020-10-10', 'taxi as 8h', 5, 3),
(1, NULL, 8, 2, 2, '2018-10-24', '2018-10-26', '', 5, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(200) NOT NULL,
  `telefone` varchar(40) NOT NULL,
  `email` varchar(100) NOT NULL,
  `datanasc` date NOT NULL,
  `tipo` int(1) NOT NULL,
  `senha` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` VALUES
(1, 'Lorena Silveira Lopes', '114.583.866-38', '+55 31 993037616', 'lopesss.lorena@gmail.com', '1998-04-21', 1, '12345678'),
(2, 'Bruno Souza Ramos', '107.210.606-09', '+55 31 986572072', 'bsramos1996@gmail.com', '1996-04-24', 1, '12345678'),
(3, 'Wagson Silveira Lopes', '009.727.336-80', '+55 31 985269635', 'w@gmail.com', '1976-03-28', 2, '12345678'),
(4, 'Theo Rodrigues Lopes', '111.111.111-11', '+55 31 995628583', 't@gmail.com', '2016-09-10', 2, '12345678'),
(5, 'Fabiana Rodrigues ', '123.255.698-85', '+55 31 998569895', 'f@gmail.com', '1980-07-22', 1, '12345678'),
(6, 'Rhana Souza', '12345678', '12345678', 'r@gmail.com', '1999-11-22', 1, '12345678');

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`idHotel`) REFERENCES `hotel` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reserva_usuario_id` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
