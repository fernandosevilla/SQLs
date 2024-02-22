-- 1 Obtener todos los almacenes
SELECT * FROM almacenes;

-- 2 Obtener todas las cajas cuyo contenido tenga un valor superior a 150€
SELECT * FROM cajas
WHERE valor > 150;

-- 3 Obtener los tipos de contenidos de las cajas
SELECT numReferencia, contenido FROM cajas;

-- 4 Obtener el valor medio de todas las cajas
SELECT AVG(valor) AS Valor_Medio FROM cajas;

-- 5 Obtener el valor medio de las cajas de cada almacén
SELECT a.codigo, a.lugar, AVG(c.valor) AS ValorMedio
FROM almacenes a
JOIN cajas c ON a.codigo = c.codigoAlmacen
GROUP BY a.codigo, a.lugar;

-- 6 Obtener los códigos de los almacenes en los cuales el valor medio de las cajas sea superior a 150€
SELECT a.codigo
FROM almacenes a
JOIN cajas c ON a.codigo = c.codigoAlmacen
GROUP BY a.codigo
HAVING AVG(c.valor) > 150;

-- 7 Obtener el número de referencia de cada caja junto con el nombre de la ciudad en el que se encuentra
SELECT c.numReferencia, a.lugar
FROM cajas c
JOIN almacenes a ON c.codigoAlmacen = a.codigo;

-- 8 Obtener el número de cajas que hay en cada almacén
SELECT codigoAlmacen, COUNT(*) AS NumeroCajas FROM cajas
INNER JOIN almacenes ON almacenes.codigo = cajas.codigoAlmacen
GROUP BY almacenes.codigo;

-- 9 Obtener los códigos de los almacenes que están saturados 
-- (los almacenes donde el número de cajas es superior a la capacidad)
SELECT a.codigo FROM almacenes a
WHERE capacidad < (SELECT COUNT(*) FROM cajas
WHERE cajas.codigoAlmacen = a.codigo);

-- 10 Obtener los números de referencia de las cajas que están en Bilbao
SELECT c.numReferencia FROM cajas c
JOIN almacenes a ON c.codigoAlmacen = a.codigo
WHERE a.lugar = 'Bilbao';

-- 11 Insertar un nuevo almacén en Barcelona con capacidad para 3 cajas
-- INSERT INTO almacenes (codigo, lugar, capacidad) VALUES
-- (4, 'Barcelona', 3);

-- 12 Insertar una nueva caja, con número de referencia “HTY7P”, 
-- con contenido “Metal”, valor 400 y situada en el almacén 3
INSERT INTO cajas (numReferencia, contenido, valor, codigoAlmacen) VALUES
('HTY7P', 'Metal', 400, 3);

-- 13 Rebajar el valor de todas las cajas un 15%
SELECT 

-- 14 Rebajar un 20% el valor de todas las cajas cuyo valor sea 
-- superior al valor medio de todas las cajas


-- 15  Eliminar todas las cajas cuyo valor sea inferior a 100€
DELETE FROM cajas
WHERE valor < 100;

-- 16 Vaciar el contenido de los almacenes que están saturados.
