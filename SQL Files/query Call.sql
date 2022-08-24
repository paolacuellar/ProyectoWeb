
/*Muestra solo las notas "existentes"*/
CALL `ActiveNote`(1);

CALL `GetNote`(1);

CALL `InsertNote`('Crea una nota', 1, 3);

CALL `UpdateNote`(3, 'Edita una nota');

CALL `UpdateNote`(5, 'esto es una nota editada', 2);

/*Modifica el valor del estado de la nota a 0*/
CALL `DeleteNote`(2);

CALL LogInUser("admin1", "Admin!123");

CALL InsertHashtag('Universidad','0');

CALL GetHashtags();

CALL GetHashtag(3);



