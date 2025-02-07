-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Ejercicio 5
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ejercicio 5
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ejercicio 5` ;
USE `Ejercicio 5` ;

-- -----------------------------------------------------
-- Table `Ejercicio 5`.`Correo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio 5`.`Correo` (
  `Mail` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Mail`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio 5`.`Telefono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio 5`.`Telefono` (
  `Numero` INT NOT NULL,
  PRIMARY KEY (`Numero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio 5`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio 5`.`Cliente` (
  `Usuario` VARCHAR(45) NOT NULL,
  `Contraseña` VARCHAR(45) NOT NULL,
  `DNI` VARCHAR(9) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellidos` VARCHAR(45) NOT NULL,
  `Correo_Mail` VARCHAR(45) NOT NULL,
  `Dirección` VARCHAR(45) NULL,
  `Pueblo` VARCHAR(45) NULL,
  `Telefono_Numero` INT NOT NULL,
  INDEX `fk_Cliente_Correo_idx` (`Correo_Mail` ASC) VISIBLE,
  PRIMARY KEY (`Usuario`),
  UNIQUE INDEX `Usuario_UNIQUE` (`Usuario` ASC) VISIBLE,
  INDEX `fk_Cliente_Telefono1_idx` (`Telefono_Numero` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_Correo`
    FOREIGN KEY (`Correo_Mail`)
    REFERENCES `Ejercicio 5`.`Correo` (`Mail`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_Telefono1`
    FOREIGN KEY (`Telefono_Numero`)
    REFERENCES `Ejercicio 5`.`Telefono` (`Numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio 5`.`Vehiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio 5`.`Vehiculo` (
  `Numero_Matricula` INT NOT NULL,
  `Tipo_Vehiculo` VARCHAR(45) NOT NULL,
  `Marca` VARCHAR(45) NOT NULL,
  `Cliente_Usuario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Numero_Matricula`),
  INDEX `fk_Vehiculo_Cliente1_idx` (`Cliente_Usuario` ASC) VISIBLE,
  UNIQUE INDEX `Numero_Matricula_UNIQUE` (`Numero_Matricula` ASC) VISIBLE,
  CONSTRAINT `fk_Vehiculo_Cliente1`
    FOREIGN KEY (`Cliente_Usuario`)
    REFERENCES `Ejercicio 5`.`Cliente` (`Usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio 5`.`Cita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio 5`.`Cita` (
  `idCita` INT NOT NULL,
  `Dia` DATE NOT NULL,
  `Hora` TIME NOT NULL,
  `Cliente_Usuario` VARCHAR(45) NOT NULL,
  `Vehiculo_Numero_Matricula` INT NOT NULL,
  PRIMARY KEY (`idCita`),
  INDEX `fk_Cita_Cliente1_idx` (`Cliente_Usuario` ASC) VISIBLE,
  INDEX `fk_Cita_Vehiculo1_idx` (`Vehiculo_Numero_Matricula` ASC) VISIBLE,
  CONSTRAINT `fk_Cita_Cliente1`
    FOREIGN KEY (`Cliente_Usuario`)
    REFERENCES `Ejercicio 5`.`Cliente` (`Usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cita_Vehiculo1`
    FOREIGN KEY (`Vehiculo_Numero_Matricula`)
    REFERENCES `Ejercicio 5`.`Vehiculo` (`Numero_Matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
