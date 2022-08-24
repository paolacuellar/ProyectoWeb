CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertHashtag`(
IN  `pnameH` VARCHAR(45),
IN `porderH` INT
)
BEGIN
INSERT INTO `hashtag`
(`nameH`,
`orderH`)
VALUES
(pnameH,
porderH);
END