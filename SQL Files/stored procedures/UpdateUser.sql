CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateUser`(
IN `pidUser` INT,
IN `pnameUser` VARCHAR(60), 
IN `pdobUser` DATE,
IN `pemailUser` VARCHAR(60), 
IN `ppassUser` VARCHAR(10), 
IN `pnickUser` VARCHAR(60), 
IN `pimageUser` VARCHAR(255)
)
BEGIN
UPDATE `user`
SET
`nameUser` = pnameUser,
`dobUser` = pdobUser,
`emailUser` = pemailUser,
`passUser` = ppassUser,
`nickUser` = pnickUser,
`imageUser` = pimageUser,
`dateUser` = CURRENT_TIMESTAMP
WHERE `idUser` = pidUser;
END