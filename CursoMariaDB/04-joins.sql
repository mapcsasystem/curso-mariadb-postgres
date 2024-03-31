-- =====================Usar Base de Datos=====================
use store;

-- =====================JOINS=====================

-- Son convinaciones de tablas se aplican entre tabla o varias tablas la convinacion puede ser muchas
-- veces por el fk siempre en los SELECT se hace referencia a customer como ejemplo por lo tanto
-- en customer quedaria del lado izquierdo y city del lado dereccho

-- 1. INNER JOIN trae los redultados que estan unidos con city.id con customer.city_id los null no los evalua  
-- se unen las dos tablas 
SELECT * FROM customer 
INNER JOIN city ON city.id = customer.city_id;

-- Aqui solo trae las dos columnas de name de las tablas customer y city
SELECT customer.name, city.name FROM customer 
INNER JOIN city ON city.id = customer.city_id;

-- 2. LEFT JOIN trae todos los redultados customer tengan ó no tengan ciudades relacionadas 

-- trae todos los campos
SELECT * FROM customer 
LEFT JOIN city ON city.id = customer.city_id;

-- trae los campos de customer name y city name el AS es el alias para que la columna de city name aparesca como city
SELECT customer.name, city.name AS 'city' FROM customer 
LEFT JOIN city ON city.id = customer.city_id;

-- IFNULL es una funcion que detecta si un campo es null
-- IFNULL(city.name,'Sin ciudad')  'Sin ciudad' lo pondria por defecto si el campo de la ciudad name es null  
-- NOTA:en la tabla no inserta, modifica ó borra registros
SELECT customer.name, IFNULL(city.name,'Sin ciudad') as 'city' FROM customer 
LEFT JOIN city ON city.id = customer.city_id;


-- 3. RIGHT JOIN hace lo contrario a LEFT JOIN trae todas las ciudades sin importar tenga relacion ó no

-- trae todos los campos
SELECT * FROM city;
INSERT INTO customer(name,email, city_id)
VALUES ('Gonzalo','gonzalo@gmail.com','4');

SELECT * FROM customer 
RIGHT JOIN city ON city.id = customer.city_id;

-- trae los campos de customer name incluso si es null y city name el AS es el alias para que la 
-- columna de city name aparesca como city
SELECT customer.name, city.name AS 'city' FROM customer 
RIGHT JOIN city ON city.id = customer.city_id;

-- Trae los registros de customer name si es null ó no y todos los registros de city name 
SELECT customer.name, city.name AS 'city' FROM customer 
RIGHT JOIN city ON city.id = customer.city_id;

-- IFNULL es una funcion que detecta si un campo es null
-- IFNULL(customer.name,'No name')  'No name' lo pondria por defecto si el campo del customer name es null
-- NOTA:en la tabla no inserta, modifica ó borra registros
SELECT IFNULL(customer.name,'No name') as 'customer', city.name AS 'city' FROM customer 
RIGHT JOIN city ON city.id = customer.city_id;

-- 4. CROSS JOIN conbina todos los registros de la tabla customer con la tabla city
-- apesar de que no contengan relación
-- Trae todos los customers y city combinando las tablas
SELECT * FROM customer
CROSS JOIN city;

-- 4. UNION sirve para unir dos consultas
-- En esta consulta se unen todos los customer name y al final de la columna de name se agrega 'UNO MAS' 
-- Para unir las dos consultas siempre debe tener el mismo numero de columnas en este caso solo es name
-- NOTA:en la tabla no inserta, modifica ó borra registros
SELECT name FROM customer
UNION 
SELECT 'UNO MAS';

-- Con dos columnas id, name en esta consulta en id al final de la columna se agrega 'UNO MAS',
-- y al final de la columna name se agrega 'ALGO MAS' NOTA:en la tabla no inserta, modifica ó borra registros 
-- NOTA:en la tabla no inserta, modifica ó borra registros
SELECT id, name FROM customer
UNION 
SELECT 'UNO MAS', 'ALGO MAS';

-- Consultar con otra tabla los campos deben de ser iguales id , name
-- NOTA:en la tabla no inserta, modifica ó borra registros
SELECT id, name FROM customer
UNION 
SELECT id, name FROM city;

-- Consultar con otra tabla los campos deben de ser iguales id , name categorizando de que tabla son
-- NOTA:en la tabla no inserta, modifica ó borra registros 
SELECT id, name, 'customer' AS 'category' FROM customer
UNION 
SELECT id, name, 'city' FROM city;

-- 5. SELF JOIN hacer un join a si mismo de la  tabla por medio de un fk de la misma tabla

-- En este ejemplo es para saber quien es la persona que te recomendo y/o refirio

-- 5.1 se agrega una nueva columna a la tabla customer referred_id con INT ya que hara referencia
-- a la misma tabla customer del id 
ALTER TABLE customer 
ADD COLUMN referred_id INT;

-- 5.2 Se crea el fk_referred_id
ALTER TABLE customer 
ADD CONSTRAINT fk_referred_id
FOREIGN KEY(referred_id) REFERENCES customer(id);

-- En la columna customer referred_id quedarian todos en null
SELECT * FROM customer;

-- Poner el mismo referido a todos a exepcion que sea diferente '<>' id=1 de la tabla customer
-- Si al ejecutar el UPDATE da un error ejecutar primero SET SQL_SAFE_UPDATES = 0;
-- El id debe existir en customer id
UPDATE customer SET referred_id=1
WHERE id <> 1;

-- todos los registros de la tabla customer con la columna referred_id tendran 1 exepto el id=1  
SELECT * FROM customer;

-- Hacer query para que muestre los referidos
-- El SELECT c1 es el aleas de la tabla customer
-- el INNER JOIN customer AS c2 es el aleas de customer 
-- pero no saldra los que no tengan referencia al fk ya que es un INNER JOIN 
-- el ON une la consulta c1.name con c2.name AS 'referred' y solo mostraria dos columnas name y referred
-- NOTA:en la tabla no inserta, modifica ó borra registros
SELECT c1.name, c2.name AS 'referred' from customer AS c1
INNER JOIN customer AS c2
ON c2.id = c1.referred_id;

-- 6. FULL JOIN regresa los resultados tanto en customer como en ciudad y donde coincidan los mostrara juntos
-- cuando los resultados no coincidan mostrara los null de un lado o del otro (Tablas)
-- NOTA en sql server existe El FULL JOIN pero en mariadb y mysql no pero los podemos simular el 
-- FULL JOIN es un LEFT JOIN y RIGHT JOIN convinados
SELECT * from customer
LEFT JOIN city ON city.id = customer.city_id
UNION 
SELECT * from customer
RIGHT JOIN city ON city.id = customer.city_id;