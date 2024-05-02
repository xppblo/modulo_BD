-- Esto es un comentario

SELECT * FROM demo;

-- seleciona solo el nombre
SELECT name FROM demo;
SELECT id FROM demo;
SELECT hint FROM demo;
SELECT name,hint FROM demo;

-- CLAUSAULA where -> filtrar, condiciona
SELECT * FROM demo where id = 5;
SELECT * FROM demo where hint = '300';

-- WHERE con OR
SELECT * FROM demo where id = 5 or id = 8; 

-- WHERE con AND
SELECT * FROM demo where id < 5 AND id >= 2;

-- CLAUSULA Limit
SELECT * FROM demo LIMIT 2;

-- CLAUSULA ORDER BY
SELECT * FROM demo ORDER BY id DESC;
SELECT * FROM demo ORDER BY name DESC;


CREATE DATABASE pablo
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LOCALE_PROVIDER = 'libc'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;
