CREATE TABLE autores (
 id INT PRIMARY KEY,
 nombre VARCHAR(255) NOT NULL
);

CREATE TABLE libros (
 id INT PRIMARY KEY,
 titulo VARCHAR(255) NOT NULL,
 autor_id INT NOT NULL,
 FOREIGN KEY (autor_id) REFERENCES autores (id)
);

INSERT INTO autores (id, nombre)
VALUES
 (1, 'Juan Pérez'),
 (2, 'María García'),
 (3, 'Pedro Rodríguez');

INSERT INTO libros (id, titulo, autor_id)
VALUES
 (1, 'El Quijote', 1),
 (2, 'La Divina Comedia', 2),
 (3, 'Hamlet', 3);