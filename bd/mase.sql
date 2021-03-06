-- MySQL Script generated by MySQL Workbench
-- 04/21/22 15:01:55
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mase
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mase
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mase` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci ;
USE `mase` ;

-- -----------------------------------------------------
-- Table `mase`.`administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mase`.`administrador` (
  `idadministrador` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '',
  `cedula` BIGINT(10) NOT NULL COMMENT '',
  `nombre` VARCHAR(35) CHARACTER SET 'utf8' COLLATE 'utf8_spanish2_ci' NOT NULL COMMENT '',
  `apellido` VARCHAR(35) CHARACTER SET 'utf8' COLLATE 'utf8_spanish2_ci' NOT NULL COMMENT '',
  `tipouser` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish2_ci' NOT NULL DEFAULT 'admin' COMMENT '',
  `user` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish2_ci' NOT NULL COMMENT '',
  `pass` VARCHAR(60) CHARACTER SET 'utf8' COLLATE 'utf8_spanish2_ci' NOT NULL COMMENT '',
  PRIMARY KEY (`idadministrador`)  COMMENT '',
  UNIQUE INDEX `cedulaadministrador_UNIQUE` (`cedula` ASC)  COMMENT '',
  UNIQUE INDEX `useradministrador_UNIQUE` (`user` ASC)  COMMENT '')
ENGINE = InnoDB
AUTO_INCREMENT = 20
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish2_ci
ROW_FORMAT = COMPACT;


-- -----------------------------------------------------
-- Table `mase`.`aprendiz`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mase`.`aprendiz` (
  `idaprendiz` INT NOT NULL COMMENT '',
  `tipodoc` CHAR(2) CHARACTER SET 'utf8' COLLATE 'utf8_spanish2_ci' NOT NULL COMMENT '',
  `documento` INT(10) NOT NULL COMMENT '',
  `tipouser` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_spanish2_ci' NOT NULL DEFAULT 'aprendiz' COMMENT '',
  `user` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_spanish2_ci' NOT NULL COMMENT '',
  `pass` VARCHAR(60) CHARACTER SET 'utf8' COLLATE 'utf8_spanish2_ci' NOT NULL COMMENT '',
  PRIMARY KEY (`idaprendiz`)  COMMENT '')
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish2_ci;


-- -----------------------------------------------------
-- Table `mase`.`programa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mase`.`programa` (
  `idprograma` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `nombre` VARCHAR(60) NOT NULL COMMENT '',
  `tipo` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`idprograma`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mase`.`fichamat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mase`.`fichamat` (
  `idfichamat` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `programa_idprograma` INT NOT NULL COMMENT '',
  `aprendiz_idaprendiz` INT NOT NULL COMMENT '',
  `nombre` VARCHAR(45) NOT NULL COMMENT '',
  `apellido` VARCHAR(45) NOT NULL COMMENT '',
  `fecha` DATE NOT NULL COMMENT '',
  `lugarexpedoc` VARCHAR(45) NOT NULL COMMENT '',
  `fechaexpe` VARCHAR(45) NOT NULL COMMENT '',
  `fechanac` DATE NOT NULL COMMENT '',
  `lugarnac` VARCHAR(45) NOT NULL COMMENT '',
  `sexo` VARCHAR(1) NOT NULL COMMENT '',
  `libretamilitar` VARCHAR(45) NOT NULL COMMENT '',
  `tiposangre` VARCHAR(4) NOT NULL COMMENT '',
  `estadocivil` VARCHAR(10) NOT NULL COMMENT '',
  `eps` VARCHAR(2) NOT NULL COMMENT '',
  `nombreeps` VARCHAR(20) NOT NULL COMMENT '',
  `correo` VARCHAR(45) NOT NULL COMMENT '',
  `departamento` VARCHAR(45) NOT NULL COMMENT '',
  `municipio` VARCHAR(45) NOT NULL COMMENT '',
  `direccion` VARCHAR(45) NOT NULL COMMENT '',
  `barriovereda` VARCHAR(45) NOT NULL COMMENT '',
  `tiporesidencia` VARCHAR(45) NOT NULL COMMENT '',
  `celular` INT(10) NOT NULL COMMENT '',
  `estrato` INT(1) NOT NULL COMMENT '',
  `tipopoblacion` VARCHAR(45) NOT NULL COMMENT '',
  `hechosvictimizantes` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`idfichamat`)  COMMENT '',
  INDEX `fk_fichamat_programa_idx` (`programa_idprograma` ASC)  COMMENT '',
  INDEX `fk_fichamat_aprendiz1_idx` (`aprendiz_idaprendiz` ASC)  COMMENT '',
  CONSTRAINT `fk_fichamat_programa`
    FOREIGN KEY (`programa_idprograma`)
    REFERENCES `mase`.`programa` (`idprograma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fichamat_aprendiz1`
    FOREIGN KEY (`aprendiz_idaprendiz`)
    REFERENCES `mase`.`aprendiz` (`idaprendiz`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
