CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertNote`(
 IN `pdescriptionN` VARCHAR(255),
 IN `pidUser` INT
)
BEGIN
INSERT INTO note
(`descriptionN`,
`idUser`)
VALUES
(pdescriptionN,
pidUser);

END