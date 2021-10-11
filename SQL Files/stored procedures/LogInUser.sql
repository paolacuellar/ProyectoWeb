CREATE DEFINER=`root`@`localhost` PROCEDURE `LogInUser`(
IN `pnickUser` VARCHAR(60),
IN `ppassUser` VARCHAR(10)
)
BEGIN
SELECT `idUser` as ID,
    `nameUser` as Nombre,
    `dobUser` as Fecha_de_nacimiento,
    `emailUser`as Correo,
    `passUser` as Contraseña,
   `nickUser` as Usuario,
    `imageUser` as Foto
FROM `user`
WHERE `nickUser` = pnickUser
AND `passUser` = ppassUser;
END