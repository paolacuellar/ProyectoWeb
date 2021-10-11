CREATE DEFINER=`root`@`localhost` PROCEDURE `ActiveNote`(
IN `pidUser` INT 
)
BEGIN
SELECT 
	`idNote`,
    `descriptionN`,
    `dateN`
FROM `note`
WHERE `statusN` = 1
AND `idUser` = pidUser;

END