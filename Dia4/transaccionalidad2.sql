create database restricciones_psql;

create table company (id serial primary key, nombre varchar not null unique);

insert into company(nombre) values('Amazon');
insert into company(nombre) values('Apple');