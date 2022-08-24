USE dbproyecto;

DELETE FROM user;
DELETE FROM note;
DROP TABLE user;
DROP TABLE note;
DROP TABLE hashtag;

INSERT INTO `user`
(
`nameUser`,
`dobUser`,
`emailUser`,
`passUser`,
`nickUser`,
`imageUser`
)
VALUES
(
'Admin',
'2021-09-20',
'admin@admin.com',
'Admin!123',
'admin1',
'assets/images/image1632784235427.png'
);

INSERT INTO `note`
(`descriptionN`, `idUser`, `idHashtag`)
VALUES
('hola admin', 1, 1),
('Esto es una nota', 1, 3),
('Esto es otra nota', 1, 3),
('Esta es una nota del usuario 2', 2, 3),
('hola otra vez admin', 1, 1);


SELECT * FROM user;
SELECT * FROM note;
SELECT * FROM hashtag;


