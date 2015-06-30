-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 06-Dez-2014 às 23:28
-- Versão do servidor: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `scp`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `aluno`
--

CREATE TABLE IF NOT EXISTS `aluno` (
  `idAluno` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(128) NOT NULL,
  `identidade` varchar(128) DEFAULT NULL,
  `data_emissao_id` varchar(10) DEFAULT NULL,
  `data_expedicao_id` varchar(10) DEFAULT NULL,
  `orgao_expedidor` varchar(128) DEFAULT NULL,
  `cpf` varchar(128) NOT NULL,
  `nascimento` varchar(10) DEFAULT NULL,
  `matricula` varchar(45) NOT NULL,
  `naturalidade` varchar(20) DEFAULT NULL,
  `nacionalidade` varchar(20) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `cep` varchar(8) DEFAULT NULL,
  `rua` varchar(30) DEFAULT NULL,
  `numero` varchar(128) DEFAULT NULL,
  `complemento` varchar(30) DEFAULT NULL,
  `bairro` varchar(30) DEFAULT NULL,
  `telefoneResidencial` varchar(10) DEFAULT NULL,
  `celular` varchar(10) DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL,
  `situacaoMilitar` varchar(30) DEFAULT NULL,
  `certidaoMilitar` varchar(30) DEFAULT NULL,
  `localTrabalho` varchar(50) DEFAULT NULL,
  `telefoneTrabalho` varchar(12) DEFAULT NULL,
  `banco` varchar(30) DEFAULT NULL,
  `agencia` varchar(10) DEFAULT NULL,
  `contaCorrente` varchar(10) DEFAULT NULL,
  `idCurso` int(11) NOT NULL,
  `idProjeto` int(11) NOT NULL DEFAULT '0',
  `secaoEleitoral` varchar(45) DEFAULT NULL,
  `tituloEleitor` varchar(128) DEFAULT NULL,
  `zonaEleitoral` varchar(45) DEFAULT NULL,
  `pai` int(11) NOT NULL DEFAULT '0',
  `mae` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idAluno`,`idCurso`,`idProjeto`,`pai`,`mae`),
  UNIQUE KEY `matricula_UNIQUE` (`matricula`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_Aluno_Curso1_idx` (`idCurso`),
  KEY `fk_Aluno_Pessoa2_idx` (`pai`),
  KEY `fk_Aluno_Pessoa3_idx` (`mae`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `aluno`
--

INSERT INTO `aluno` (`idAluno`, `nome`, `identidade`, `data_emissao_id`, `data_expedicao_id`, `orgao_expedidor`, `cpf`, `nascimento`, `matricula`, `naturalidade`, `nacionalidade`, `estado`, `cidade`, `cep`, `rua`, `numero`, `complemento`, `bairro`, `telefoneResidencial`, `celular`, `email`, `situacaoMilitar`, `certidaoMilitar`, `localTrabalho`, `telefoneTrabalho`, `banco`, `agencia`, `contaCorrente`, `idCurso`, `idProjeto`, `secaoEleitoral`, `tituloEleitor`, `zonaEleitoral`, `pai`, `mae`) VALUES
(1, 'OCTAVIO M MOREIRA', NULL, NULL, NULL, NULL, '516546541', NULL, '32465416847', '654635132', '654651651', 'mg', '65143213', '65541321', '561321', '3132132', '32132132', '15146', NULL, NULL, NULL, '56165165465', '46541654', '65465465', '65165', '465416514', '65416541', '65146514', 2, 0, 'null', 'null', 'null', 0, 0),
(2, 'Tiaozim', 'h3uh3uu3huh3hu3', NULL, NULL, NULL, '09339709608', '22/08/1997', '140061', 'Mineiro', 'Brasileiro', 'mg', 'Juiz de Fora', '36140000', 'Fonseca hermes', '134', '302', 'Centro', '32811130', '88366906', 'oc.ld@bol.com', 'Dispensado', '111111111', 'Institito Federal', '9999999999', 'Brasil', '123', '123456789', 1, 0, 'null', NULL, 'null', 0, 0);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `aluno`
--
ALTER TABLE `aluno`
  ADD CONSTRAINT `fk_Aluno_Curso1` FOREIGN KEY (`idCurso`) REFERENCES `curso` (`idCurso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
