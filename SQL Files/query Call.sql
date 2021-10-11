
/*Muestra solo las notas "existentes"*/
CALL `ActiveNote`(1);

CALL `InsertNote`('Crea una nota', 1);

CALL `UpdateNote`(3, 'Edita una nota');

CALL `UpdateNote`(2, 'esto es una nota editada');

/*Modifica el valor del estado de la nota a 0*/
CALL `DeleteNote`(2);

CALL LogInUser("admin1", "Admin!123");




