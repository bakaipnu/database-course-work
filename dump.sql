-- MySQL Script generated by MySQL Workbench
-- пн, 04-гру-2023 16:05:28 +0100
-- Model: New Model    Version: 1.0
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
-- Table `mydb`.`building`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`building` (
  `building_id` INT NULL DEFAULT NULL,
  `building_name` VARCHAR(100) NOT NULL,
  `location_build` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`building_id`));


-- -----------------------------------------------------
-- Table `mydb`.`room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`room` (
  `room_id` INT NULL DEFAULT NULL,
  `building_id` INT NOT NULL,
  `room_number` VARCHAR(20) NOT NULL,
  `capacity` INT NOT NULL,
  `room_type` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`room_id`),
  INDEX (`building_id` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`building_id`)
    REFERENCES `mydb`.`building` (`building_id`));


-- -----------------------------------------------------
-- Table `mydb`.`room_equipment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`room_equipment` (
  `equipment_id` INT NULL DEFAULT NULL,
  `room_id` INT NOT NULL,
  `equipment_name` VARCHAR(100) NOT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`equipment_id`),
  INDEX (`room_id` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`room_id`)
    REFERENCES `mydb`.`room` (`room_id`));


-- -----------------------------------------------------
-- Table `mydb`.`room_condition`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`room_condition` (
  `condition_id` INT NULL DEFAULT NULL,
  `room_id` INT NOT NULL,
  `condition_description` TEXT NOT NULL,
  `date_reported` DATE NOT NULL,
  PRIMARY KEY (`condition_id`),
  INDEX (`room_id` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`room_id`)
    REFERENCES `mydb`.`room` (`room_id`));


-- -----------------------------------------------------
-- Table `mydb`.`maintenance_request`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`maintenance_request` (
  `request_id` INT NULL DEFAULT NULL,
  `room_id` INT NOT NULL,
  `description` TEXT NOT NULL,
  `date_requested` DATE NOT NULL,
  `status` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`request_id`),
  INDEX (`room_id` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`room_id`)
    REFERENCES `mydb`.`room` (`room_id`));


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
