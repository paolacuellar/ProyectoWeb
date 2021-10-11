USE dbproyecto;

DELETE FROM user;
DELETE FROM note;
DROP TABLE user;
DROP TABLE note;

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
(`descriptionN`, `idUser`)
VALUES
('hola admin', 1),
('Esto es una nota', 1);


SELECT * FROM user;
SELECT * FROM note;

