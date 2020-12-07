-- MySQL Script generated by MySQL Workbench
-- Mon Dec  7 14:31:04 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema projet_gite
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema projet_gite
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `projet_gite` DEFAULT CHARACTER SET utf8 ;
USE `projet_gite` ;

-- -----------------------------------------------------
-- Table `projet_gite`.`admin`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `projet_gite`.`admin` ;

CREATE TABLE IF NOT EXISTS `projet_gite`.`admin` (
  `id_admin` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(150) NULL,
  `password` VARCHAR(255) NULL,
  PRIMARY KEY (`id_admin`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projet_gite`.`gite`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `projet_gite`.`gite` ;

CREATE TABLE IF NOT EXISTS `projet_gite`.`gite` (
  `id_gite` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `image_rect_1` VARCHAR(255) NULL,
  `image_rect_2` VARCHAR(255) NULL,
  `image_rect_3` VARCHAR(255) NULL,
  `localisation` VARCHAR(255) NULL,
  `description` TEXT(1500) NULL,
  `spec` VARCHAR(255) NULL,
  `nbr_couchage` INT NULL,
  `prix` INT NULL,
  `image_carre` VARCHAR(255) NULL,
  PRIMARY KEY (`id_gite`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projet_gite`.`reservation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `projet_gite`.`reservation` ;

CREATE TABLE IF NOT EXISTS `projet_gite`.`reservation` (
  `id_reservation` INT NOT NULL AUTO_INCREMENT,
  `date_debut` DATE NULL,
  `date_fin` DATE NULL,
  PRIMARY KEY (`id_reservation`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projet_gite`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `projet_gite`.`user` ;

CREATE TABLE IF NOT EXISTS `projet_gite`.`user` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(255) NULL,
  PRIMARY KEY (`id_user`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projet_gite`.`gite_reservation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `projet_gite`.`gite_reservation` ;

CREATE TABLE IF NOT EXISTS `projet_gite`.`gite_reservation` (
  `gite_id_gite` INT NOT NULL,
  `reservation_id_reservation` INT NOT NULL,
  PRIMARY KEY (`gite_id_gite`, `reservation_id_reservation`),
  INDEX `fk_gite_has_reservation_reservation1_idx` (`reservation_id_reservation` ASC) VISIBLE,
  INDEX `fk_gite_has_reservation_gite1_idx` (`gite_id_gite` ASC) VISIBLE,
  CONSTRAINT `fk_gite_has_reservation_gite1`
    FOREIGN KEY (`gite_id_gite`)
    REFERENCES `projet_gite`.`gite` (`id_gite`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_gite_has_reservation_reservation1`
    FOREIGN KEY (`reservation_id_reservation`)
    REFERENCES `projet_gite`.`reservation` (`id_reservation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projet_gite`.`user_reservation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `projet_gite`.`user_reservation` ;

CREATE TABLE IF NOT EXISTS `projet_gite`.`user_reservation` (
  `user_id_user` INT NOT NULL,
  `reservation_id_reservation` INT NOT NULL,
  PRIMARY KEY (`user_id_user`, `reservation_id_reservation`),
  INDEX `fk_user_has_reservation_reservation1_idx` (`reservation_id_reservation` ASC) VISIBLE,
  INDEX `fk_user_has_reservation_user1_idx` (`user_id_user` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_reservation_user1`
    FOREIGN KEY (`user_id_user`)
    REFERENCES `projet_gite`.`user` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_reservation_reservation1`
    FOREIGN KEY (`reservation_id_reservation`)
    REFERENCES `projet_gite`.`reservation` (`id_reservation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
