-- INNER JOIN

/*
SELECT *
FROM TABLAA A  -- LA TABLAA corresponde a la tabla que tenga solo PK
INNER JOIN TABLAB B
ON A.KEY = B.KEY;
*/

SELECT *
FROM productos A
INNER JOIN pedidos_detalle B
ON A.id_producto = B.id_producto;

INSERT INTO productos (id_producto, nombre, precio)
VALUES (14, 'Producto 14', 25.74);

INSERT INTO productos (id_producto, nombre, precio)
VALUES (15, 'Producto 15', 20.74);

-- LEFT JOIN

/*
SELECT *
FROM TABLAA A  -- LA TABLAA corresponde a la tabla que tenga solo PK
LEFT JOIN TABLAB B
ON A.KEY = B.KEY 
WHERE B.KEY IS NULL;
*/

SELECT *
FROM productos A  
LEFT JOIN pedidos_detalle B
ON A.id_producto = B.id_producto 
WHERE B.id_producto IS NULL;

-- RIGHT JOIN

/*
SELECT *
FROM TABLAA A  -- LA TABLAA corresponde a la tabla que tenga solo PK
RIGHT JOIN TABLAB B
ON A.KEY = B.KEY 
WHERE B.KEY IS NULL;
*/

SELECT *
FROM productos A  
RIGHT JOIN pedidos_detalle B
ON A.id_producto = B.id_producto 
WHERE A.id_producto IS NULL;