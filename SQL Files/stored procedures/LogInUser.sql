USE `dbproyecto`;
DROP procedure IF EXISTS `LogInUser`;

DELIMITER $$
USE `dbproyecto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `LogInUser`(
IN `pnickUser` VARCHAR(60),
IN `ppassUser` VARCHAR(10)
)
BEGIN
SELECT `user`.`idUser` as ID,
    `user`.`nameUser` as Nombre,
    `user`.`dobUser` as Fecha_de_nacimiento,
    `user`.`emailUser`as Correo,
    `user`.`passUser` as Contraseña,
    `user`.`nickUser` as Usuario,
    `user`.`imageUser` as Foto
FROM `dbproyecto`.`user`
WHERE `user`.`nickUser` = pnickUser
AND `user`.`passUser` = ppassUser;
END$$

DELIMITER ;
