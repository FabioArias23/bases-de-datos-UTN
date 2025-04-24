CREATE DATABASE Banco;
USE Banco;

CREATE TABLE Cuentas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titular VARCHAR(100),
    saldo DECIMAL(10,2) NOT NULL CHECK (saldo >= 0)
);

INSERT INTO Cuentas (titular, saldo) VALUES ('Juan Pérez', 5000.00);
INSERT INTO Cuentas (titular, saldo) VALUES ('María Gómez', 3000.00);

--Cumpliendo la consigna
--Transferencia bancaria como transacción
--Esta parte implica hacer una transacción segura para transferir dinero entre dos cuentas.

START TRANSACTION;

-- restar dinero de la cuenta origen (ej: Juan Pérez)
UPDATE Cuentas
SET saldo = saldo - 1000
WHERE id = 1;

-- verificamos que no quede con saldo negativo
SELECT saldo FROM Cuentas WHERE id = 1;

-- sumar dinero a la cuenta destino (ej: María Gómez)
UPDATE Cuentas
SET saldo = saldo + 1000
WHERE id = 2;

COMMIT;


--si algun momento pasa algo malo
-- usar ROLLBACK

--- aca hago la prueba de concurrencia concurrencia
 SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
START TRANSACTION;

-- leer saldo de juan
SELECT saldo FROM Cuentas WHERE id = 1;

-- esperar 5 segundos
DO SLEEP(5);

-- resto la plata 
UPDATE Cuentas
SET saldo = saldo - 500
WHERE id = 1;

COMMIT;

-- aca uso la prueba de concurrencia
--ejemplo uno  transaccion lenta SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
START TRANSACTION;

-- leeo el saldo de juan
SELECT saldo FROM Cuentas WHERE id = 1;

-- espero 5 segundos
DO SLEEP(5);

-- resto el dinero el dinero de juan 
UPDATE Cuentas
SET saldo = saldo - 500
WHERE id = 1;

COMMIT;

--ejemplo dos segundo usuario simultaneo SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
--corre este en otro cliente/consola mientras el primero está durmiendo:

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
START TRANSACTION;

-- leer saldo de juan
SELECT saldo FROM Cuentas WHERE id = 1;

-- intentar restar también
UPDATE Cuentas
SET saldo = saldo - 700
WHERE id = 1;

COMMIT;


--ejemplo con Serializable

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
START TRANSACTION;

-- Leer saldo
SELECT saldo FROM Cuentas WHERE id = 1;

-- Espera
DO SLEEP(5);

-- Transferencia
UPDATE Cuentas
SET saldo = saldo - 500
WHERE id = 1;

COMMIT;