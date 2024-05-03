-- DQL  El Lenguaje de Consulta de Datos es el sublenguaje responsable de leer, o consultar, datos de una base de datos. En SQL, corresponde al SELECT

-- DML  El Lenguaje de Manipulación de Datos es el sublenguaje responsable de añadir, editar o borrar datos de una base de datos.
-- En SQL, corresponde a los lenguajes INSERT, UPDATE, y DELETE

-- DDL  El Lenguaje de Definición de Datos es el sublenguaje responsable de definir la forma en que se estructuran los datos en una base de datos.
-- En SQL, esto corresponde a la manipulación de tablas a través de CREATE TABLE, ALTER TABLE, y DROP TABLE

-- DCL  El Lenguaje de Control de Datos es el sublenguaje responsable de las tareas administrativas de control de la propia base de datos, especialmente la concesión y revocación de permisos de base de datos para los usuarios.
-- En SQL, esto corresponde a los comandos GRANT, REVOKE, y DENY, entre otros.

insert into comida_chilena (id, nombre) values ('1','Pastel de choclo');
insert into comida_chilena (id, nombre) values ('2', 'Umitas');

select * from comida_chilena;

UPDATE comida_chilena set nombre='Humitas' where id = 2;

insert into comida_chilena (id, nombre) values ('3','Cazuela');
insert into comida_chilena (id, nombre) values ('4','Charquican');
insert into comida_chilena (id, nombre) values ('5','shurrasco');

-- se elimina el dato con el id 2
DELETE from comida_chilena where id = '2'; 

-- se eliminan todos los registros de la tabla
DELETE from comida_chilena;

insert into comida_chilena (id, nombre) values ('6','Empanada chilena');

delete from comida_chilena where id in (3, 4, 5);

delete from comida_chilena where id = 5 and id = 3;

delete from comida_chilena where id = 5 or id = 3;

create table mascotas (id int , nombre varchar(50), raza varchar(50), edad int);

insert into mascotas (id, nombre, raza, edad) values ('1','Princesa', 'Poodle', 10);
insert into mascotas (id, nombre, raza, edad) values ('2','Chorizo', 'Salchicha', 2);
insert into mascotas (id, nombre, raza, edad) values ('3','Spike', 'Bulldog', 5);
insert into mascotas (id, nombre, raza, edad) values ('4','Peter', 'Gato', 4);
insert into mascotas (id, nombre, raza, edad) values ('5','Chiko', 'Siames', 7);
insert into mascotas (id, nombre, raza, edad) values ('6','Simon', 'Maine', 6);

select * from mascotas;

update mascotas set nombre = 'Espike' where id = 3;
update mascotas set edad = 12 where id = 1;

delete from mascotas where id = 5;

alter table mascotas add primary key(id);