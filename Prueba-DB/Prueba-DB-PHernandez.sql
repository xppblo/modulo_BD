-- Video : https://www.youtube.com/watch?v=V4DGWL5hcD0&ab_channel=PabloHernándezLeiva


-- 1. Crea el modelo (revisa bien cuál es el tipo de relación antes de crearlo), respeta las claves primarias, foráneas y tipos de datos.

CREATE TABLE peliculas(
    id INT PRIMARY KEY,
    nombre VARCHAR,
    anno INT
);

CREATE TABLE tags(
    id INT PRIMARY KEY,
    tag VARCHAR
);

CREATE TABLE peliculas_tags(
    id INT PRIMARY KEY,
    pelicula_id INT,
    tag_id INT,
    FOREIGN KEY (pelicula_id) REFERENCES peliculas(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

-- 2. Inserta 5 películas y 5 tags, la primera película tiene que tener 3 tags asociados, la segunda película debe tener dos tags asociados

INSERT INTO peliculas (id, nombre, anno) VALUES (1, 'Pelicula 1', 1999),
(2, 'Pelicula 2', 2000),
(3, 'Pelicula 3', 2005),
(4, 'Pelicula 4', 2010),
(5, 'Pelicula 5', 2020);

INSERT INTO tags VALUES (1, 'Terror'),
(2, 'Suspenso'),
(3, 'Accion'),
(4, 'Romance'),
(5, 'Comedia');

INSERT INTO peliculas_tags VALUES (1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 2),
(5, 2, 4);

-- 3. Cuenta la cantidad de tags que tiene cada película. Si una película no tiene tags debe mostrar 0.


SELECT p.nombre, COUNT(pt.id) as numero_tags
FROM peliculas p 
LEFT JOIN peliculas_tags pt ON p.id = pt.pelicula_id 
GROUP BY p.nombre 
ORDER BY 2 desc;

-- parte 2

-- 4. Crea las tablas respetando los nombres, tipos, claves primarias y foráneas y tipos de datos.


CREATE TABLE preguntas(
    id INT PRIMARY KEY,
    pregunta VARCHAR,
    respuesta_correcta VARCHAR
);

CREATE TABLE usuarios(
    id INT PRIMARY KEY,
    nombre VARCHAR,
    edad INT
);

CREATE TABLE respuestas(
    id INT PRIMARY KEY,
    respuesta VARCHAR,
    usuario_id INT,
    pregunta_id INT,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (pregunta_id) REFERENCES preguntas(id)
);

-- Insertar preguntas en la tabla preguntas

INSERT INTO preguntas (id, pregunta, respuesta_correcta) VALUES
(1,'¿Cuál es la capital de Francia?', 'París'),
(2,'¿Qué es H2O?', 'Agua'),
(3,'¿Cuál es la fórmula química del agua?', 'H2O'),
(4,'¿Quién escribió "Don Quijote"?', 'Cervantes'),
(5,'¿Cuál es el planeta más cercano al sol?', 'Mercurio');

-- Insertar usuarios en la tabla usuarios
INSERT INTO usuarios (id, nombre, edad) VALUES
(1, 'Juan', 30),
(2, 'María', 25),
(3, 'Carlos', 22);

-- Insertar respuestas en la tabla respuestas
-- Pregunta 1 (correcta para dos usuarios)
INSERT INTO respuestas (id, respuesta, usuario_id, pregunta_id) VALUES
(1 ,'París', 1, 1),
(2, 'París', 2, 1);

-- Pregunta 2 (correcta para un usuario)
INSERT INTO respuestas (id, respuesta, usuario_id, pregunta_id) VALUES
(3, 'Agua', 3, 2);

-- Pregunta 3 (incorrecta)
INSERT INTO respuestas (id, respuesta, usuario_id, pregunta_id) VALUES
(4, 'Dióxido de carbono', 1, 3);

-- Pregunta 4 (incorrecta)
INSERT INTO respuestas (id, respuesta, usuario_id, pregunta_id) VALUES
(5, 'Shakespeare', 2, 4);

-- Cuenta la cantidad de respuestas correctas totales por usuario (independiente de la pregunta).

SELECT 
    u.nombre,
    COUNT(r.id) AS respuestas_correctas
FROM 
    usuarios u
JOIN 
    respuestas r ON u.id = r.usuario_id
JOIN 
    preguntas p ON r.pregunta_id = p.id
WHERE 
    r.respuesta = p.respuesta_correcta
GROUP BY 
    u.id, u.nombre;

-- 7. Por cada pregunta, en la tabla preguntas, cuenta cuántos usuarios tuvieron la respuesta correcta.

SELECT 
    p.pregunta,
    COUNT(r.id) AS usuarios_correctos
FROM 
    preguntas p
LEFT JOIN 
    respuestas r ON p.id = r.pregunta_id AND r.respuesta = p.respuesta_correcta
GROUP BY 
    p.id, p.pregunta;

-- 8. Implementa borrado en cascada de las respuestas al borrar un usuario y borrar el primer usuario para probar la implementación.

-- Agregar una nueva clave foránea con ON DELETE CASCADE
ALTER TABLE respuestas ADD CONSTRAINT respuestas_ibfk_1
FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE;

-- Eliminar el primer usuario (con id = 1)
DELETE FROM usuarios WHERE id = 1;

-- 9. Crea una restricción que impida insertar usuarios menores de 18 años en la base de datos.

-- Agregar la restricción CHECK para impedir usuarios menores de 18 años
ALTER TABLE usuarios
ADD CONSTRAINT chk_edad CHECK (edad >= 18);

-- Prueba insertando un usuario menor de 18 años
INSERT INTO usuarios (id, nombre, edad) VALUES (6, 'Pedro', 17);

-- Prueba insertando un usuario mayor de 18 años
INSERT INTO usuarios (id, nombre, edad) VALUES (6,'Luis', 20);

-- 10. Altera la tabla existente de usuarios agregando el campo email con la restricción de único.

-- Agregar la columna email a la tabla usuarios
ALTER TABLE usuarios
ADD COLUMN email VARCHAR(255);

-- Agregar la restricción UNIQUE a la columna email
ALTER TABLE usuarios
ADD CONSTRAINT unique_email UNIQUE (email);

-- Prueba insertando un usuario con un email único
INSERT INTO usuarios (id, nombre, edad, email) VALUES (7, 'Ana', 22, 'ana@example.com');

-- Prueba insertando otro usuario con un email diferente 
INSERT INTO usuarios (id, nombre, edad, email) VALUES (8, 'Juan', 30, 'juan@example.com');

-- Prueba insertando otro usuario con el mismo email que Ana 
INSERT INTO usuarios (id, nombre, edad, email) VALUES (9, 'Carlos', 25, 'ana@example.com');



