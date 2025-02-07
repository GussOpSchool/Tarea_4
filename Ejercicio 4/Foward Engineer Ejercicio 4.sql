-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Ejercicio 4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ejercicio 4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ejercicio 4` ;
USE `Ejercicio 4` ;

-- -----------------------------------------------------
-- Table `Ejercicio 4`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio 4`.`Cliente` (
  `DNI` VARCHAR(9) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellidos` VARCHAR(45) NOT NULL,
  `Dirección` VARCHAR(45) NULL,
  `Teléfono` VARCHAR(10) NULL,
  `VIP` TINYINT NOT NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio 4`.`Vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio 4`.`Vendedor` (
  `idVendedor` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellidos` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idVendedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio 4`.`Tipo_Poliza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio 4`.`Tipo_Poliza` (
  `idTipo_Poliza` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipo_Poliza`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio 4`.`Poliza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio 4`.`Poliza` (
  `idPoliza` INT NOT NULL,
  `Precio_Anual` DECIMAL(10,2) NOT NULL,
  `Tipo_Pago` VARCHAR(45) NOT NULL,
  `Fecha_Contracto` DATE NOT NULL,
  `Fecha_Inicio` DATE NOT NULL,
  `Fecha_Fin` DATE NOT NULL,
  `Vendedor_idVendedor` INT NOT NULL,
  `Cliente_DNI` VARCHAR(9) NOT NULL,
  `Tipo_Poliza_idTipo_Poliza` INT NOT NULL,
  PRIMARY KEY (`idPoliza`),
  INDEX `fk_Poliza_Vendedor1_idx` (`Vendedor_idVendedor` ASC) VISIBLE,
  INDEX `fk_Poliza_Cliente1_idx` (`Cliente_DNI` ASC) VISIBLE,
  INDEX `fk_Poliza_Tipo_Poliza1_idx` (`Tipo_Poliza_idTipo_Poliza` ASC) VISIBLE,
  CONSTRAINT `fk_Poliza_Vendedor1`
    FOREIGN KEY (`Vendedor_idVendedor`)
    REFERENCES `Ejercicio 4`.`Vendedor` (`idVendedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Poliza_Cliente1`
    FOREIGN KEY (`Cliente_DNI`)
    REFERENCES `Ejercicio 4`.`Cliente` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Poliza_Tipo_Poliza1`
    FOREIGN KEY (`Tipo_Poliza_idTipo_Poliza`)
    REFERENCES `Ejercicio 4`.`Tipo_Poliza` (`idTipo_Poliza`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
