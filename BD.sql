-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema scp
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema scp
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `scp` DEFAULT CHARACTER SET latin1 ;
USE `scp` ;

-- -----------------------------------------------------
-- Table `scp`.`curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `scp`.`curso` (
  `idCurso` INT(11) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCurso`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `scp`.`diretoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `scp`.`diretoria` (
  `idDiretoria` INT(11) NOT NULL,
  `nome` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`idDiretoria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `scp`.`edital`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `scp`.`edital` (
  `idEdital` INT(11) NOT NULL,
  `idDiretoria` INT(11) NOT NULL,
  `numero` INT(128) NOT NULL,
  `inicio` INT(128) NOT NULL,
  `fim` INT(128) NOT NULL,
  `descricao` VARCHAR(1024) NOT NULL,
  PRIMARY KEY (`idEdital`),
  INDEX `fk_edital_diretoria_idx` (`idDiretoria` ASC),
  CONSTRAINT `fk_edital_diretoria`
    FOREIGN KEY (`idDiretoria`)
    REFERENCES `scp`.`diretoria` (`idDiretoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `scp`.`professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `scp`.`professor` (
  `idProfessor` INT(11) NOT NULL,
  `siape` VARCHAR(128) NOT NULL,
  `Nome` VARCHAR(128) NOT NULL,
  `CPF` VARCHAR(128) NOT NULL,
  `Data_Nascimento` VARCHAR(128) NOT NULL,
  `Nacionalide` VARCHAR(128) NOT NULL,
  `Email` VARCHAR(128) NOT NULL,
  `HomePage` VARCHAR(128) NOT NULL,
  `Campus` VARCHAR(128) NOT NULL,
  `Telefone_Residencial` VARCHAR(128) NOT NULL,
  `Celular` VARCHAR(128) NOT NULL,
  `Cidade` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`idProfessor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `scp`.`projeto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `scp`.`projeto` (
  `idProjeto` INT(11) NOT NULL,
  `idEdital` INT(11) NOT NULL,
  `idProfessor` INT(11) NOT NULL,
  `idAluno` INT(11) NOT NULL,
  `nome` VARCHAR(128) NOT NULL,
  `palavraChave` VARCHAR(128) NOT NULL,
  `areaConhecimento` VARCHAR(128) NOT NULL,
  `descricao` VARCHAR(1024) NOT NULL,
  `situacao` VARCHAR(1024) NOT NULL,
  `caracterizacaoProblema` VARCHAR(1024) NOT NULL,
  `referencialTeorico` VARCHAR(128) NOT NULL,
  `objetivos` VARCHAR(1024) NOT NULL,
  `metodologia` VARCHAR(128) NOT NULL,
  `resultadoEsperado` VARCHAR(1024) NOT NULL,
  `inicio` VARCHAR(128) NOT NULL,
  `fim` VARCHAR(128) NOT NULL,
  `orcamento` VARCHAR(1024) NOT NULL,
  `referenciasBibliograficas` VARCHAR(1024) NOT NULL,
  PRIMARY KEY (`idProjeto`),
  INDEX `fk_projeto_edital1_idx` (`idEdital` ASC),
  INDEX `fk_projeto_professor1_idx` (`idProfessor` ASC),
  INDEX `fk_projeto_aluno1_idx` (`idAluno` ASC),
  CONSTRAINT `fk_projeto_aluno1`
    FOREIGN KEY (`idAluno`)
    REFERENCES `scp`.`aluno` (`idAluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_projeto_edital1`
    FOREIGN KEY (`idEdital`)
    REFERENCES `scp`.`edital` (`idEdital`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_projeto_professor1`
    FOREIGN KEY (`idProfessor`)
    REFERENCES `scp`.`professor` (`idProfessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `scp`.`aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `scp`.`aluno` (
  `idAluno` INT(11) NOT NULL,
  `idCurso` INT(11) NULL DEFAULT NULL,
  `idProjeto` INT(11) NULL DEFAULT NULL,
  `nome` VARCHAR(128) NOT NULL,
  `identidade` VARCHAR(128) NOT NULL,
  `cpf` VARCHAR(128) NULL DEFAULT NULL,
  `nascimento` VARCHAR(128) NULL DEFAULT NULL,
  `matricula` VARCHAR(128) NULL DEFAULT NULL,
  `naturalidade` VARCHAR(128) NOT NULL,
  `nacionalidade` VARCHAR(128) NOT NULL,
  `estado` VARCHAR(128) NOT NULL,
  `cidade` VARCHAR(128) NOT NULL,
  `cep` VARCHAR(128) NOT NULL,
  `rua` VARCHAR(128) NOT NULL,
  `numero` VARCHAR(128) NOT NULL,
  `complemento` VARCHAR(128) NOT NULL,
  `bairro` VARCHAR(128) NOT NULL,
  `telefoneResidencial` VARCHAR(128) NOT NULL,
  `celular` VARCHAR(128) NOT NULL,
  `email` VARCHAR(128) NOT NULL,
  `situacaoMilitar` VARCHAR(128) NOT NULL,
  `certidaoMilitar` VARCHAR(128) NOT NULL,
  `localTrabalho` VARCHAR(128) NOT NULL,
  `telefoneTrabalho` VARCHAR(128) NOT NULL,
  `banco` VARCHAR(128) NOT NULL,
  `agencia` VARCHAR(128) NOT NULL,
  `contaCorrente` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`idAluno`),
  INDEX `fk_aluno_curso1_idx` (`idCurso` ASC),
  INDEX `fk_aluno_projeto1_idx` (`idProjeto` ASC),
  CONSTRAINT `fk_aluno_curso1`
    FOREIGN KEY (`idCurso`)
    REFERENCES `scp`.`curso` (`idCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_aluno_projeto1`
    FOREIGN KEY (`idProjeto`)
    REFERENCES `scp`.`projeto` (`idProjeto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `scp`.`area`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `scp`.`area` (
  `idArea` INT(11) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idArea`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
