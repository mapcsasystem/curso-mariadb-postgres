-- =====================Consultas basicas=====================
use store;

-- 1. Consulta todos los registros
SELECT * FROM customer;

-- 2. Insertar información
INSERT INTO customer (name, email)
VALUES ('Miguel0', 'miguel0@gmail.com');

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







