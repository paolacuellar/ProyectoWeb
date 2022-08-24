CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertNote`(
 IN `pdescriptionN` VARCHAR(255),
 IN `pidUser` INT,
 IN `pidHashtag` INT
)
BEGIN
INSERT INTO note
(`descriptionN`,
`idUser`,
`idHashtag`)
VALUES
(pdescriptionN,
pidUser,
pidHashtag);

END