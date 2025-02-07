-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Ejercicio 7
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ejercicio 7
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ejercicio 7` DEFAULT CHARACTER SET utf8 ;
USE `Ejercicio 7` ;

-- -----------------------------------------------------
-- Table `Ejercicio 7`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio 7`.`Empleado` (
  `idEmpleado` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Direccion` VARCHAR(45) NULL,
  `Fecha_Nacimiento` DATE NOT NULL,
  `Edad` INT NOT NULL,
  PRIMARY KEY (`idEmpleado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio 7`.`Tiquet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio 7`.`Tiquet` (
  `idTiquet` INT NOT NULL,
  `Numero_Factura` VARCHAR(9) NOT NULL,
  `Empleados_idEmpleados` INT NOT NULL,
  `Fecha` DATE NOT NULL,
  `Hora` TIME NOT NULL,
  `Total` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`idTiquet`),
  INDEX `fk_Tiquet_Empleados_idx` (`Empleados_idEmpleados` ASC) VISIBLE,
  CONSTRAINT `fk_Tiquet_Empleados`
    FOREIGN KEY (`Empleados_idEmpleados`)
    REFERENCES `Ejercicio 7`.`Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio 7`.`Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio 7`.`Producto` (
  `idProducto` INT NOT NULL,
  `Descripcion` VARCHAR(45) NOT NULL,
  `Codigo_de_barras` INT NOT NULL,
  `Precio_Unitario` DECIMAL(10,2) NOT NULL,
  `Porcentaje_IVA` INT NOT NULL,
  `Precio_Final` INT NOT NULL,
  PRIMARY KEY (`idProducto`, `Descripcion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ejercicio 7`.`Linea_Tiquet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ejercicio 7`.`Linea_Tiquet` (
  `idLinea_Tiquet` INT NOT NULL,
  `Tiquet_idTiquet` INT NOT NULL,
  `Producto_idProducto` INT NOT NULL,
  `Producto_Descripcion` VARCHAR(45) NOT NULL,
  `Unidades` INT NOT NULL,
  `Porcentaje_Descuento` INT NOT NULL,
  `Total` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`idLinea_Tiquet`),
  INDEX `fk_Linea_Tiquet_Tiquet1_idx` (`Tiquet_idTiquet` ASC) VISIBLE,
  INDEX `fk_Linea_Tiquet_Producto1_idx` (`Producto_idProducto` ASC, `Producto_Descripcion` ASC) VISIBLE,
  CONSTRAINT `fk_Linea_Tiquet_Tiquet1`
    FOREIGN KEY (`Tiquet_idTiquet`)
    REFERENCES `Ejercicio 7`.`Tiquet` (`idTiquet`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Linea_Tiquet_Producto1`
    FOREIGN KEY (`Producto_idProducto` , `Producto_Descripcion`)
    REFERENCES `Ejercicio 7`.`Producto` (`idProducto` , `Descripcion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
