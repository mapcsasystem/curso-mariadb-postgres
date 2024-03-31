-- =====================Consultas basicas=====================
use store;

-- 1. Consulta todos los registros
SELECT * FROM customer;

-- 2. Insertar información
INSERT INTO customer (name, email)
VALUES ('Miguel0', 'miguel0@gmail.com');

INSERT INTO customer (name, email)
VALUES ('ana', 'ana@gmail.com');

-- 3. Insertar Varios Valores
INSERT INTO customer (name,email)
VALUES 
('Miguel1', 'miguel1@gmail.com'),
('Miguel2', 'miguel2@gmail.com'),
('Miguel3', 'miguel3@gmail.com');

SELECT * FROM customer;

-- 4. Seleccionar con LIMIT 0, 2  muestra los primeros 2 registros  
SELECT * FROM customer
LIMIT 0,2;

-- 5. Seleccionar con LIMIT 2, 2  muestra los registros apartir del registro y muestra solo dos registros
SELECT * FROM customer
LIMIT 2,2;

-- 6. Seleccionar una sola columna
SELECT name FROM customer;

-- 7. Poner Valores que no existen en la tabla 
SELECT 'Algo', 3 ,name FROM customer;

-- 8. Funcion UPPER muestra el valor de la columna en mayusculas
SELECT UPPER(name) FROM customer;

-- 9. Funcion LOWER muestra el valor de la columna en minusculas
SELECT LOWER(name) FROM customer;

-- 10. Funcion LENGTH cuenta el valor de la caracteres de cada columna
SELECT LENGTH (name) FROM customer;

-- 11. Agregar columna existente name a Funcion LENGTH (name) cuenta el valor de la caracteres de cada columna
SELECT name ,LENGTH (name) FROM customer;

-- 12. Agregar columna existente name a Funcion LENGTH () con alias AS 'nombre de como se quiere llamar la columna'
SELECT name ,LENGTH (name) AS 'longitud'
FROM customer;

-- 13. Ordenar columna por default se ordena asendentemente por id
SELECT * FROM customer
ORDER BY id;

-- 14. Hace lo mismo que inciso 13 agregando al id ASC 
SELECT * FROM customer
ORDER BY id ASC;

-- 15. Ordenar columna decendentemente DESC
SELECT * FROM customer
ORDER BY id DESC;

-- 16. Ordenar columna name decendentemente ASC
-- NOTA la ordenación funciona con ASCII Por ejemplo si en name en alguna
-- de sus columnas tiene mayusculas las tomara primero
SELECT * FROM customer
ORDER BY name ASC;

-- 17. Para poder Ordenar name correctamente ya sea ASC ó DESC
-- se puede poner la funcion LOWER ó UPPER
SELECT * FROM customer
ORDER BY LOWER(name) ASC;

-- 18. Ordenar columna name decendentemente DESC
SELECT * FROM customer
ORDER BY name DESC;

-- 19. Ordenar por dos columnas name, email acendentemente ASC
SELECT * FROM customer
ORDER BY name, email;

-- 20. Ordenar por dos columnas name, email
-- se pueden combinar los ordenamientos en cada columna
SELECT * FROM customer
ORDER BY name ASC , email DESC;

-- 21. Filtrar información campo name
SELECT * FROM customer
WHERE name='Miguel0';

-- 22. Filtrar información campo name ignorando mayusculas
SELECT * FROM customer
WHERE LOWER(name)='miguel0';

-- 23. Filtrados compuestos información campo name con la palabra OR ignorando mayusculas en name
-- OR es la condición si se cumple LOWER(name)='miguel0' ó name='ana'
SELECT * FROM customer
WHERE LOWER(name)='miguel0' OR name='ana';

-- 24. Filtrados compuestos información campo name y email con la palabra AND ignorando mayusculas en name
-- AND es la condición se deben de cumplir los dos campos LOWER(name)='miguel0' y email='miguel0@gmail.com'
SELECT * FROM customer
WHERE LOWER(name)='miguel0' AND email='miguel0@gmail.com';

-- 25. Utilizar funciones con opereradores logicos de sql para que traiga todos los registros que la longitud de name
-- sea mayor a 3 caracteres
SELECT * FROM customer
WHERE LENGTH(name) > 3;

-- 26. Utilizar funciones con opereradores logicos de sql para que traiga todos los registros que la longitud de name
-- sea mayor ó igual a 3 caracteres
SELECT * FROM customer
WHERE LENGTH(name) >= 3;

-- 27. Modificar información campo name donde
-- name sea Miguel0
-- En vesiones mas actuales mariadb ó mysql para poder modificar siempre tiene que ser por el id
-- Pero esta opción se puede desacrivar 
SET SQL_SAFE_UPDATES = 0; 

SELECT * FROM customer;

-- Convierte el campo name sea Miguel0 a pancho
UPDATE customer SET name='pancho'
WHERE name='Miguel0';

SELECT * FROM customer;

-- Convierte el campo name que es igual a ana a mayusculas
UPDATE customer SET name=UPPER(name) 
WHERE name='ana';
SELECT * FROM customer;

-- Convierte el campo name a pancho1 donde el id sea igual a 1
UPDATE customer SET name='pancho1'
WHERE id=2;
SELECT * FROM customer;

UPDATE customer SET name='francisco' , email='francisco58@gmail.com'
WHERE id=2;
SELECT * FROM customer;

-- Modificar los campos name a Mayusculas dependiendo de cada id con la palabra IN 
-- IN es la funcion que permite ver insertar en los id que se agreguen en el  
UPDATE customer SET name=UPPER(name)
WHERE id IN (2,4,5);
SELECT * FROM customer;

-- 28. Borrar registros esta clausa DROP  siempre debe tener un WHERE SI NO SE BORRARIAN TODOS LOS REGISTROS
UPDATE customer SET name=UPPER(name)
WHERE id IN (2,4,5);
SELECT * FROM customer;

-- 28. Borrar registros esta clausala DELETE siempre debe tener un WHERE SI NO SE BORRARIAN TODOS LOS REGISTROS
DELETE FROM  customer
WHERE id=1;
SELECT * FROM customer;

-- Borrar varios registros con la funcion IN siempre debe tener un WHERE SI NO SE BORRARIAN TODOS LOS REGISTROS
DELETE FROM  customer
WHERE id IN (1,2,3);
SELECT * FROM customer;

-- Borrar varios registros sin el WHERE al borrarse con DELETE los id no vuelven a empesar de 0 sino del 
-- ultimo id que se genero lo auto incrementa ejemplo el ultimo id que se genero es el 6 si insertamos un dato 
-- el id comenzaria en 7
DELETE FROM  customer;
SELECT * FROM customer;

INSERT INTO customer(name,email)
VALUES ('francisco', 'francisco@gmail.com');

-- si se quiere eliminar todos los registros y reiniciar el id nuevamente se utiliza TRUNCATE
TRUNCATE TABLE customer;
SELECT * FROM customer;

INSERT INTO customer(name,email)
VALUES
('juan', 'juan@gmail.com'),
('ana', 'ana@gmail.com'),
('ana', 'ana2@gmail.com'),
('francisco', 'francisco2@gmail.com');
SELECT * FROM customer;

-- 29. Agrupaciones de datos sirve para sacar valores identicos y poder hacer operaciones
-- el AS es para dar un alias a la columna
SELECT name, COUNT(*) AS 'cantidad' FROM customer
GROUP BY name;