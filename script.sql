-- MySQL Script generated by MySQL Workbench
-- Mon Nov 25 20:10:09 2019
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
DROP SCHEMA IF EXISTS mydb;
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`genre` (
  `genre_id` INT NOT NULL,
  `genre_name` VARCHAR(45) NULL,
  PRIMARY KEY (`genre_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`albums`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`albums` (
  `album_id` INT NOT NULL,
  `album_name` VARCHAR(45) NULL,
  `genre_genre_id` INT NOT NULL,
  PRIMARY KEY (`album_id`),
  INDEX `fk_albums_genre1_idx` (`genre_genre_id` ASC),
  CONSTRAINT `fk_albums_genre1`
    FOREIGN KEY (`genre_genre_id`)
    REFERENCES `mydb`.`genre` (`genre_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`aritists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`aritists` (
  `aritist_id` INT NOT NULL,
  `artist_name` VARCHAR(45) NULL,
  PRIMARY KEY (`aritist_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`songs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`songs` (
  `song_id` INT NOT NULL,
  `Song_name` VARCHAR(45) NULL,
  `albums_album_id` INT NOT NULL,
  `aritists_aritist_id` INT NOT NULL,
  PRIMARY KEY (`song_id`),
  INDEX `fk_songs_albums_idx` (`albums_album_id` ASC),
  INDEX `fk_songs_aritists1_idx` (`aritists_aritist_id` ASC),
  CONSTRAINT `fk_songs_albums`
    FOREIGN KEY (`albums_album_id`)
    REFERENCES `mydb`.`albums` (`album_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_songs_aritists1`
    FOREIGN KEY (`aritists_aritist_id`)
    REFERENCES `mydb`.`aritists` (`aritist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`membership`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`membership` (
  `membership_id` INT NOT NULL,
  `type_of_membership` VARCHAR(45) NULL,
  PRIMARY KEY (`membership_id`))
ENGINE = InnoDB;
ALTER TABLE membership
ADD COLUMN membershipcost INT NOT NULL;


-- -----------------------------------------------------
-- Table `mydb`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customers` (
  `customer_id` INT NOT NULL,
  `customer_name` VARCHAR(45) NULL,
  `email` VARCHAR(100) NULL,
  `country` VARCHAR(45) NULL,
  `membership_membership_id` INT NOT NULL,
  PRIMARY KEY (`customer_id`),
  INDEX `fk_customers_membership1_idx` (`membership_membership_id` ASC),
  CONSTRAINT `fk_customers_membership1`
    FOREIGN KEY (`membership_membership_id`)
    REFERENCES `mydb`.`membership` (`membership_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`customers_has_songs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`customers_has_songs` (
  `customers_customer_id` INT NOT NULL,
  `songs_song_id` INT NOT NULL,
  PRIMARY KEY (`customers_customer_id`, `songs_song_id`),
  INDEX `fk_customers_has_songs_songs1_idx` (`songs_song_id` ASC),
  INDEX `fk_customers_has_songs_customers1_idx` (`customers_customer_id` ASC),
  CONSTRAINT `fk_customers_has_songs_customers1`
    FOREIGN KEY (`customers_customer_id`)
    REFERENCES `mydb`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customers_has_songs_songs1`
    FOREIGN KEY (`songs_song_id`)
    REFERENCES `mydb`.`songs` (`song_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO `mydb`.`genre` (`genre_id`, `genre_name`) 
VALUES ('1', 'pop');
INSERT INTO `mydb`.`genre` (`genre_id`, `genre_name`) 
VALUES ('2', 'rock');
INSERT INTO `mydb`.`genre` (`genre_id`, `genre_name`) 
VALUES ('3', 'gospel');
INSERT INTO `mydb`.`genre` (`genre_id`, `genre_name`) 
VALUES ('4', 'country');
INSERT INTO `mydb`.`genre` (`genre_id`, `genre_name`) 
VALUES ('5', 'rap');

INSERT INTO `mydb`.`albums` (`album_id`, `album_name`, `genre_genre_id`) 
VALUES ('1', 'nineteen', '1');
INSERT INTO `mydb`.`albums` (`album_id`, `album_name`, `genre_genre_id`) 
VALUES ('2', 'happiness begins', '1');
INSERT INTO `mydb`.`albums` (`album_id`, `album_name`, `genre_genre_id`) 
VALUES ('3', 'intution', '1');
INSERT INTO `mydb`.`albums` (`album_id`, `album_name`, `genre_genre_id`) 
VALUES ('4', 'cool', '2');
INSERT INTO `mydb`.`albums` (`album_id`, `album_name`, `genre_genre_id`) 
VALUES ('5', 'born this way', '2');
INSERT INTO `mydb`.`albums` (`album_id`, `album_name`, `genre_genre_id`) 
VALUES ('6', 'lover', '2');
INSERT INTO `mydb`.`albums` (`album_id`, `album_name`, `genre_genre_id`) 
VALUES ('7', 'make room', '3');
INSERT INTO `mydb`.`albums` (`album_id`, `album_name`, `genre_genre_id`) 
VALUES ('8', 'hiding place', '3');
INSERT INTO `mydb`.`albums` (`album_id`, `album_name`, `genre_genre_id`) 
VALUES ('9', 'amazing grace', '3');
INSERT INTO `mydb`.`albums` (`album_id`, `album_name`, `genre_genre_id`) 
VALUES ('10', 'cry pretty', '4');
INSERT INTO `mydb`.`albums` (`album_id`, `album_name`, `genre_genre_id`) 
VALUES ('11', 'traveller', '4');
INSERT INTO `mydb`.`albums` (`album_id`, `album_name`, `genre_genre_id`) 
VALUES ('12', 'girl going nowhere', '4');
INSERT INTO `mydb`.`albums` (`album_id`, `album_name`, `genre_genre_id`) 
VALUES ('13', 'the eminem show', '5');
INSERT INTO `mydb`.`albums` (`album_id`, `album_name`, `genre_genre_id`) 
VALUES ('14', 'the college dropout', '5');
INSERT INTO `mydb`.`albums` (`album_id`, `album_name`, `genre_genre_id`) 
VALUES ('15', 'invasion of privacy', '5');

INSERT INTO `mydb`.`aritists` (`aritist_id`, `artist_name`) 
VALUES ('101', 'adele');
INSERT INTO `mydb`.`aritists` (`aritist_id`, `artist_name`) 
VALUES ('105', 'jonas');
INSERT INTO `mydb`.`aritists` (`aritist_id`, `artist_name`) 
VALUES ('104', 'tyler shaw');
INSERT INTO `mydb`.`aritists` (`aritist_id`, `artist_name`) 
VALUES ('107', 'lady gaga');
INSERT INTO `mydb`.`aritists` (`aritist_id`, `artist_name`) 
VALUES ('108', 'taylor swift');
INSERT INTO `mydb`.`aritists` (`aritist_id`, `artist_name`) 
VALUES ('109', 'jonathan');
INSERT INTO `mydb`.`aritists` (`aritist_id`, `artist_name`) 
VALUES ('110', 'tori kelly');
INSERT INTO `mydb`.`aritists` (`aritist_id`, `artist_name`) 
VALUES ('115', 'aretha');
INSERT INTO `mydb`.`aritists` (`aritist_id`, `artist_name`) 
VALUES ('113', 'carrie');
INSERT INTO `mydb`.`aritists` (`aritist_id`, `artist_name`) 
VALUES ('112', 'chris');
INSERT INTO `mydb`.`aritists` (`aritist_id`, `artist_name`) 
VALUES ('111', 'ashley');
INSERT INTO `mydb`.`aritists` (`aritist_id`, `artist_name`) 
VALUES ('102', 'eminem');
INSERT INTO `mydb`.`aritists` (`aritist_id`, `artist_name`) 
VALUES ('103', 'kanye west');
INSERT INTO `mydb`.`aritists` (`aritist_id`, `artist_name`) 
VALUES ('106', 'cardi');

INSERT INTO `mydb`.`membership` (`membership_id`, `type_of_membership`, `membershipcost`) 
VALUES ('1001', 'Monthly', '10');
INSERT INTO `mydb`.`membership` (`membership_id`, `type_of_membership`,  `membershipcost`) 
VALUES ('1002', '6 Months', '50');
INSERT INTO `mydb`.`membership` (`membership_id`, `type_of_membership`,  `membershipcost`) 
VALUES ('1003', 'one year', '100');

UPDATE `mydb`.`albums` SET `album_name` = 'mr perfect' WHERE (`album_id` = '4');

INSERT INTO `mydb`.`songs` (`song_id`, `Song_name`, `albums_album_id`, `aritists_aritist_id`) 
VALUES ('1001', 'Hometwon glory', '1', '101');
INSERT INTO `mydb`.`songs` (`song_id`, `Song_name`, `albums_album_id`, `aritists_aritist_id`) 
VALUES ('1002', 'cold shoulder', '1', '101');
INSERT INTO `mydb`.`songs` (`song_id`, `Song_name`, `albums_album_id`, `aritists_aritist_id`) 
VALUES ('1003', 'make you feel my love', '1', '101');
INSERT INTO `mydb`.`songs` (`song_id`, `Song_name`, `albums_album_id`, `aritists_aritist_id`) 
VALUES ('1004', 'sucker', '2', '105');
INSERT INTO `mydb`.`songs` (`song_id`, `Song_name`, `albums_album_id`, `aritists_aritist_id`) 
VALUES ('1005', 'cool', '2', '105');
INSERT INTO `mydb`.`songs` (`song_id`, `Song_name`, `albums_album_id`, `aritists_aritist_id`) 
VALUES ('1006', 'only human', '2', '105');
INSERT INTO `mydb`.`songs` (`song_id`, `Song_name`, `albums_album_id`, `aritists_aritist_id`) 
VALUES ('1007', 'same as me', '3', '104');
INSERT INTO `mydb`.`songs` (`song_id`, `Song_name`, `albums_album_id`, `aritists_aritist_id`) 
VALUES ('1008', 'the wall', '3', '104');
INSERT INTO `mydb`.`songs` (`song_id`, `Song_name`, `albums_album_id`, `aritists_aritist_id`) 
VALUES ('1009', 'cautios', '3', '104');
INSERT INTO `mydb`.`songs` (`song_id`, `Song_name`, `albums_album_id`, `aritists_aritist_id`) 
VALUES ('1010', 'song ', '4', '105');
INSERT INTO `mydb`.`songs` (`song_id`, `Song_name`, `albums_album_id`, `aritists_aritist_id`) 
VALUES ('1011', 'light teesko', '4', '105');
INSERT INTO `mydb`.`songs` (`song_id`, `Song_name`, `albums_album_id`, `aritists_aritist_id`) VALUES ('1012', 'marry the night', '5', '108');
INSERT INTO `mydb`.`songs` (`song_id`, `Song_name`, `albums_album_id`, `aritists_aritist_id`) VALUES ('1013', 'government hooker', '5', '108');
INSERT INTO `mydb`.`songs` (`song_id`, `Song_name`, `albums_album_id`, `aritists_aritist_id`) VALUES ('1014', 'americano', '5', '108');
INSERT INTO `mydb`.`songs` (`song_id`, `Song_name`, `albums_album_id`, `aritists_aritist_id`) VALUES ('1015', 'me', '6', '108');
INSERT INTO `mydb`.`songs` (`song_id`, `Song_name`, `albums_album_id`, `aritists_aritist_id`) VALUES ('1016', 'you need to calm down', '6', '108');
INSERT INTO `mydb`.`songs` (`song_id`, `Song_name`, `albums_album_id`, `aritists_aritist_id`) VALUES ('1017', 'life room anthem', '7', '109');
INSERT INTO `mydb`.`songs` (`song_id`, `Song_name`, `albums_album_id`, `aritists_aritist_id`) VALUES ('1018', 'cycles', '7', '109');
INSERT INTO `mydb`.`songs` (`song_id`, `Song_name`, `albums_album_id`, `aritists_aritist_id`) VALUES ('1019', 'great is the lord', '7', '109');
INSERT INTO `mydb`.`songs` (`song_id`, `Song_name`, `albums_album_id`, `aritists_aritist_id`) VALUES ('1020', 'masterpiece', '8', '110');
INSERT INTO `mydb`.`songs` (`song_id`, `Song_name`, `albums_album_id`, `aritists_aritist_id`) VALUES ('1021', 'help us to love', '8', '110');
INSERT INTO `mydb`.`songs` (`song_id`, `Song_name`, `albums_album_id`, `aritists_aritist_id`) VALUES ('1022', 'sunday', '8', '110');
INSERT INTO `mydb`.`songs` (`song_id`, `Song_name`, `albums_album_id`, `aritists_aritist_id`) VALUES ('1023', 'organ introduction', '9', '115');
INSERT INTO `mydb`.`songs` (`song_id`, `Song_name`, `albums_album_id`, `aritists_aritist_id`) VALUES ('1024', 'on our way', '9', '115');
INSERT INTO `mydb`.`songs` (`song_id`, `Song_name`, `albums_album_id`, `aritists_aritist_id`) VALUES ('1025', 'opening remarks', '9', '115');
INSERT INTO `mydb`.`songs` (`song_id`, `Song_name`, `albums_album_id`, `aritists_aritist_id`) VALUES ('1026', 'low', '10', '113');
INSERT INTO `mydb`.`songs` (`song_id`, `Song_name`, `albums_album_id`, `aritists_aritist_id`) VALUES ('1027', 'ghosts on the stereo', '10', '113');
INSERT INTO `mydb`.`songs` (`song_id`, `Song_name`, `albums_album_id`, `aritists_aritist_id`) VALUES ('1028', 'fire away', '11', '112');
INSERT INTO `mydb`.`songs` (`song_id`, `Song_name`, `albums_album_id`, `aritists_aritist_id`) VALUES ('1029', 'tennesssee whiskey', '11', '112');
INSERT INTO `mydb`.`songs` (`song_id`, `Song_name`, `albums_album_id`, `aritists_aritist_id`) VALUES ('1030', 'radioland', '12', '111');
INSERT INTO `mydb`.`songs` (`song_id`, `Song_name`, `albums_album_id`, `aritists_aritist_id`) VALUES ('1031', 'the jacket', '12', '111');
INSERT INTO `mydb`.`songs` (`song_id`, `Song_name`, `albums_album_id`, `aritists_aritist_id`) VALUES ('1032', 'americal scandal', '12', '111');
INSERT INTO `mydb`.`songs` (`song_id`, `Song_name`, `albums_album_id`, `aritists_aritist_id`) VALUES ('1033', 'without me', '13', '102');
INSERT INTO `mydb`.`songs` (`song_id`, `Song_name`, `albums_album_id`, `aritists_aritist_id`) VALUES ('1034', 'the kiss', '13', '102');
INSERT INTO `mydb`.`songs` (`song_id`, `Song_name`, `albums_album_id`, `aritists_aritist_id`) VALUES ('1035', 'drips', '13', '102');
INSERT INTO `mydb`.`songs` (`song_id`, `Song_name`, `albums_album_id`, `aritists_aritist_id`) VALUES ('1036', 'soldier', '13', '102');
INSERT INTO `mydb`.`songs` (`song_id`, `Song_name`, `albums_album_id`, `aritists_aritist_id`) VALUES ('1037', 'we dont care', '14', '103');
INSERT INTO `mydb`.`songs` (`song_id`, `Song_name`, `albums_album_id`, `aritists_aritist_id`) VALUES ('1038', 'graduation day', '14', '103');
INSERT INTO `mydb`.`songs` (`song_id`, `Song_name`, `albums_album_id`, `aritists_aritist_id`) VALUES ('1039', 'all falls down', '14', '103');
INSERT INTO `mydb`.`songs` (`song_id`, `Song_name`, `albums_album_id`, `aritists_aritist_id`) VALUES ('1040', 'get up 10', '15', '106');
INSERT INTO `mydb`.`songs` (`song_id`, `Song_name`, `albums_album_id`, `aritists_aritist_id`) VALUES ('1041', 'best life', '15', '106');
INSERT INTO `mydb`.`songs` (`song_id`, `Song_name`, `albums_album_id`, `aritists_aritist_id`) VALUES ('1042', 'she bad', '15', '106');

INSERT INTO `mydb`.`customers` (`customer_id`, `customer_name`, `email`, `country`, `membership_membership_id`) VALUES ('01', 'nikhil', 'nikhil@gmail.com', 'IN', '1001');
INSERT INTO `mydb`.`customers` (`customer_id`, `customer_name`, `email`, `country`, `membership_membership_id`) VALUES ('02', 'preetham', 'preetham@gmail.com', 'IN', '1001');
INSERT INTO `mydb`.`customers` (`customer_id`, `customer_name`, `email`, `country`, `membership_membership_id`) VALUES ('03', 'dp', 'dp@gmail.com', 'CA', '1002');
INSERT INTO `mydb`.`customers` (`customer_id`, `customer_name`, `email`, `country`, `membership_membership_id`) VALUES ('04', 'alan', 'alan@gmail.com', 'CA', '1002');
INSERT INTO `mydb`.`customers` (`customer_id`, `customer_name`, `email`, `country`, `membership_membership_id`) VALUES ('05', 'david', 'david@gmail.com', 'CA', '1003');
INSERT INTO `mydb`.`customers` (`customer_id`, `customer_name`, `email`, `country`, `membership_membership_id`) VALUES ('06', 'smith', 'smith@gmail.com', 'AUS', '1003');
INSERT INTO `mydb`.`customers` (`customer_id`, `customer_name`, `email`, `country`, `membership_membership_id`) VALUES ('07', 'williamson', 'willy@gmail.com', 'NZ', '1002');
INSERT INTO `mydb`.`customers` (`customer_id`, `customer_name`, `email`, `country`, `membership_membership_id`) VALUES ('08', 'henry', 'henry@gmail.com', 'NZ', '1001');
INSERT INTO `mydb`.`customers` (`customer_id`, `customer_name`, `email`, `country`, `membership_membership_id`) VALUES ('09', 'ross', 'ross@gmail.com', 'NZ', '1002');
INSERT INTO `mydb`.`customers` (`customer_id`, `customer_name`, `email`, `country`, `membership_membership_id`) VALUES ('10', 'pointing', 'p@gmail.com', 'AUS', '1003');
INSERT INTO `mydb`.`customers` (`customer_id`, `customer_name`, `email`, `country`, `membership_membership_id`) VALUES ('11', 'warner', 'warner@gmail.com', 'AUS', '1002');
INSERT INTO `mydb`.`customers` (`customer_id`, `customer_name`, `email`, `country`, `membership_membership_id`) VALUES ('12', 'virat', 'v@yahoo.com', 'IN', '1003');
INSERT INTO `mydb`.`customers` (`customer_id`, `customer_name`, `email`, `country`, `membership_membership_id`) VALUES ('13', 'hassan', 'hassan@yahoo.com', 'BAN', '1001');
INSERT INTO `mydb`.`customers` (`customer_id`, `customer_name`, `email`, `country`, `membership_membership_id`) VALUES ('14', 'mushfiquer', 'mush@gmail.com', 'BAN', '1001');
INSERT INTO `mydb`.`customers` (`customer_id`, `customer_name`, `email`, `country`, `membership_membership_id`) VALUES ('15', 'mutraza', 'murt@gmail.com', 'BAN', '1003');
INSERT INTO `mydb`.`customers` (`customer_id`, `customer_name`, `email`, `country`, `membership_membership_id`) VALUES ('16', 'devillers', 'dev@yahoo.com', 'RSA', '1003');
INSERT INTO `mydb`.`customers` (`customer_id`, `customer_name`, `email`, `country`, `membership_membership_id`) VALUES ('17', 'steyn', 'stey@gmail.com', 'RSA', '1002');
INSERT INTO `mydb`.`customers` (`customer_id`, `customer_name`, `email`, `country`, `membership_membership_id`) VALUES ('18', 'rabada', 'rab@yahoo.com', 'RSA', '1002');
INSERT INTO `mydb`.`customers` (`customer_id`, `customer_name`, `email`, `country`, `membership_membership_id`) VALUES ('19', 'sai', 'sai@gmail.com', 'IN', '1003');
INSERT INTO `mydb`.`customers` (`customer_id`, `customer_name`, `email`, `country`, `membership_membership_id`) VALUES ('20', 'chaitanya', 'ch@yahoo.com', 'CA', '1003');
INSERT INTO `mydb`.`customers` (`customer_id`, `customer_name`, `email`, `country`, `membership_membership_id`) VALUES ('21', 'vivek', 'v@gmail.com', 'IN', '1002');
INSERT INTO `mydb`.`customers` (`customer_id`, `customer_name`, `email`, `country`, `membership_membership_id`) VALUES ('22', 'vineeth', 'vineeth@gmail.com', 'AUS', '1001');
INSERT INTO `mydb`.`customers` (`customer_id`, `customer_name`, `email`, `country`, `membership_membership_id`) VALUES ('23', 'bablu', 'bab@gmail.com', 'IN', '1001');
INSERT INTO `mydb`.`customers` (`customer_id`, `customer_name`, `email`, `country`, `membership_membership_id`) VALUES ('24', 'madan', 'madan@gmail.com', 'RSA', '1001');
INSERT INTO `mydb`.`customers` (`customer_id`, `customer_name`, `email`, `country`, `membership_membership_id`) VALUES ('25', 'venkatesh', 'venki@yahoo.com', 'RSA', '1002');



INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('1', '1001');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('2', '1004');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('2', '1005');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('2', '1006');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('3', '1002');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('3', '1003');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('3', '1004');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('3', '1005');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('4', '1006');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('5', '1007');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('6', '1008');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('7', '1008');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('7', '1007');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('7', '1006');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('8', '1009');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('8', '1010');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('9', '1011');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('10', '1012');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('11', '1013');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('12', '1014');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('11', '1014');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('13', '1015');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('14', '1015');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('15', '1016');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('16', '1017');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('17', '1018');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('16', '1018');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('18', '1019');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('18', '1020');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('18', '1021');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('19', '1022');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('19', '1020');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('19', '1021');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('20', '1022');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('20', '1023');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('20', '1024');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('2', '1025');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('3', '1026');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('4', '1027');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('21', '1028');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('22', '1028');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('23', '1029');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('24', '1030');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('25', '1031');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('1', '1032');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('1', '1033');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('10', '1034');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('11', '1035');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('10', '1042');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('11', '1041');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('12', '1039');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('22', '1030');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('23', '1037');
INSERT INTO `mydb`.`customers_has_songs` (`customers_customer_id`, `songs_song_id`) VALUES ('24', '1039');

