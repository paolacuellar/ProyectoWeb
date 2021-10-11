CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateNote`(
IN `pidNote` INT,
IN `pdescriptionN` VARCHAR(255)
)
BEGIN
UPDATE `note`
SET
`dateN`=CURRENT_TIMESTAMP,
`descriptionN` = pdescriptionN
WHERE `idNote` = pidNote;

END