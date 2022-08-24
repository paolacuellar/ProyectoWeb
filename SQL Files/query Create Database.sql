CREATE DATABASE dbproyecto;
USE dbproyecto;

DELETE FROM user;
DROP TABLE user;
DELETE FROM note;
DROP TABLE note;


CREATE TABLE `user` ( 
`idUser` INT NOT NULL AUTO_INCREMENT, 
`nameUser` VARCHAR(60) NOT NULL, 
`dobUser` DATE NOT NULL,
`emailUser` VARCHAR(60) NOT NULL, 
`passUser` VARCHAR(10) NOT NULL, 
`nickUser` VARCHAR(60) NOT NULL, 
`imageUser` VARCHAR(255) NOT NULL, 
PRIMARY KEY (`idUser`),
UNIQUE INDEX `idUser_UNIQUE`(`idUser` ASC) VISIBLE,
UNIQUE INDEX `nickUser_UNIQUE`(`nickUser` ASC) VISIBLE
);
ALTER TABLE `user` 
ADD COLUMN `dateUser` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER `imageUser`;


CREATE TABLE `note` (
  `idNote` INT NOT NULL AUTO_INCREMENT,
  `descriptionN` VARCHAR(255) NOT NULL,
  `dateN` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `statusN` BINARY NOT NULL DEFAULT 1,
  `idUser` INT NOT NULL,
  PRIMARY KEY (`idNote`),
  UNIQUE INDEX `idNote_UNIQUE` (`idNote` ASC) VISIBLE,
  INDEX `idUser_idx` (`idUser` ASC) VISIBLE,
  CONSTRAINT `idUser`
	FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`)
   );
   ALTER TABLE `note` 
ADD COLUMN `idHashtag` INT NULL AFTER `idUser`,
ADD INDEX `idHashtag_idx` (`idHashtag` ASC) VISIBLE;
;
ALTER TABLE `note` 
ADD CONSTRAINT `idHashtag`
  FOREIGN KEY (`idHashtag`)
  REFERENCES `dbproyecto`.`hashtag` (`idHashtag`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
   
   CREATE TABLE `hashtag` (
  `idHashtag` INT NOT NULL AUTO_INCREMENT,
  `nameH` VARCHAR(45) NOT NULL,
  `orderH` INT NULL,
  PRIMARY KEY (`idHashtag`));


