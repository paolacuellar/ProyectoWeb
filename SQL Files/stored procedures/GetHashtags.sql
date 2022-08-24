CREATE DEFINER=`root`@`localhost` PROCEDURE `GetHashtags`()
BEGIN
SELECT `idHashtag`,
    `nameH`,
    `orderH`
FROM `hashtag`
ORDER BY `orderH`, `nameH`;

END