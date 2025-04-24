Clase N° 2 - Trabajo Práctico N° 2: Implementación de Transacciones y Concurrencia en SQL
Federico Horacio Britez
•
27 mar (Última modificación: 7 abr)
40 puntos
Fecha de entrega: 2 abr, 23:59
Actividad:
Diseñar e implementar un un Sistema de Gestión Bancaria que permita realizar transferencias entre cuentas asegurando 

la integridad de los datos mediante transacciones y bloqueos adecuados.

Demanda real:
Un banco necesita asegurar que las transferencias de dinero entre cuentas se realicen de forma segura y confiable, evitando problemas de concurrencia como : lecturas sucias, lecturas no repetibles y lecturas fantasmas.  

  Objetivos:  
Implementar transacciones en SQL para gestionar transferencias bancarias.
Aplicar niveles de aislamiento adecuados para prevenir problemas de concurrencia.
Usar bloqueos explícitos para evitar inconsistencias en los datos.
Etapas o pasos a seguir:
1 Creación de la base de datos y tablas
Crea una base de datos con la siguiente estructura:

CREATE DATABASE Banco;
USE Banco;

CREATE TABLE Cuentas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titular VARCHAR(100),
    saldo DECIMAL(10,2) NOT NULL CHECK (saldo >= 0)
);

INSERT INTO Cuentas (titular, saldo) VALUES ('Juan Pérez', 5000.00);
INSERT INTO Cuentas (titular, saldo) VALUES ('María Gómez', 3000.00);


2 Implementación de la transacción de transferencia bancaria
Implementa una transacción en SQL que realice la transferencia de dinero entre dos cuentas asegurando: atomicidad, consistencia, aislamiento y durabilidad (ACID)
.  

3 Prueba de concurrencia
Simula una situación de concurrencia en la que dos usuarios intentan transferir dinero simultáneamente:
Usa SLEEP(5) en una transacción para retrasar su ejecución y verificar cómo afecta a la otra transacción concurrente.
Experimenta con distintos niveles de aislamiento (READ COMMITTED, REPEATABLE READ, SERIALIZABLE) y analiza los resultados.
4 Explicación y análisis  
  

Forma de entrega:  
Código SQL implementado.
Captura de pantalla de la base de datos antes y después de la transacción.
Explicación escrita sobre cómo las transacciones y niveles de aislamiento afectan la concurrencia.
Análisis de posibles problemas que podrían ocurrir si no se usaran transacciones.

Resolucion de consigna: 
🔍 ¿Qué se busca en este trabajo práctico?
Crear un sistema simple de transferencias bancarias usando SQL que cumpla con las propiedades ACID (Atomicidad, Consistencia, Aislamiento y Durabilidad) y que evite problemas de concurrencia como:
Lecturas sucias: leer datos que aún no han sido confirmados.
Lecturas no repetibles: leer datos que cambian durante una transacción.
Lecturas fantasmas: nuevas filas aparecen en una consulta durante una transacción.
Explicación de la transacción

Implementamos una transacción que garantiza que: Se descuente y sume dinero de forma atómica (todo o nada).
No hay inconsistencia de datos.
Si una parte falla, se revierte (ROLLBACK).
Al terminar, los cambios son duraderos (COMMIT).
🧠 Análisis de concurrencia
Probamos distintos niveles de aislamiento:
READ COMMITTED: permite lecturas no repetibles.
REPEATABLE READ: evita lecturas no repetibles, pero puede haber lecturas fantasmas.
SERIALIZABLE: máximo aislamiento, evita todos los problemas pero es más lento y bloquea más.

Si no usamos transacciones:
Podríamos descontar de una cuenta sin acreditar en la otra.
Dos usuarios podrían leer el mismo saldo y gastar más de lo disponible (lectura sucia o no repetible).

📌 ¿Entonces lo usaron en clase?
Si hicieron el ejemplo del SLEEP(5) y probaron con distintos niveles, probaramos SERIALIZABLE también para ver cómo bloquea más que los otros.