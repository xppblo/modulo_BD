-- Paso 1: Creamos la base de datos con el nombre Mawashi Phones.
create database mawashi_phones;
-- Paso 2: Nos conectamos a la base de datos.
\c mawashi_phones;

--Paso 3: Creamos la tabla con los campos que nos solicita inicialmente el cliente.
create table phones (
    id int primary key, 
    modelo varchar(50), 
    mac_address int unique,
    fecha_fabricacion varchar(50)
    );

--Paso 4: Insertamos un registro para probar la tabla.
insert into phones (id, modelo, mac_address, fecha_fabricacion) values (1, 'Iphone 14', '1B:2A:3C:4D:5F:6G', '2022-09-09');
--ERROR:  invalid input syntax for type integer: "1B:2A:3C:4D:5F:6G"
--LINE 1: ...dress, fecha_fabricacion) values (1, 'Iphone 14', '1B:2A:3C:...

-- Paso 5: Modificamos el tipo de dato definido en el campo mac_address.
alter table phones alter column mac_address type varchar(50);

-- Paso 6
\d phones;

--Paso 7: Insertamos nuevamente el registro.
insert into phones (id, modelo, mac_address, fecha_fabricacion) values (1, 'Iphone 14', '1B:2A:3C:4D:5F:6G', '2022-09-09');

--Paso 8: Con el alter table también podemos agregar nuevas restricciones sin reescribir las ya existentes.
alter table phones alter column mac_address set not null;

insert into phones (id, modelo, fecha_fabricacion)  values (2, 'Iphone 15',  '2022-09-09');
--ERROR:  null value in column "mac_address" of relation "phones" violates not-null constraint
--DETAIL:  Failing row contains (2, Iphone 15, null, 2022-09-09).

insert into phones (id, modelo, mac_address, fecha_fabricacion) values (2, 'Iphone 15', null, '2022-09-09');
--ERROR:  null value in column "mac_address" of relation "phones" violates not-null constraint
--DETAIL:  Failing row contains (2, Iphone 15, null, 2022-09-09).

DROP TABLE phones;

CREATE USER pablohernandez WITH PASSWORD 'Admin1234';

CREATE DATABASE pablohernandez WITH OWNER pablohernandez;

ALTER USER pablohernandez WITH SUPERUSER CREATEDB CREATEROLE;

psql -U pablohernandez

CREATE TABLE autores (
    id serial PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

CREATE TABLE libros (
    id serial PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    autor_id INT NOT NULL,
    FOREIGN KEY (autor_id) REFERENCES autores (id) ON DELETE CASCADE
);

INSERT INTO autores ( nombre)
VALUES
( 'Juan Pérez'),
( 'María García'),
('Pedro Rodríguez');

INSERT INTO libros (titulo, autor_id)
VALUES
( 'El Quijote', 1),
( 'La Divina Comedia', 2),
( 'Hamlet', 3);

truncate libros; 
truncate libros RESTART IDENTITY;
truncate autores RESTART IDENTITY CASCADE;