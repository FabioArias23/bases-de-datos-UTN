--creo una nueva base de dato y hago el ejercicio
CREATE DATABASE Banco_Restaurada;
USE Banco_Restaurada;

--▶ Luego en Workbench:
--Ir a Server > Data Import.

--Seleccionar "Import from Self-Contained File".
--Elegí tu archivo .sql exportado antes. en este caso banco_cuentas.backup.sql
--Importalo en Banco_Restaurada.
--💡 Esto va a reconstruir todas las tablas y datos originales.


----
--ejecuta consulta sin indice 
SELECT * FROM clientes WHERE apellido = 'Fernández';

---paso para ver que se ejecuta sin indice 
EXPLAIN SELECT * FROM clientes WHERE apellido = 'Fernández';

--creo un indice 
CREATE INDEX idx_apellido ON clientes(apellido);

--vuelvo a correr 
EXPLAIN SELECT * FROM clientes WHERE apellido = 'Fernández';

--para que sirve EXPLAIN 
--¿Para que sirve?
--Ver si tus consultas son eficientes.
--Saber si tus índices están funcionando.
--Optimizar consultas que son lentas.