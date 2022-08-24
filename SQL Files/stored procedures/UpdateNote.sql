CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateNote`(
IN `pidNote` INT,
IN `pdescriptionN` VARCHAR(255),
IN `pidHashtag` INT
)
BEGIN
UPDATE `note`
SET
`dateN`=CURRENT_TIMESTAMP,
`descriptionN` = pdescriptionN,
`idHashtag`= pidHashtag
WHERE `idNote` = pidNote;

END