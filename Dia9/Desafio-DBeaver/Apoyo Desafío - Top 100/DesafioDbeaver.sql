create database DesafioDbeaver;

-- 2.- importamos la data de los archivos csv

-- 3.- obtener el id de la pelicula Titanic

select p.id, p.pelicula from peliculas p where p.pelicula = 'Titanic';

-- nos entrega el ID y nombre de la pelicula

-- 4. Listar a todos los actores que aparecen en la película "Titanic"

select r.actor from reparto r where r.id_pelicula = '2';

-- nos entrega el listado de los actores de reparto en "Titanic"

--5. Consultar en cuántas películas del top 100 participa Harrison Ford.

SELECT COUNT(*) FROM reparto r WHERE r.actor = 'Harrison Ford' AND r.id_pelicula IN (SELECT p.id FROM peliculas p WHERE Anio >= 1990 AND Anio <= 1999);

-- cuenta las participaciones del actor Harrison Ford en el top de 100 peliculas de la lista

--6. Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título demanera ascendente.

SELECT * FROM peliculas WHERE anio_estreno >= 1990 AND anio_estreno <= 1999 ORDER BY pelicula ASC;

-- muestra las peliculas que se estrenaron entre 1990 y 1999 de forma ascendente

-- 7.  Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”.

SELECT pelicula, LENGTH(pelicula) AS longitud_titulo FROM peliculas;

-- muestra la cantidad de letras que tienen los titulos de las peliculas

-- 8. Consultar cual es la longitud más grande entre todos los títulos de las películas

SELECT MAX(LENGTH(pelicula)) AS longitud_maxima FROM peliculas;

-- muestra la longitud maxima de un titulo de una pelicula

