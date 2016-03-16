SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Admin`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Admin` (
  `idAdmin` INT NOT NULL ,
  PRIMARY KEY (`idAdmin`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Profil`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Profil` (
  `idProfil` INT NOT NULL ,
  `Admin_idAdmin` INT NOT NULL ,
  PRIMARY KEY (`idProfil`, `Admin_idAdmin`) ,
  INDEX `fk_Profil_Admin_idx` (`Admin_idAdmin` ASC) ,
  CONSTRAINT `fk_Profil_Admin`
    FOREIGN KEY (`Admin_idAdmin` )
    REFERENCES `mydb`.`Admin` (`idAdmin` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Lokal`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Lokal` (
  `idLokal` INT NOT NULL ,
  `Admin_idAdmin` INT NOT NULL ,
  PRIMARY KEY (`idLokal`, `Admin_idAdmin`) ,
  INDEX `fk_Lokal_Admin1_idx` (`Admin_idAdmin` ASC) ,
  CONSTRAINT `fk_Lokal_Admin1`
    FOREIGN KEY (`Admin_idAdmin` )
    REFERENCES `mydb`.`Admin` (`idAdmin` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Event`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Event` (
  `idEvent` INT NOT NULL ,
  `Lokal_idLokal` INT NOT NULL ,
  `Lokal_Admin_idAdmin` INT NOT NULL ,
  PRIMARY KEY (`idEvent`, `Lokal_idLokal`, `Lokal_Admin_idAdmin`) ,
  INDEX `fk_Event_Lokal1_idx` (`Lokal_idLokal` ASC, `Lokal_Admin_idAdmin` ASC) ,
  CONSTRAINT `fk_Event_Lokal1`
    FOREIGN KEY (`Lokal_idLokal` , `Lokal_Admin_idAdmin` )
    REFERENCES `mydb`.`Lokal` (`idLokal` , `Admin_idAdmin` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Album`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Album` (
  `idAlbum` INT NOT NULL ,
  `Lokal_idLokal` INT NOT NULL ,
  `Lokal_Admin_idAdmin` INT NOT NULL ,
  PRIMARY KEY (`idAlbum`, `Lokal_idLokal`, `Lokal_Admin_idAdmin`) ,
  INDEX `fk_Album_Lokal1_idx` (`Lokal_idLokal` ASC, `Lokal_Admin_idAdmin` ASC) ,
  CONSTRAINT `fk_Album_Lokal1`
    FOREIGN KEY (`Lokal_idLokal` , `Lokal_Admin_idAdmin` )
    REFERENCES `mydb`.`Lokal` (`idLokal` , `Admin_idAdmin` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Slika`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Slika` (
  `idSlika` INT NOT NULL ,
  `Album_idAlbum` INT NOT NULL ,
  `Album_Lokal_idLokal` INT NOT NULL ,
  `Album_Lokal_Admin_idAdmin` INT NOT NULL ,
  PRIMARY KEY (`idSlika`, `Album_idAlbum`, `Album_Lokal_idLokal`, `Album_Lokal_Admin_idAdmin`) ,
  INDEX `fk_Slika_Album1_idx` (`Album_idAlbum` ASC, `Album_Lokal_idLokal` ASC, `Album_Lokal_Admin_idAdmin` ASC) ,
  CONSTRAINT `fk_Slika_Album1`
    FOREIGN KEY (`Album_idAlbum` , `Album_Lokal_idLokal` , `Album_Lokal_Admin_idAdmin` )
    REFERENCES `mydb`.`Album` (`idAlbum` , `Lokal_idLokal` , `Lokal_Admin_idAdmin` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Komentar`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Komentar` (
  `idKomentar` INT NOT NULL ,
  `Album_idAlbum` INT NOT NULL ,
  `Album_Lokal_idLokal` INT NOT NULL ,
  `Album_Lokal_Admin_idAdmin` INT NOT NULL ,
  `Slika_idSlika` INT NOT NULL ,
  `Event_idEvent` INT NOT NULL ,
  PRIMARY KEY (`idKomentar`, `Album_idAlbum`, `Album_Lokal_idLokal`, `Album_Lokal_Admin_idAdmin`, `Slika_idSlika`, `Event_idEvent`) ,
  INDEX `fk_Komentar_Album1_idx` (`Album_idAlbum` ASC, `Album_Lokal_idLokal` ASC, `Album_Lokal_Admin_idAdmin` ASC) ,
  INDEX `fk_Komentar_Slika1_idx` (`Slika_idSlika` ASC) ,
  INDEX `fk_Komentar_Event1_idx` (`Event_idEvent` ASC) ,
  CONSTRAINT `fk_Komentar_Album1`
    FOREIGN KEY (`Album_idAlbum` , `Album_Lokal_idLokal` , `Album_Lokal_Admin_idAdmin` )
    REFERENCES `mydb`.`Album` (`idAlbum` , `Lokal_idLokal` , `Lokal_Admin_idAdmin` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Komentar_Slika1`
    FOREIGN KEY (`Slika_idSlika` )
    REFERENCES `mydb`.`Slika` (`idSlika` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Komentar_Event1`
    FOREIGN KEY (`Event_idEvent` )
    REFERENCES `mydb`.`Event` (`idEvent` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `mydb` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
