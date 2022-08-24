CREATE DEFINER=`root`@`localhost` PROCEDURE `GetHashtag`(
IN `pidHashtag` INT
)
BEGIN
SELECT `idHashtag`,
    `nameH`,
    `orderH`
FROM `hashtag`
WHERE `idHashtag` = pidHashtag;
END