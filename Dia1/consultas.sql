-- lo primero a realizar es conectarse a la base de datos
psql -U postgres
-- crear una base de datos
CREATE DATABASE prueba1;

-- \l listar las bases de datos
\l
-- \c nombre_base_de_datos cambia de base de datos
\c prueba1

-- salir de la terminal de postgres
\q

-- CREACION DE UNA TABLA
-- VARCHAR -> STRING
create table clientes(
nombre varchar(30),
apellido varchar(30)
);

-- BORRAR CONTENIDO DE UNA TABLA
delete table nombre_tabla;

-- BORRAR BASE DE DATOS
drop database nombre_base_de_datos;

-- BORRAR TABLAS
drop table nombre_tabla;

-- listar las tablas de una base de datos
\d
-- listar las columnas de una tabla
\d clientes
\d+ clientes

-- Insertar datos en la tabla

insert into clientes (nombre, apellido) values ('Pablo','Hernandez');
insert into clientes (nombre, apellido) values ('Israel','Palma');
insert into clientes (nombre, apellido) values ('Najla','Gatica');

-- consultar registros en una tabla

SELECT * FROM clientes;

-- funciones

SELECT * FROM productos order by LENGTH(nombre_producto)

SELECT *, LENGTH(nombre_producto) FROM productos order by
LENGTH(nombre_producto)

SELEC *, LEFT(categoria, 3) AS codigo FROM productos;

--FUNCIONES AÑADIDAS
-- GENERICOS
SELECT SUM(columna) FROM tabla;

SELECT AVG(columna) FROM tabla;

SELECT MAX(columna) FROM tabla;

SELECT MIN(columna) FROM tabla;

SELECT COUNT(columna) FROM tabla;

SELECT SUM(precio) FROM PRODUCTOS;

-- GROUP BY

SELECT max(precio) from productos GROUP BY categoria;

-- ERROR:  la columna «productos.nombre_producto» debe aparecer en la cláusula GROUP BY o ser usada en una función de agregación
SELECT nombre_producto, max(precio) from productos GROUP BY categoria;

-- IN () filtrar o comprobar si un valor existe en una lista determinada

SELECT * FROM productos WHERE id_producto IN (20,1,55,3);

-- MODIFICAR UNA TABLA

ALTER TABLE nombre_tabla add primary key(rut);
