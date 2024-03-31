-- =====================Crear Base de Dados ===================== 
CREATE SCHEMA `store` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;

-- =====================Usar Base de Datos=====================
use store;

-- =====================Crear Tabla=====================
CREATE TABLE customer(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(100)
);

-- =====================Agregar columna a la tabla=====================
ALTER TABLE customer
ADD COLUMN email VARCHAR(200) NOT NULL UNIQUE;

-- =====================Borrar tabla y todos sus registros=====================
DROP TABLE customer;