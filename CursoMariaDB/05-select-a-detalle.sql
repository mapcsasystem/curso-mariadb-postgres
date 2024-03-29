-- =====================Usar Base de Datos=====================
use store;

-- =====================SELECT A DETALLE=====================

-- 1. CASE sirve para poner logica condicional es parecido a un switch
 
SELECT name, 
	CASE 
		WHEN currency = 'MXN' THEN 'Peso Mexicano'
		WHEN currency = 'USD' THEN 'Dolar americano'
		ELSE 'Otra moneda'
	END AS 'Moneda'
FROM customer;

-- 2. SUBCONSULTA es una consulta que esta dentro de otra se mete entre parentecis
-- NOTA tener cuidado por rendimiento y legivilidad pueden estar en un select, where o join

-- Ejecutando SUBCONSULTA dentro de una consulta
SELECT name,
	(SELECT name FROM city
	WHERE city.id = customer.city_id) AS 'city'
FROM customer;

-- Ejecutando SUBCONSULTA dentro de una consulta con IFNULL
SELECT name,
IFNULL((
	SELECT name FROM city
	WHERE city.id = customer.city_id),'Sin Ciudad') AS 'city'
FROM customer;

-- Ejecutando SUBCONSULTA desde el FROM
SELECT c.name 
FROM(SELECT name FROM customer
		WHERE city_id IS NOT NULL) AS c;

-- Ejecutando SUBCONSULTA desde el FROM con ORDER BY ordenando ASC
SELECT c.name 
FROM(SELECT name FROM customer
		WHERE city_id IS NOT NULL) AS c
ORDER BY name ASC;

-- Ejecutando SUBCONSULTA desde el FROM con ORDER BY ordenando DESC
SELECT c.name 
FROM(SELECT name FROM customer
		WHERE city_id IS NOT NULL) AS c
ORDER BY name DESC;

-- Ejecutando CONSULTA con funcion COUNT(*) cuenta todos los registros que hay
SELECT COUNT(*) FROM customer;

-- Ejecutando SUBCONSULTA con funcion COUNT(*) cuenta todos los registros que hay cuando city.id = customer.city_id 
SELECT name,
	(SELECT COUNT(*) FROM customer
		WHERE city.id = customer.city_id) AS 'cantidad'
FROM city;

-- Ejecutando SUBCONSULTA con en el WHERE donde la subconsulta trae los elementos que cumplan city.id =customer.city_id) > 0 
-- solamente trae los nombres que tengan una relacion o mas
SELECT name
FROM city
WHERE (SELECT COUNT(*)
	   FROM customer
 	   WHERE city.id =customer.city_id) > 0
		
-- 2. LIMIT sirve para limitar los registros que retornes
-- Muestra todos los customers
SELECT name
FROM customer;

-- Muestra solo los primeros 5 registros
SELECT name
FROM customer
LIMIT 5;

-- Muestra los registros apartir de LIMIT(0,5) el 0 es de donde empieza a mostrar y el segundo 5 es los registros que muestra
-- NOTA Esto puede servir para paginado
SELECT id,name
FROM customer
LIMIT 0,5;

-- Muestra los registros apartir de LIMIT(5,5) el primer 5 es de donde empieza a mostrar y el segundo 5 es los registros que muestra
SELECT id,name
FROM customer
LIMIT 5,5;

-- LIMIT esta amarrado al ORDER BY si ponemos ORDER BY id DESC trairia los ultimos registros ya que los ordena decendentemente
-- NOTA si no se le pone el ORDER BY id DESC sino ORDER BY id  por default es ASC   

-- Este ejemplo es sin el ORDER BY
SELECT id,name
FROM customer
LIMIT 0,5;

-- Este ejemplo es con el ORDER BY id ASC
SELECT id,name
FROM customer
ORDER BY id ASC
LIMIT 0,5;

-- Este ejemplo es con el ORDER BY id DESC
SELECT id,name
FROM customer
ORDER BY id DESC
LIMIT 0,5;


-- 3. INSERT apartir de SELECT inserta informacion masiba
-- NOTA eto funciona si name y email en customer no sean unicos loc campos
INSERT INTO customer (name,email)
SELECT name ,'xxx@gmail.com' FROM city;

SELECT * FROM customer;

-- 4. ORDER BY aleatorio funcion RAND() trae numeros aleatorios
-- Funcion RAND()
SELECT RAND();

-- SE ejecuta un ordenamiento aleatorio cada que se ejecute
SELECT id,name  FROM customer 
ORDER BY RAND();

-- SE ejecuta un ordenamiento aleatorio cada que se ejecute puede ejecutar sorteos
SELECT id,name  FROM customer 
ORDER BY RAND()
LIMIT 1;
