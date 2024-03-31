-- =====================Usar Base de Datos=====================
use store;

-- 1.Opereador AND, OR y NOT todo se enfocara en el WHERE 
-- este funciona en el SELECT, DELETE ,UPDATE para filtrar informacioón

-- Consulta para filtrar los datos de customer name con WHERE, WHERE puede ser compuesto
-- con funciones como LENGHT esta funcion cuenta los caracteres y regresa un valor numerico
-- en este caso se valora WHERE LENGTH (name)>4; la longitud de name es mayor a 4 
SELECT * FROM customer
WHERE LENGTH (name)>4; 

-- Consulta para filtrar los datos de customer name con WHERE, WHERE puede ser compuesto
-- con funciones como LENGHT esta funcion cuenta los caracteres y regresa un valor numerico
-- en este caso se valora WHERE LENGTH (name)>4 AND city_id IS NULL; 'AND' es como && en javascript
-- y IS NULL es decir si el valor es null entonces 
-- la condicion es  la longitud de name es mayor a 4 y city_id si es null 
SELECT * FROM customer
WHERE LENGTH (name)>4 AND city_id IS NULL;

-- Esta Consulta es parecida a la anterior a exepcion de que ahora la city_id no deve de ser null
-- LENGTH (name)>4 AND city_id IS NOT NULL; se agrega NOT y NOT es negacion city_id es no null
SELECT * FROM customer
WHERE LENGTH (name)>4 AND city_id IS NOT NULL;

-- Consulta para filtrar los datos de customer name con WHERE, WHERE puede ser compuesto
-- con funciones como LENGHT esta funcion cuenta los caracteres y regresa un valor numerico
-- en este caso se valora WHERE LENGTH (name)>4 OR city_id IS NULL; 'OR' es como || en javascript
-- y IS NULL es decir si el valor es null entonces 
-- la condicion es  la longitud de name es mayor a 4 ó city_id si es null 
SELECT * FROM customer
WHERE LENGTH (name)>4 OR city_id IS NULL;

-- Consulta para filtrar los datos de customer name con WHERE, WHERE puede ser compuesto
-- en esta consulta se utiliza el NOT como una funcion entonces la condicion es
-- que que regrese los registros que en el name sea distinto a 'ana' WHERE NOT(name='ana')
SELECT * FROM customer
WHERE NOT(name='ana');


-- 2.Opereadores de comparación ' > , < ,>= ,<= , <> ,!= ' todo se enfocara en el WHERE 
-- este funciona en el SELECT, DELETE ,UPDATE para filtrar informacioón
-- NOTA estos operadores tambien sirven para fechas

-- Consulta donde la longitud de name es menor que a 4 operador '<'
SELECT * FROM customer
WHERE LENGTH(name) < 4;

-- Consulta donde la longitud de name es menor que ó igual 4  operador '=<'
SELECT * FROM customer
WHERE LENGTH(name) <= 4;

-- Consulta donde la longitud de name es mayor que 4 operador '>'
SELECT * FROM customer
WHERE LENGTH(name) > 4;

-- Consulta donde la longitud de name es mayor que ó igual a 4  operador '>='
SELECT * FROM customer
WHERE LENGTH(name) >= 4;

-- Consulta donde la longitud de name es distinto a 4  operador '<>'
SELECT * FROM customer
WHERE LENGTH(name) <> 4;

-- Consulta donde el name es distinto a 'ana'  operador '<>'
SELECT * FROM customer
WHERE name <> 'ana';

-- Consulta donde la longitud de name es diferente a 4  operador '!='
-- NOTA el operador '!=' es sinonimo de '<>'
SELECT * FROM customer
WHERE LENGTH(name) != 4;

-- Consulta donde  name es diferente a 'francisco'  operador '!='
-- NOTA el operador '!=' es sinonimo de '<>'
SELECT * FROM customer
WHERE name != 'francisco';

-- Consulta donde  created_at sea mayor a '2024-03-27 17:00:00' '>'
-- NOTA igual funcionacia para todos los operadores ' <,>,<=,>=,<>,!= ' siempre en la fecha poner la hora
SELECT * FROM customer
WHERE created_at  > '2024-03-27 17:00:00';

