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
-- Table `mydb`.`Gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Gene` (
  `idGene` INT NOT NULL,
  `gene_name` VARCHAR(45) NULL,
  `gene_start` INT NULL,
  `gene_end` INT NULL,
  `chromosome` INT NULL,
  `gene_description` TEXT(100) NULL,
  PRIMARY KEY (`idGene`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Syndrome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Syndrome` (
  `idSyndrome` INT NOT NULL,
  `Description` TEXT(100) NULL,
  PRIMARY KEY (`idSyndrome`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patient` (
  `idPatient` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `gender` ENUM("M", "F") NULL,
  PRIMARY KEY (`idPatient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Syndrome_has_Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Syndrome_has_Patient` (
  `Syndrome_idSyndrome` INT NOT NULL,
  `Patient_idPatient` INT NOT NULL,
  PRIMARY KEY (`Syndrome_idSyndrome`, `Patient_idPatient`),
  INDEX `fk_Syndrome_has_Patient_Patient1_idx` (`Patient_idPatient` ASC) VISIBLE,
  INDEX `fk_Syndrome_has_Patient_Syndrome_idx` (`Syndrome_idSyndrome` ASC) VISIBLE,
  CONSTRAINT `fk_Syndrome_has_Patient_Syndrome`
    FOREIGN KEY (`Syndrome_idSyndrome`)
    REFERENCES `mydb`.`Syndrome` (`idSyndrome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Syndrome_has_Patient_Patient1`
    FOREIGN KEY (`Patient_idPatient`)
    REFERENCES `mydb`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Syndrome_has_Gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Syndrome_has_Gene` (
  `Syndrome_idSyndrome` INT NOT NULL,
  `Gene_idGene` INT NOT NULL,
  PRIMARY KEY (`Syndrome_idSyndrome`, `Gene_idGene`),
  INDEX `fk_Syndrome_has_Gene_Gene1_idx` (`Gene_idGene` ASC) VISIBLE,
  INDEX `fk_Syndrome_has_Gene_Syndrome1_idx` (`Syndrome_idSyndrome` ASC) VISIBLE,
  CONSTRAINT `fk_Syndrome_has_Gene_Syndrome1`
    FOREIGN KEY (`Syndrome_idSyndrome`)
    REFERENCES `mydb`.`Syndrome` (`idSyndrome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Syndrome_has_Gene_Gene1`
    FOREIGN KEY (`Gene_idGene`)
    REFERENCES `mydb`.`Gene` (`idGene`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
