create database bbdd_gimnasios;

\c bbdd_gimnasios;

create table clientes(nombre varchar(50), apellido varchar(50), rut int,
email varchar(50));

alter table clientes add primary key(rut);

create table matriculas(monto varchar(50), estado boolean, cliente_rut
int references clientes(rut));

insert into clientes values ('Cliente 1', 'Apellido cliente 1',
'999999999', 'cliente1@email.com');
insert into clientes values ('Cliente 2', 'Apellido cliente 2',
'888888888', 'cliente2@email.com');
insert into clientes values ('Cliente 3', 'Apellido cliente 3',
'777777777', 'cliente3@email.com');
insert into clientes values ('Cliente 4', 'Apellido cliente 4',
'666666666', 'cliente4@email.com');
insert into clientes values ('Cliente 5', 'Apellido cliente 5',
'555555555', 'cliente5@email.com');

insert into matriculas values ('40000', True, '999999999');
insert into matriculas values ('40000', False, '888888888');
insert into matriculas values ('55000', True, '555555555');
insert into matriculas values ('35000', True, '777777777');
insert into matriculas values ('60000', False, '666666666');

select email, rut, monto, estado from clientes inner join matriculas on
clientes.rut = cliente_rut;

-- manera correcta de llamar a las tablas debido a que pueden compartir nombres en las tablas
-- mejor especificar dando un alias a la tabla

select cli.email, cli.rut, mat.monto, mat.estado 
from clientes cli
inner join matriculas mat
on cli.rut = mat.cliente_rut
order by mat.monto;

select cliente_rut, count(cliente_rut) from matriculas group by cliente_rut having
count(cliente_rut) >= 2;