-- Consulta por dia DAY(reated_at) sea mayor a dia 25 '>'
-- NOTA DAY es una funcion que regresa el dia numerico de la fecha va a comparar todas las fechas que tengan el dia
-- si en otras fechas existe el dia > 20 regresa los registros sin tomar en cuenta el año , mes, hora 
-- entonces regresaria los registros que solo compara el dia > 20
SELECT * FROM customer
WHERE DAY(created_at)  > 20;

-- Consulta por mes MONTH(reated_at) sea mayor a mes 2 '>'
-- NOTA MONTH es una funcion que regresa el mes numerico de la fecha va a comparar todas las fechas que tengan el mes
-- si en otras fechas existe el mes > 2 regresa los registros sin tomar en cuenta el año , dia, hora 
-- entonces regresaria los registros que solo compara el dia > 20

SELECT * FROM customer
WHERE MONTH (created_at)  > 2;

-- Consulta por año YEAR(reated_at) sea mayor a mes 2023 '>'
-- NOTA YEAR es una funcion que regresa el año numerico de la fecha va a comparar todas las fechas que tengan el año
-- si en otras fechas existe el año > 2023 regresa los registros sin tomar en cuenta el mes, dia, hora 
-- entonces regresaria los registros que solo compara el año > 2023
SELECT * FROM customer
WHERE YEAR(created_at)  > 2023;

-- 3. BETWEEN (opereador de rangos) sirve para comparae rangos WHERE 
-- este funciona en el SELECT, DELETE ,UPDATE para filtrar informacioón
-- NOTA el BETWEEN lo mas regular es que se utilice con fechas 

-- Consulta BETWEEN con rango de fechas created_at BETWEEN '2023-08-24' AND '2024-08-24'; 
SELECT * FROM customer
WHERE created_at BETWEEN '2023-08-24' AND '2024-08-24';

-- Consulta BETWEEN con rango de fechas created_at BETWEEN '2023-08-24 00:00:00' AND '2024-08-24 23:59:59';
-- NOTA cuando se esta trabajando con DATETIME por elemplo created_at que tiene hora es importante poner la hora 
SELECT * FROM customer
WHERE created_at BETWEEN '2023-08-24 00:00:00' AND '2024-08-24 23:59:59';

-- Consulta BETWEEN con campos numericos ejemplo id
SELECT * FROM customer
WHERE id BETWEEN 0 AND 3;

-- Consulta BETWEEN con campos VARCHAR  ejemplo name con la Funcion SUBSTRING
-- SUBSTRING funcion que recorta una palabra SUBSTRING(name,1,1) elempl0 si name='miguel' el primer uno empesaria en 'm'
-- SUBSTRING(name,1,1) elempl0 si name='miguel' el primer caracter donde empieza el recorte en este caso 'm'
-- el segundo 1 es los caracteres que regresa name=miguel como ya renemos la 'm' recortaria hasta el 1 que igual es la 'm'
-- entonces realmente es name='miguel' SUBSTRING(name,1,1) recorta miguel desde 1 hasta 1 esto es igual a 'm'
-- y el BETWEEN seria el rango del id  1,2,3,4,5 y buscaria todos los name que tengan en su primer caracter sobre ese rengo    
SELECT SUBSTRING(name,1,1), name FROM customer
WHERE id BETWEEN 1 AND 5;


-- Consulta BETWEEN con campos VARCHAR  ejemplo name con la Funcion SUBSTRING
-- SUBSTRING funcion que recorta una palabra SUBSTRING(name,1,1) elempl0 si name='miguel' el primer uno empesaria en 'm'
-- SUBSTRING(name,1,1) elempl0 si name='miguel' el primer caracter donde empieza el recorte en este caso 'm'
-- el segundo 1 es los caracteres que regresa name=miguel como ya renemos la 'm' recortaria hasta el 1 que igual es la 'm'
-- entonces realmente es name='miguel' SUBSTRING(name,1,1) recorta miguel desde 1 hasta 1 esto es igual a 'm'
-- y el BETWEEN seria el rango a,b,c,d,e,f,g,h,i y buscaria todos los name que tengan en su primer caracter sobre ese rengo
-- No regresaria los registros que contengan el primer caracter en mayusculas
SELECT SUBSTRING(name,1,1), name FROM customer
WHERE SUBSTRING(name,1,1) BETWEEN 'a' AND 'i';

