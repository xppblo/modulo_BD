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


1. ¿Cuántos registros hay?

select COUNT(cantidad) FROM inscritos;
/*
 count
-------
   16
*/

2. ¿Cuántos inscritos hay en total?

select sum(cantidad) from inscritos;
/*
sum
-----
774
*/
3. ¿Cuál o cuáles son los registros de mayor antigüedad?

select * from inscritos order by fecha asc limit 1;

/*
 cantidad |   fecha    | fuente
----------+------------+--------
       44 | 2021-01-01 | Blog
*/

4. ¿Cuántos inscritos hay por día? (entendiendo un día como una fecha distinta de
ahora en adelante)

select fecha, sum(cantidad) from inscritos group by fecha;
/*
   fecha    | sum
------------+-----
 2021-02-01 | 120
 2021-08-01 | 182
 2021-05-01 |  88
 2021-04-01 |  93
 2021-06-01 |  30
 2021-07-01 |  58
 2021-03-01 | 103
 2021-01-01 | 100
*/

5. ¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se
inscribieron en ese día?

select fecha, sum(cantidad) from inscritos group by fecha order by sum(cantidad) desc limit 1;
/*
   fecha    | sum
------------+-----
 2021-08-01 | 182
*/