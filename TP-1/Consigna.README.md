Clase N° 1 - Trabajo Práctico N° 1: "Gestión de una Base de Datos Universitaria"
Federico Horacio Britez
Aplicar restricciones de en una base de datos relacional para la gestión de una universidad.

Consigna: 
Una universidad necesita gestionar la información de Estudiantes, Profesores y Materias. Para asegurar la integridad de los datos, deben aplicarse restricciones en la base de datos.

Diseñar y crear las siguientes tablas con restricciones adecuadas:
Estudiantes: Debe garantizar que cada estudiante tenga un ID único y que su edad esté en un rango válido.
Profesores: Cada profesor debe tener un ID único y una especialidad registrada.
Materias: Cada materia debe estar asociada a un profesor existente y tener un código único.
Inscripciones: Cada inscripción debe estar vinculada a un estudiante y una materia existente.

Crear la base de datos y seleccionarla
 
Crear la tabla Estudiantes con restricciones.
Cada estudiante debe tener un 

un ID único .
La edad debe ser mayor a 17 y menor a 100.
El correo electrónico debe ser único.
 Crear la tabla Profesores con restricciones.
Cada profesor debe tener un 
ID único  .
Su especialidad no puede estar vacía.
Crear la tabla Materias con restricciones.
Cada materia debe tener un 

código único.
Debe estar vinculada a un profesor existente.
La cantidad de créditos debe ser entre 1 y 10.
Crear la tabla Inscripciones con restricciones.
Cada inscripción debe tener un 

ID único.
Debe estar vinculada a un estudiante y una materia existente.
La fecha de inscripción debe ser dentro del año en curso.
Insertar Datos de Prueba:
Insertar 5 estudiantes, 3 profesores, 4 materias y 3 inscripciones.
Incluir un caso de prueba con una inscripción inválida (por ejemplo, con una fecha del año pasado).

Paso adjuntar la base de datos con la consigna. y su respectivo sql. 