-- Consulta para transormar el caracter en mayuscula y asi pueda traer todos los registros que coincidan con el caracter
-- y rango NOTA ya que se tranformo a mayuscula el rango debe ser mayuscula
SELECT UPPER(SUBSTRING(name,1,1)), name FROM customer
WHERE UPPER( SUBSTRING(name,1,1)) BETWEEN 'A' AND 'I';

-- Consulta para transormar el caracter en minuscula y asi pueda traer todos los registros que coincidan con el caracter
-- y rango NOTA ya que se tranformo a minuscula el rango debe ser minuscula
SELECT LOWER(SUBSTRING(name,1,1)), name FROM customer
WHERE LOWER( SUBSTRING(name,1,1)) BETWEEN 'a' AND 'i';

-- 3. IN sirve para filtrar un conjunto para no estar poniendo WHERE;  y SUBQUERY

-- Consulta para clausula IN(1,2,3) seria por id cada valor
SELECT * FROM customer
WHERE id IN(1,2,3); 

-- Consulta para clausula NOT IN(1,2,3) seria por id cada valor y trairia los campos que no esten en el IN
SELECT * FROM customer
WHERE id NOT IN(1,2,3); 

-- Consulta para clausula por VARCHAR  IN('ana','francisco') seria por name cada valor y trairia los campos que esten 
-- en el IN
SELECT * FROM customer
WHERE name IN('ana','francisco'); 

-- Consulta para clausula por VARCHAR NOT IN('ana','francisco') seria por name cada valor y trairia los campos que no 
-- esten en el IN
SELECT * FROM customer
WHERE name NOT IN('ana','francisco');

-- Consulta IN con SUBCONSULTAS se busca el id de city y en el IN se hace la subconsulta para saber el city_id 
-- y asi lo compara la consulta principal con la sub consulta del IN 
SELECT * FROM city
WHERE id IN(
	SELECT city_id FROM customer
	WHERE city_id IS NOT NULL
);


-- Consulta IN con SUBCONSULTAS se busca el id de city y en el IN se hace la subconsulta para saber el city_id 
-- y asi lo compara la consulta principal con la sub consulta del IN 
-- NOTA DISTINCT hace que no se repitan los valores
SELECT * FROM city
WHERE id IN(
	SELECT DISTINCT city_id FROM customer
	WHERE city_id IS NOT NULL
);

-- Consulta IN en clausula CASE 
SELECT name,
	CASE  
		WHEN name IN('ana', 'francisco') THEN 'No aprobados'
		ELSE 'Aprobados'
	END AS 'status'
FROM customer;

-- 3. ANY y ALL trabajan parecido a IN pero esos sió si trabajan con SUBCONSULTAS no trabajan con los valores
-- separados por ,

-- Consulta agregar columna balance
-- NOTA DECIMAL(8,2) el 8 es la longitud total del numero contando decimales y 2 son los decimales que se permiten
-- resumido en ejemplo 123456.98  6 numeros enteros y 2 decimales en total serian los 8
ALTER TABLE customer 
ADD COLUMN balance DECIMAL(8,2);
SELECT * FROM customer; 

-- Consulta Crear tabla product
CREATE  TABLE produc(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	price DECIMAL(8,2)
);

-- Renombrar tabla
RENAME TABLE store.produc TO store.product;

-- Agregar valores a la tabla product
INSERT INTO product (name,price)
VALUES ('Cerveza',15),('Papas Fritas',10),('Vino tinto',20.44);

