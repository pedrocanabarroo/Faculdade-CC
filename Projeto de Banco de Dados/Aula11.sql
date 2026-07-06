-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Atleta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Atleta` (
  `idAtleta` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAtleta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Modalidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Modalidade` (
  `idModalidade` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idModalidade`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`AtletaModalidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`AtletaModalidade` (
  `atleta` INT NOT NULL,
  `modalidade` INT NOT NULL,
  PRIMARY KEY (`atleta`, `modalidade`),
  INDEX `fk_Atleta_has_Modalidade_Modalidade1_idx` (`modalidade` ASC) VISIBLE,
  INDEX `fk_Atleta_has_Modalidade_Atleta_idx` (`atleta` ASC) VISIBLE,
  CONSTRAINT `fk_Atleta_has_Modalidade_Atleta`
    FOREIGN KEY (`atleta`)
    REFERENCES `mydb`.`Atleta` (`idAtleta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Atleta_has_Modalidade_Modalidade1`
    FOREIGN KEY (`modalidade`)
    REFERENCES `mydb`.`Modalidade` (`idModalidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Clube`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Clube` (
  `idClube` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idClube`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Treinador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Treinador` (
  `idTreinador` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `clube` INT NOT NULL,
  PRIMARY KEY (`idTreinador`),
  INDEX `fk_Treinador_Clube1_idx` (`clube` ASC) VISIBLE,
  CONSTRAINT `fk_Treinador_Clube1`
    FOREIGN KEY (`clube`)
    REFERENCES `mydb`.`Clube` (`idClube`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ModalidadeTreinador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ModalidadeTreinador` (
  `modalidade` INT NOT NULL,
  `treinador` INT NOT NULL,
  PRIMARY KEY (`modalidade`, `treinador`),
  INDEX `fk_Modalidade_has_Treinador_Treinador1_idx` (`treinador` ASC) VISIBLE,
  INDEX `fk_Modalidade_has_Treinador_Modalidade1_idx` (`modalidade` ASC) VISIBLE,
  CONSTRAINT `fk_Modalidade_has_Treinador_Modalidade1`
    FOREIGN KEY (`modalidade`)
    REFERENCES `mydb`.`Modalidade` (`idModalidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Modalidade_has_Treinador_Treinador1`
    FOREIGN KEY (`treinador`)
    REFERENCES `mydb`.`Treinador` (`idTreinador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ModalidadeClube`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ModalidadeClube` (
  `modalidade` INT NOT NULL,
  `clube` INT NOT NULL,
  PRIMARY KEY (`modalidade`, `clube`),
  INDEX `fk_Modalidade_has_Clube_Clube1_idx` (`clube` ASC) VISIBLE,
  INDEX `fk_Modalidade_has_Clube_Modalidade1_idx` (`modalidade` ASC) VISIBLE,
  CONSTRAINT `fk_Modalidade_has_Clube_Modalidade1`
    FOREIGN KEY (`modalidade`)
    REFERENCES `mydb`.`Modalidade` (`idModalidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Modalidade_has_Clube_Clube1`
    FOREIGN KEY (`clube`)
    REFERENCES `mydb`.`Clube` (`idClube`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
