create table clientes (id integer unique not null, name varchar(25) not null, email
varchar(50));

insert into clientes(id, name) values (1, 'Nombre 1');
insert into clientes(id, name) values (2, 'Nombre 2');
insert into clientes(id, name) values (3, 'Nombre 3');
insert into clientes(id, name, email) values (4, 'Nombre 4','a@a.cl');

update clientes set email = '' where email is null;

ALTER TABLE clientes ALTER COLUMN email SET NOT NULL;

alter table clientes add column fecha date not null default now();

UPDATE clientes SET email = COALESCE(email, 'sin email');

ALTER TABLE IF EXISTS public.clientes ALTER COLUMN email DROP NOT NULL;