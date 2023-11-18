-- MySQL Script generated by MySQL Workbench
-- Sat Nov 18 01:08:52 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema fred
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema fred
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `fred` DEFAULT CHARACTER SET latin1 ;
USE `fred` ;

-- -----------------------------------------------------
-- Table `fred`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fred`.`clientes` (
  `idclientes` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cnpj` VARCHAR(14) NULL DEFAULT NULL,
  `cnpj_raiz` VARCHAR(8) NULL DEFAULT NULL,
  `filial_numero` INT(11) NULL DEFAULT NULL,
  `razao_social` VARCHAR(100) NULL DEFAULT NULL,
  `nome_fantasia` VARCHAR(100) NULL DEFAULT NULL,
  `data_abertura` VARCHAR(45) NULL DEFAULT NULL,
  `situacao_cadastral` VARCHAR(25) NULL DEFAULT NULL,
  `logradouro` VARCHAR(100) NULL DEFAULT NULL,
  `numero` VARCHAR(5) NULL DEFAULT NULL,
  `bairro` VARCHAR(100) NULL DEFAULT NULL,
  `municipio` VARCHAR(100) NULL DEFAULT NULL,
  `uf` VARCHAR(2) NULL DEFAULT NULL,
  `codigo` VARCHAR(45) NULL DEFAULT NULL,
  `descricao` VARCHAR(100) NULL DEFAULT NULL,
  `cnpj_mei` VARCHAR(1) NULL DEFAULT NULL,
  `versao` VARCHAR(2) NULL DEFAULT NULL,
  PRIMARY KEY (`idclientes`))
ENGINE = InnoDB
AUTO_INCREMENT = 61
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
