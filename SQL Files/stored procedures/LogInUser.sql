CREATE DEFINER=`root`@`localhost` PROCEDURE `LogInUser`(
IN `pnickUser` VARCHAR(60),
IN `ppassUser` VARCHAR(10)
)
BEGIN
SELECT `idUser`,
    `nameUser`,
    `dobUser`,
    `emailUser`
    `passUser`,
    `nickUser`,
    `imageUser`
FROM `user`
WHERE `nickUser` = pnickUser
AND `passUser` = ppassUser;
END