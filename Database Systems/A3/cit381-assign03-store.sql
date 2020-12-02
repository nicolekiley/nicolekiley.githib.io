-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema assign03
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema assign03
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `assign03` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `assign03` ;

-- -----------------------------------------------------
-- Table `assign03`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assign03`.`employees` (
  `employee_id` INT NOT NULL,
  `lastname` VARCHAR(45) NULL DEFAULT NULL,
  `firstname` VARCHAR(45) NULL DEFAULT NULL,
  `hire_date` DATE NOT NULL,
  `release_date` DATE NULL DEFAULT NULL,
  `manager` VARCHAR(45) NULL DEFAULT NULL,
  `store_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`employee_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `assign03`.`region`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assign03`.`region` (
  `region_id` INT NOT NULL,
  `region_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`region_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `assign03`.`stores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assign03`.`stores` (
  `store_id` INT NOT NULL,
  `store_name` VARCHAR(45) NULL DEFAULT NULL,
  `region_id` VARCHAR(45) NOT NULL,
  `region_region_id` INT NOT NULL,
  PRIMARY KEY (`store_id`),
  INDEX `fk_stores_region_idx` (`region_region_id` ASC) VISIBLE,
  CONSTRAINT `fk_stores_region`
    FOREIGN KEY (`region_region_id`)
    REFERENCES `assign03`.`region` (`region_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `assign03`.`employees_has_stores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assign03`.`employees_has_stores` (
  `employees_employee_id` INT NOT NULL,
  `stores_store_id` INT NOT NULL,
  PRIMARY KEY (`employees_employee_id`, `stores_store_id`),
  INDEX `fk_employees_has_stores_stores1_idx` (`stores_store_id` ASC) VISIBLE,
  INDEX `fk_employees_has_stores_employees1_idx` (`employees_employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_employees_has_stores_employees1`
    FOREIGN KEY (`employees_employee_id`)
    REFERENCES `assign03`.`employees` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employees_has_stores_stores1`
    FOREIGN KEY (`stores_store_id`)
    REFERENCES `assign03`.`stores` (`store_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
