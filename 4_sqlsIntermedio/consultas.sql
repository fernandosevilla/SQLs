-- 6 Probad a borrar el proveedor 3(NO os debe dejar).
-- DELETE FROM proveedores
-- WHERE codProv = 3;

-- 7 Modificar la clave del proveedor 1(en la tabla de Proveedores)
-- y asignarle el código 8(NO os debe dejar).
-- UPDATE proveedores 
-- SET codProv = 8 
-- WHERE codProv = 1;

-- Consultas Simples
-- 1 Obtener todos los datos de todos los proveedores
SELECT * FROM proveedores;

-- 2 Obtener el código y el nombre de todos los proveedores.
SELECT codProv, nombre FROM proveedores;

-- 3 Obtener todos los datos de las piezas.
SELECT * FROM piezas;

-- 4 Obtener un listado de existencias con los siguientes
-- datos: código, nombre y existencias.
SELECT codPieza, nomPieza, existencias FROM piezas;

-- 5 Obtener un listado con los precios de las piezas:
-- codigo, nombre, precio
SELECT codPieza, nomPieza, precio FROM piezas;

-- 6 Obtener un listado de todos los pedidos ordenados
-- por numero pedido(ORDER BY)
SELECT * FROM pedidos
ORDER BY numPed;

-- 7 Obtener un listado de pedidos: 
-- numpedido, fechapedido ordenados por fecha y numero pedido
SELECT numPed, fechaP FROM pedidos
ORDER BY fechaP, numPed;

-- 8 Obtener un listado de todas las remesas
SELECT * FROM remesas;

-- 9 Seleccionar todos los proveedores de Madrid ordenados por codigo proveedor
SELECT * FROM proveedores
WHERE poblacion = "Madrid"
ORDER BY codProv;

-- 10 Obtener el codigo y el nombre de todas aquellas
-- piezas cuyas existencias estén bajo mínimo(<5)
SELECT codPieza, nomPieza FROM piezas
WHERE existencias < 5;

-- 11 Obtener los códigos de todas las piezas
-- suministradas(sin duplicidad).
SELECT DISTINCT codPieza
FROM remesas;

-- 12 Obtener los códigos de los proveedores que nos han
-- suministrado piezas(sin duplicidad).
SELECT DISTINCT codProv FROM pedidos
WHERE numPed IN (SELECT numPed FROM remesas);

-- 13 Obtener un listado con todos los datos de los proveedores que nos han suministrado piezas(sin duplicidad). 
SELECT DISTINCT * FROM pedidos
WHERE numPed IN (SELECT numPed FROM remesas);

-- 14 Obtener un listado con el codigo, nombre de la pieza y cantidad de todas las piezas suministradas.
SELECT p.codPieza, p.nomPieza, rem.ctd FROM piezas p, remesas rem
WHERE p.codPieza = rem.codPieza;

-- 15 Obtener un listado de pedidos con los siguientes datos: numero pedido, codigo pieza, nombre pieza, cantidad suministrada

-- 16 Obtener todos los datos de los tornillos suministrados junto con la cantidad.
SELECT p.codPieza, p.nomPieza, p.peso, p.color, p.existencias, p.precio, rem.ctd
FROM piezas p, remesas rem
WHERE p.codPieza = rem.codPieza
AND p.nomPieza = "Tornillo";

-- 17 