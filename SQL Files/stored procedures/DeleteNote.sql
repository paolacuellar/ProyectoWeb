CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteNote`(
IN `pidNote` INT
)
BEGIN
UPDATE `note`
SET
`statusN` = 0
WHERE `idNote` = pidNote;

END