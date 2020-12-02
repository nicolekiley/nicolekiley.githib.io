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
-- Table `assign03`.`bids`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assign03`.`bids` (
  `bid_id` INT NOT NULL,
  `highest_bid` INT NULL DEFAULT NULL,
  `earliest_bid` INT NULL DEFAULT NULL,
  `winning_bid` INT NULL DEFAULT NULL,
  `item_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`bid_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `assign03`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assign03`.`customers` (
  `customer_id` INT NOT NULL,
  `lastname` VARCHAR(45) NULL DEFAULT NULL,
  `firstname` VARCHAR(45) NULL DEFAULT NULL,
  `bid_id` INT NULL DEFAULT NULL,
  `bids_bid_id` INT NOT NULL,
  PRIMARY KEY (`customer_id`),
  INDEX `fk_customers_bids_idx` (`bids_bid_id` ASC) VISIBLE,
  CONSTRAINT `fk_customers_bids`
    FOREIGN KEY (`bids_bid_id`)
    REFERENCES `assign03`.`bids` (`bid_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `assign03`.`items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assign03`.`items` (
  `item_id` INT NOT NULL,
  `opening_price` INT NULL DEFAULT NULL,
  `reserve_price` INT NULL DEFAULT NULL,
  `decription` VARCHAR(45) NULL DEFAULT NULL,
  `ending_time` DATETIME NULL DEFAULT NULL,
  `seller_id` INT NULL DEFAULT NULL,
  `bids_bid_id` INT NOT NULL,
  PRIMARY KEY (`item_id`),
  INDEX `fk_items_bids1_idx` (`bids_bid_id` ASC) VISIBLE,
  CONSTRAINT `fk_items_bids1`
    FOREIGN KEY (`bids_bid_id`)
    REFERENCES `assign03`.`bids` (`bid_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `assign03`.`sellers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assign03`.`sellers` (
  `seller_id` INT NOT NULL,
  `lastname` VARCHAR(45) NULL DEFAULT NULL,
  `firstname` VARCHAR(45) NULL DEFAULT NULL,
  `item_id` INT NULL,
  PRIMARY KEY (`seller_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `assign03`.`sellers_has_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assign03`.`sellers_has_items` (
  `sellers_seller_id` INT NOT NULL,
  `items_item_id` INT NOT NULL,
  PRIMARY KEY (`sellers_seller_id`, `items_item_id`),
  INDEX `fk_sellers_has_items_items1_idx` (`items_item_id` ASC) VISIBLE,
  INDEX `fk_sellers_has_items_sellers1_idx` (`sellers_seller_id` ASC) VISIBLE,
  CONSTRAINT `fk_sellers_has_items_sellers1`
    FOREIGN KEY (`sellers_seller_id`)
    REFERENCES `assign03`.`sellers` (`seller_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sellers_has_items_items1`
    FOREIGN KEY (`items_item_id`)
    REFERENCES `assign03`.`items` (`item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
