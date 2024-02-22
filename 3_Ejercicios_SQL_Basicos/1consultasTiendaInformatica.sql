-- 1 Los nombres de los articulos
SELECT nombreArticulo FROM Articulos;

-- 2 Los nombres y el precio de cada articulo
SELECT nombreArticulo, precio FROM Articulos;

-- 3 Los nombres y el precio de cada articulo y que se muestre como si se cambiara el nombre de la columna precio a Euros (NO SE CAMBIA, SOLO ES VISUAL EN LA CONSULTA)
SELECT nombreArticulo, precio AS Euros FROM Articulos;

-- 4 Nombre de los articulos cuyo precio sea menor que 200
SELECT nombreArticulo, precio FROM Articulos
WHERE precio < 200;

-- 5.1 Articulos con precio entre 60 y 120 con AND
SELECT * FROM Articulos
WHERE precio >= 60 AND precio <= 120;
    
-- 5.2 Articulos con precio entre 60 y 120 con BETWEEN
SELECT * FROM Articulos
WHERE precio BETWEEN 60 AND 120;

-- 6 Articulos y su precio en pesetas (multiplicando * 166.386)
SELECT nombreArticulo, precio * 166.368 AS Pesetas FROM Articulos;

-- 7 El precio medio de todos los productos
SELECT AVG(precio) AS Precio_Medio FROM Articulos;

-- 8 El precio medio de todos los productos del fabricante 2
SELECT AVG(precio) AS Precio_Medio
FROM Articulos
WHERE codigoFabricante=2;

-- 9 Articulos y precio de aquellos que sea mayor o igual a 180 ordenados por precio de mayor a menor
SELECT nombreArticulo, precio
FROM Articulos
WHERE precio >= 180
ORDER BY precio DESC, nombreArticulo; -- DESC lo ordena de mayor a menor, si no ponemos DESC el ORDER BY interpretara que lo ordenamos de menor a mayor (es como lo tiene por defecto)
    
-- 10.1 Listado de articulos con toda su informacion y su fabricante
SELECT Articulos.codigoArticulo, Articulos.nombreArticulo, Articulos.precio, Fabricantes.nombreFabricante AS Fabricante
FROM Articulos, Fabricantes
WHERE Articulos.codigoFabricante = Fabricantes.codigoFabricante;

-- 10.2 Listado de articulos con toda su informacion y su fabricante con JOIN
SELECT Articulos.codigoArticulo, Articulos.nombreArticulo, Articulos.precio, Fabricantes.nombreFabricante AS Fabricante
FROM Articulos INNER JOIN Fabricantes
ON Articulos.codigoFabricante = Fabricantes.codigoFabricante;

-- 11 Listado de articulos, incluyendo nombre, precio y nombre de fabricante
SELECT Articulos.nombreArticulo, Articulos.precio, Fabricantes.nombreFabricante AS NombreFabricante
FROM Articulos, Fabricantes
WHERE Articulos.codigoFabricante = Fabricantes.codigoFabricante;
    
-- 12 Precio medio de los productos de cada fabricante, mostrando solo su codigo
SELECT codigoFabricante, AVG(precio) AS Precio_Medio
FROM Articulos
GROUP BY (codigoFabricante);

-- 13.1 Precio medio de los productos de cada fabricante, mostrando solo su nombre
SELECT nombreFabricante, AVG(precio) AS Precio_Medio
FROM Articulos, Fabricantes
GROUP BY (nombreFabricante);

-- 14 Fabricantes y sus nombres que ofrezcan productos cuyo precio medio sea > 150€
SELECT nombreFabricante, AVG(precio) AS Precio_Medio
FROM Articulos, Fabricantes
WHERE Articulos.codigoFabricante = Fabricantes.codigoFabricante
GROUP BY (nombreFabricante)
HAVING AVG(precio) > 150;

-- 15 Obtener el nombre y precio del articulo mas barato (Subconsulta)
SELECT nombreArticulo, precio
FROM Articulos
WHERE precio = (SELECT MIN(precio) FROM Articulos);

-- 16 Una lista con el nombre y precio de los articulos mas caros de cada fabricante (mostrar su nombre)
SELECT A.nombreArticulo, F.nombreFabricante, A.precio
FROM Articulos A, Fabricantes F
WHERE A.codigoFabricante = F.codigoFabricante
AND A.precio = (SELECT MAX(precio)
				FROM Articulos A
				WHERE A.codigoFabricante = F.codigoFabricante);

-- 17 Añadir un nuevo producto al fabricante 2
/*
DELETE FROM Articulos
WHERE codigoArticulo = 190;

INSERT INTO Articulos (codigoArticulo, nombreArticulo, precio, codigoFabricante) VALUES
(112, 'Producto Nuevo', 120, 2);
*/

-- 18 Cambiar el nombre de un producto
UPDATE Articulos
SET nombreArticulo = "Cambio Nombre"
WHERE codigoArticulo = 101;

-- 19 Aplicar un descuento de 10€ a todos los productos cuyo precio sea mayor o igual a 120€
UPDATE Articulos
SET precio = precio - 10
WHERE precio >= 120;

-- 20 Aplicar un descuento del 10% a todos los productos
UPDATE Articulos
SET precio = precio * 0.9;
