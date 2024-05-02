-- Pasos para iniciar el proyecto

-- Link del video: https://youtu.be/Qx8zcFo8Uag

-- 1. ingresar a postgres

psql -U postgres

-- 2. crear la base de datos 

CREATE DATABASE desafioPabloHernandez;

-- 3. ingresar a la base de datos

\c desafiopablohernandez

-- 4. crear una tabla llamada clientes 

create table clientes(email varchar(50), nombre varchar, telefono varchar(16), empresa varchar(50), prioridad smallint);

-- 5. insertar datos en la tabla clientes
insert into clientes (email, nombre, telefono, empresa, prioridad) 
values ('pabloh@gmail.com', 'Pablo Hernandez', '123456789', 'Google', 9);
insert into clientes (email, nombre, telefono, empresa, prioridad) 
values ('frankieA@gmail.com', 'Franco Araya', '122222222', 'Banco de Chile', 8);
insert into clientes (email, nombre, telefono, empresa, prioridad) 
values ('CathePincheira@gmail.com', 'Catherina Pincheira', '133333333', 'PetSociety', 2);
insert into clientes (email, nombre, telefono, empresa, prioridad) 
values ('berLeiva@gmail.com', 'Bernardita Leiva', '144444444', 'DT', 4);
insert into clientes (email, nombre, telefono, empresa, prioridad) 
values ('MaxiMadrid@gmail.com', 'Maximiliano Madrid', '555555555', 'Atlass', 7);

select * from clientes;

-- 6. seleccionar los clientes de mayor prioridad

select * from clientes order by prioridad desc limit 3;

-- 7. Selecciona, de la tabla clientes, una prioridad o una empresa, de forma que el resultado devuelva 2 registros

select * from clientes where prioridad > 8  or empresa = 'Banco de Chile';

-- 7. Salir de la base de datos

\q