-- =====================Usar Base de Datos=====================
use store;

-- =====================Constraints ó restricciones=====================
-- Sirve para validar datos especificamente  tener coherencia con los datos

-- 1. CONSTRAINT PRIMARY KEY
-- sirve para darle al registro de la tabla un identificador unico, 
-- no es nulo y siempre tiene que tener un valor tiene el UNIQUE por default
CREATE TABLE city(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50)
);
SELECT * FROM city;

-- 2. CONSTRAINT NOT NULL
-- Sirve para que el campo no sea nulo 'null' null es aucencia de valor
-- PRIMER name es como se llama la columna segundo name como se modifica
-- haciendo esto en este caso name ya no acepta null 
ALTER TABLE city
CHANGE COLUMN
	name
	name VARCHAR(50) NOT NULL;
-- ahora si quisiera insertar un registro no lo aceptaria tiene que llevar un string porque se declaro
-- como VARCHAR
INSERT INTO city (name)
VALUES (NULL);

INSERT INTO city (name)
VALUES ('CDMX');

-- 2. CONSTRAINT UNIQUE tambien es un INDICE por lo que es mas rapido al consultar por ese campo
-- Sirve para que en una columna no se repitan campos
ALTER TABLE city
ADD UNIQUE(name);

-- No me permite ingresar el registro porque ya existe CDMX
INSERT INTO city (name)
VALUES ('CDMX');

-- Nota cuando hay un error de insercion de UNIQUE y se inserta un dato el id aumenta por el error
-- Aqui si me permite insertarlo porque guadalajara no existe en la columna name
INSERT INTO city (name)
VALUES ('Guadalajara');
SELECT * FROM city;

INSERT INTO city (name)
VALUES ('Ciudad Gusmán');
SELECT * FROM city;

-- 3. CONSTRAINT DEFAULT 
-- Nota esto funciona solamente si la columna no existe
ALTER TABLE customer
ADD COLUMN currency VARCHAR(3) DEFAULT 'MXN';
SELECT * FROM customer;

-- Aqui no se le manda currency ya que el valor por default es 'MXN'
INSERT INTO customer  (name,email)
VALUES ('rodrigo','rodrigo@gmail.com');
SELECT * FROM customer;

-- Aqui se le manda currency y la priorirad es el valor que se manda el default lo ignora
INSERT INTO customer  (name,email,currency)
VALUES ('rodrigo1','rodrigo1@gmail.com','USD');
SELECT * FROM customer;

ALTER TABLE customer
ADD COLUMN created_at DATETIME

-- Se agrega el constrain DEFAULT y asignando el timestamp por default
ALTER TABLE customer
ALTER created_at SET DEFAULT CURRENT_TIMESTAMP() ;
SELECT * FROM customer;

-- al hacer un nuevo registro ya tiene el timestamp
INSERT INTO customer  (name,email)
VALUES ('chucho','chucho@gmail.com');
SELECT * FROM customer;

-- 3. CONSTRAINT INDEX funciona para que las consultas sean mas rapidad dependiendo 
-- el campo de consulta, no es recomendable ponerle indices a todo defecto mas lento el insert, update , delete

-- insertar Indice
 CREATE INDEX idx_name
 ON customer(name);

-- Borrar Indice
ALTER TABLE customer
DROP INDEX idx_name;

-- 4. CONSTRAINT CHECK sirve para darle reglas de negocio a la columna el operador <> es 
-- para que acepte diferente a abc
-- Crear Constraint CHECK
ALTER TABLE customer 
ADD CONSTRAINT check_name
CHECK (name <> 'abc');

INSERT INTO customer  (name,email)
VALUES ('abc1','chucho1@gmail.com');

SELECT * FROM customer;

-- muestra como se a creado la tabla
SHOW CREATE TABLE customer;

-- Borrar Constraint CHECK 
ALTER TABLE customer 
DROP CONSTRAINT check_name;

-- Crear regla para fecha
ALTER TABLE customer 
ADD CONSTRAINT created_at
CHECK (created_at < '1990-01-01');

-- 4. CONSTRAINT FOREIGN KEY relacion de tabla tambien es un indice
-- para agregar clave foranea primero se agrega el campo la variable tiene que ser igual ala PRIMARY KEY
ALTER TABLE customer 
ADD COLUMN city_id INT;

-- Despues se agrega el constraint fk_city y se hace FOREIGN key(city_id) REFERENCES city(id); para
-- hacer referencia a la clave de city  
ALTER TABLE customer
ADD CONSTRAINT fk_city
FOREIGN key(city_id) REFERENCES city(id);

-- Nota no se puede agregar en city_id que no existan en el PK id de la tabla city
INSERT INTO customer (name,email,city_id)
VALUES ('JUan','juanito@gmail.com', 4);

SELECT * FROM city;
SELECT * FROM customer;

 
