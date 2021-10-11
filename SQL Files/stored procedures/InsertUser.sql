CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertUser`(
IN `pnameUser` VARCHAR(60), 
IN `pdobUser` DATE,
IN `pemailUser` VARCHAR(60), 
IN `ppassUser` VARCHAR(10), 
IN `pnickUser` VARCHAR(60), 
IN `pimageUser` VARCHAR(255)
)
BEGIN
INSERT INTO user
(`nameUser`,
`dobUser`,
`emailUser`,
`passUser`,
`nickUser`,
`imageUser`)
VALUES
(pnameUser,
pdobUser,
pemailUser,
ppassUser,
pnickUser,
pimageUser);

END