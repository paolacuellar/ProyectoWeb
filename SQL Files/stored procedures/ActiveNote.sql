CREATE DEFINER=`root`@`localhost` PROCEDURE `ActiveNote`(
IN `pidUser` INT 
)
BEGIN
SELECT 
	`idNote`,
    `descriptionN`,
    `dateN`,
    `idHashtag`
FROM `note`
WHERE `statusN` = 1
AND `idUser` = pidUser
ORDER BY `idNote`DESC;
END