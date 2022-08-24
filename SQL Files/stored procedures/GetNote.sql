CREATE DEFINER=`root`@`localhost` PROCEDURE `GetNote`(
IN `pidNote` INT
)
BEGIN
SELECT 
	`idNote`,
    `descriptionN`,
    `dateN`
FROM `note`
WHERE `statusN` = 1
AND `idNote` = pidNote;
END