CREATE TABLE IF NOT EXISTS INSCRITOS(cantidad INT, fecha DATE, fuente
VARCHAR);
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 44, '01/01/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 56, '01/01/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 39, '01/02/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 81, '01/02/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/03/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 91, '01/03/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 48, '01/04/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 45, '01/04/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 55, '01/05/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 33, '01/05/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 18, '01/06/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 12, '01/06/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 34, '01/07/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 24, '01/07/2021', 'Página' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 83, '01/08/2021', 'Blog' );
INSERT INTO INSCRITOS(cantidad, fecha, fuente)
VALUES ( 99, '01/08/2021', 'Página' );


-- 1. ¿Cuántos registros hay?

select COUNT(cantidad) as cantidad_registros FROM inscritos;
/*
 cantidad_registros
--------------------
                 16
*/

Hay un total de 16 registros en la base de datos

-- 2. ¿Cuántos inscritos hay en total?

select sum(cantidad) as total_inscritos from inscritos;
/*
 total_inscritos
-----------------
             774
*/

El total de inscritos es de 774

-- 3. ¿Cuál o cuáles son los registros de mayor antigüedad?

select cantidad, fecha from inscritos order by fecha asc limit 1;

/*
 cantidad |   fecha
----------+------------
       44 | 2021-01-01
*/

La cantidad de inscritos en la fecha de 2021-01-01 fueron 44 inscritos

-- 4. ¿Cuántos inscritos hay por día? (entendiendo un día como una fecha distinta de ahora en adelante)

select fecha, sum(cantidad) as registros_por_dia from inscritos group by fecha;
/*
   fecha    | registros_por_dia
------------+-------------------
 2021-02-01 |               120
 2021-08-01 |               182
 2021-05-01 |                88
 2021-04-01 |                93
 2021-06-01 |                30
 2021-07-01 |                58
 2021-03-01 |               103
 2021-01-01 |               100
*/

Se puede verificar en la tabla las distintas fechas y la cantidad de inscritos en ese día

-- 5. ¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se inscribieron en ese día?

select fecha, sum(cantidad) as suma_registros from inscritos group by fecha order by suma_registros desc limit 1;
/*
   fecha    | suma_registros
------------+----------------
 2021-08-01 |            182
*/

El día que hubo una mayor cantidad de inscritos fue 2021-08-01 con un total de 182 registros