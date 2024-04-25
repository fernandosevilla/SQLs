-- Aunque parezca que no, he estudiado bastante lo juro xd

-- 2
SELECT Codigo, Nombre FROM PRODUCTOS
WHERE precio > AVG(precio)

ORDER BY Codigo DESC;

-- 3
SELECT c.NomApels, p.Nombre, p.precio, m.Piso 
FROM CAJEROS c, PRODUCTOS p, Venta v, MAQUINAS_REGISTRADORAS m
WHERE c.Codigo = v.Cajero
AND m.Codigo = v.Maquina
AND p.Codigo = v.Producto;

-- 4


-- 5
SELECT Producto FROM Venta
GROUP BY Producto
HAVING COUNT(Producto)
ORDER BY Producto
LIMIT 1;

-- 8 
SELECT DISTINCT v1.Producto, v2.Producto FROM Venta v1, Venta v2
WHERE v1.Cajero > v2.Cajero
AND v1.Producto > v2.Producto;

-- 9
SELECT v.Maquina FROM Venta v, MAQUINAS_REGISTRADORAS m
WHERE m.Codigo = v.Maquina