-- Consulta ANY la diferencia con IN es que puedes tener un operador de comparación
-- NOTA ANY() tiene que llevar una subconsulta
-- lo que hace la consulta es que va a traer todos los registros donde balance de customer
-- donde balance supere cualquier price de product por lo menos cumplas con la condicion de alguno de los valores
SELECT name , balance  FROM customer
WHERE balance > ANY(SELECT price FROM product);

-- Esta consulta es lo contrario a la anterior
SELECT name , balance  FROM customer
WHERE balance < ANY(SELECT price FROM product);

-- Esta consulta hace la negacion
SELECT name , balance  FROM customer
WHERE balance != ANY(SELECT price FROM product);

SELECT * FROM product;

-- Consulta ALL la diferencia con IN es que puedes tener un operador de comparación
-- NOTA ALL() tiene que llevar una subconsulta
-- lo que hace la consulta es que va a traer todos los registros donde balance de customer
-- donde balance sea mayor a ALL deves tener la comparacion que sea mayor a todo
SELECT name , balance  FROM customer
WHERE balance > ALL(SELECT price FROM product);

-- Consulta lo contrario a la consulta anterios
SELECT name , balance  FROM customer
WHERE balance < ALL(SELECT price FROM product);


-- 4. LIKE se utiliza en WHERe para busqueda de patrones
-- NOTA LIKE funciona con un conjunto de patrones

-- Consulta se selecciona el name de los customer y con el WHERE UPPER el name se transforma a mayusculas
-- LIKE(A%) es para decir que todos los name empiecen con A y el % indica que puede o no haber algo ó nuchas cosas
SELECT name FROM customer
WHERE UPPER(name) LIKE 'A%';

-- Consulta se selecciona el name de los customer y con el WHERE UPPER el name se transforma a mayusculas
-- LIKE(%A) es para decir que seleccione los name que terminen en A y el % indica que puede o no haber algo ó nuchas cosas
SELECT name FROM customer
WHERE UPPER(name) LIKE '%A';

-- Consulta se selecciona el name de los customer y con el WHERE UPPER el name se transforma a mayusculas
-- LIKE(%A%) es para decir que seleccione los name que contengan A en cualquier posicion por lo menos debe de haber una A
SELECT name FROM customer
WHERE UPPER(name) LIKE '%A%';

-- Consulta se selecciona el name de los customer y con el WHERE UPPER el name se transforma a mayusculas
-- LIKE(%RA%) es para decir que seleccione los name que contengan RA en cualquier posicion
SELECT name FROM customer
WHERE UPPER(name) LIKE '%RA%';

-- Consulta se selecciona el name de los customer y con el WHERE UPPER el name se transforma a mayusculas
-- LIKE(%A%A%) es para decir que seleccione los name que contengan dos AA en cualquier posicion
SELECT name FROM customer
WHERE UPPER(name) LIKE '%A%A%';

-- Consulta se selecciona el name de los customer y con el WHERE UPPER el name se transforma a mayusculas
-- LIKE(A%A) es para decir que seleccione los name que al principio y final A
SELECT name FROM customer
WHERE UPPER(name) LIKE 'A%A';

-- Consulta se selecciona el name y email de los customer y con el WHERE UPPER el email se transforma a mayusculas
-- '%@GMAIL.COM' es para decir que seleccione los name que al principio y final A
-- NOTA es buena practica convertir a mayusculas o minusculas para buscar mas efectivamente
SELECT name, email  FROM customer
WHERE UPPER(email) LIKE '%@GMAIL.COM';


-- Consulta se selecciona el name y email de los customer y con el WHERE UPPER el email se transforma a mayusculas
-- '__A%' busca una A en la tercera letra cada guion seria una letra cualquiera en este caso se ponen 2 __ que seria
-- dos letras antes de la A buscaria la A hasta la tercera posicion y con % cualquier cosa despues de A 
-- en pocas palabras la A tiene que estar en la tercera letra
-- NOTA es buena practica convertir a mayusculas o minusculas para buscar mas efectivamente
SELECT name, email  FROM customer
WHERE UPPER(name) LIKE '__A%';