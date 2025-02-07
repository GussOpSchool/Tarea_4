-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Ejercicio 6
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ejercicio 6
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ejercicio 6` DEFAULT CHARACTER SET utf8 ;
USE `Ejercicio 6` ;

-- -----------------------------------------------------
-- Table `Ejercicio 6`.`Avion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio 6`.`Avion` (
  `idVuelos` INT NOT NULL,
  `Modelo` VARCHAR(45) NOT NULL,
  `Capacidad` INT NOT NULL,
  PRIMARY KEY (`idVuelos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio 6`.`Vuelo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio 6`.`Vuelo` (
  `idVuelo` INT NOT NULL,
  `Avion_idVuelos` INT NOT NULL,
  `Origen` VARCHAR(45) NOT NULL,
  `Destino` VARCHAR(45) NOT NULL,
  `Fecha Salida` DATE NOT NULL,
  `Hora Salida` TIME NOT NULL,
  `Fecha Llegada` DATE NOT NULL,
  `Hora Llegada` TIME NOT NULL,
  PRIMARY KEY (`idVuelo`),
  INDEX `fk_Vuelo_Avion_idx` (`Avion_idVuelos` ASC) VISIBLE,
  CONSTRAINT `fk_Vuelo_Avion`
    FOREIGN KEY (`Avion_idVuelos`)
    REFERENCES `Ejercicio 6`.`Avion` (`idVuelos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio 6`.`Pasagero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio 6`.`Pasagero` (
  `DNI` VARCHAR(9) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellidos` VARCHAR(45) NOT NULL,
  `Telefono` INT(8) NULL,
  `Correo` VARCHAR(45) NULL,
  `Direccion` VARCHAR(45) NULL,
  PRIMARY KEY (`DNI`),
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio 6`.`Reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio 6`.`Reserva` (
  `idReserva` INT NOT NULL,
  `Pasagero_DNI` VARCHAR(9) NOT NULL,
  `Fecha` DATE NOT NULL,
  `Vuelo_idVuelo` INT NOT NULL,
  `Importe` DECIMAL(10,2) NULL,
  PRIMARY KEY (`idReserva`),
  INDEX `fk_Reserva_Pasagero1_idx` (`Pasagero_DNI` ASC) VISIBLE,
  INDEX `fk_Reserva_Vuelo1_idx` (`Vuelo_idVuelo` ASC) VISIBLE,
  CONSTRAINT `fk_Reserva_Pasagero1`
    FOREIGN KEY (`Pasagero_DNI`)
    REFERENCES `Ejercicio 6`.`Pasagero` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reserva_Vuelo1`
    FOREIGN KEY (`Vuelo_idVuelo`)
    REFERENCES `Ejercicio 6`.`Vuelo` (`idVuelo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
