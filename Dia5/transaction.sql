create database transacciones;
\c transacciones;

create table cuentas (numero_cuenta int primary key, balance float
check(balance >= 0.00));

insert into cuentas (numero_cuenta, balance) values (1, 1000);
insert into cuentas (numero_cuenta, balance) values (2, 1000);

begin transaction;
UPDATE cuentas set balance = balance - 1000 where numero_cuenta = 1;
UPDATE cuentas set balance = balance + 1000 where numero_cuenta = 2;
select * from cuentas;

commit;

insert into cuentas (numero_cuenta, balance) values (3, 1000);

begin transaction;
UPDATE cuentas set balance = balance - 1000 where numero_cuenta = 3;
select * from cuentas;

SAVEPOINT descuento3;

UPDATE cuentas set balance = balance + 1000 where numero_cuenta = 1;
select * from cuentas;

ROLLBACK TO descuento3;

UPDATE cuentas set balance = balance + 1000 where numero_cuenta = 2;
select * from cuentas;

commit;