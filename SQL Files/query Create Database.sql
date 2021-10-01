CREATE DATABASE dbproyecto;
USE dbproyecto;

DELETE FROM user;
DROP TABLE user;
DROP DATABASE DBProyecto;

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


SELECT * FROM user;

CALL LogInUser("admin1", "Admin!123");

