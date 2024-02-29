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

-- 17 Obtener un listado de todas las puntillas 
-- suministradas de color dorado, cuyo peso sea superior a 50 y cuya
-- cantidad suministrada sea igual o superior a
-- 100 ordenados por numero pedido con los siguientes datos:
-- CODPIEZA, CANTIDAD
SELECT rem.codPieza, rem.ctd FROM remesas rem, piezas p, pedidos ped
WHERE rem.codPieza = p.codPieza
AND rem.numPed = ped.numPed
AND p.peso > 50
AND p.nomPieza = "Puntillas"
AND p.color = "Dorado"
AND rem.ctd >= 100
ORDER BY rem.numPed;

-- 18 obtener un listado de todos aquellos pedidos de los 
-- proveedores de ALCAZAR a partir de marzo del 2009
-- ordenados por fecha,codigo proveedor, y numero de pedido
-- con los siguientes datos: fecha, codigo proveedor, nombre
-- proveedor, numero pedido
SELECT p.fechaP, pr.codProv, pr.nombre, p.numPed
FROM pedidos p, proveedores pr
WHERE p.codProv = pr.codProv
AND pr.poblacion = "Alcazar"
AND p.fechaP >= "2009-03-01"
ORDER BY p.fechaP, pr.codProv, p.numPed;
 
-- 19 Obtener las remesas del proveedor FERSA con los siguientes datos:
-- fecha pedido, numero pedido, codigo pieza, cantidad. 
-- (ordenados por la fecha del pedido)
SELECT p.fechaP, p.numPed, rem.codPieza, rem.ctd
FROM pedidos p, remesas rem, proveedores prov
WHERE p.numPed = rem.numPed
AND p.codProv = prov.codProv
AND prov.nombre = "Fersa"
ORDER BY p.fechaP;

-- 20 Seleccionar todas las piezas suministradas durante el
-- mes de enero(BETWEEN) y con un importe superior a
-- 1000, con los siguientes datos:
-- codigo pieza, nombre pieza, fecha pedido, precio, cantidad, importe
SELECT rem.codPieza, p.nomPieza, ped.fechaP, p.precio, rem.ctd,
(rem.ctd * p.precio) AS importe
FROM remesas rem, piezas p, pedidos ped
WHERE rem.codPieza = p.codPieza
AND rem.numPed = ped.numPed
AND ped.fechaP BETWEEN "2009-01-01" AND "2009-01-31"
AND (rem.ctd * p.precio) > 1000;

-- 21 Seleccionar las tuercas suministradas por los
-- proveedores de MADRID y de ALCAZAR ordenados por población
-- y numero pedido, con los siguientes datos: codigo proveedor, 
-- nombre proveedor, poblacion, numero pedido, codigo pieza, cantidad
SELECT pr.codProv, pr.nombre, pr.poblacion, ped.numPed,
rem.codPieza, rem.ctd
FROM proveedores pr, pedidos ped, remesas rem, piezas p
WHERE pr.codProv = ped.codProv
AND ped.numPed = rem.numPed
AND rem.codPieza = p.codPieza
AND p.nomPieza = "Tuerca"
AND (pr.poblacion = "Madrid" OR pr.poblacion = "Alcazar")
ORDER BY pr.poblacion, ped.numPed;

-- 22 Seleccionar todos aquellos pedidos que no sean de marzo(NOT BETWEEN)
-- ordenados por poblacion, codigoproveedor, fecha pedido,
-- numero pedido con los siguientes datos:
-- poblacion, codigo proveedor, nombre proveedor, fecha pedido,
-- numero pedido, codigo pieza, nombre pieza, cantidad
SELECT pr.poblacion, pr.codProv, pr.nombre, ped.fechaP,
ped.numPed, rem.codPieza, p.nomPieza, rem.ctd
FROM proveedores pr, pedidos ped, remesas rem, piezas p
WHERE pr.codProv = ped.codProv
AND ped.numPed = rem.numPed
AND rem.codPieza = p.codPieza
AND ped.fechaP NOT BETWEEN "2024-03-01" AND "2024-03-31"
ORDER BY pr.poblacion, pr.codProv, ped.fechaP, ped.numPed;

-- 23 Seleccionar todos los pedidos de enero y abril
-- (con importes) del proveedor FERSA con los siguientes datos
-- (ordenados por fecha y numero pedido):
-- fecha pedido, numero pedido, codigo pieza, nombre pieza,
-- precio, cantidad, importe(campo calculado)
SELECT ped.fechaP, ped.numPed, rem.codPieza, p.nomPieza,
p.precio, rem.ctd, (rem.ctd * p.precio) AS importe
FROM pedidos ped, remesas rem, piezas p, proveedores prov
WHERE ped.numPed = rem.numPed
AND rem.codPieza = p.codPieza
AND ped.codProv = prov.codProv
AND prov.nombre = "Fersa"
AND ((MONTH(ped.fechaP) = 1 OR MONTH(ped.fechaP) = 4))
ORDER BY ped.fechaP, ped.numPed;

-- 24 - Añadir los siguientes datos(registros) correspondientes al proveedor
-- numero 6 en sus respectivas tablas:
-- PROVEEDORES(6, NUEVO, ALCAZAR); PEDIDOS(13, 25/04/2012) y
-- 2 remesas: REMESAS(13, 2, 100) y REMESAS(13, 3, 50)
-- INSERT INTO proveedores (codProv, nombre, poblacion) VALUES
-- (6, "Nuevo", "Alcazar");
-- INSERT INTO pedidos (numPed, fechaP, codProv) VALUES
-- (13, "2012/04/25", 6);
-- INSERT INTO remesas (numPed, codPieza, ctd) VALUES
-- (13, 2, 50),
-- (13, 3, 50);

-- 25 Cambiar la poblacion del proveedor FERSA de ALCAZAR a MADRID.
UPDATE proveedores
SET poblacion = "Madrid"
WHERE nombre = "Fersa" AND poblacion = "Alcazar";

-- 26 Realizar las operaciones pertinentes para borrar la pieza numero 6
-- Borramos las remesas relacionadas con la pieza 6
DELETE FROM remesas
WHERE codPieza = 6;
-- Borramos la pieza 6
DELETE FROM piezas
WHERE codPieza = 6;

-- 27 Realizar las operaciones pertinentes para borrar el pedido numero 5
-- Borramos las remesas relacionadas con el pedido 5
DELETE FROM remesas
WHERE numPed = 5;
-- Borramos el pedido 5
DELETE FROM pedidos
WHERE numPed = 5;

-- 28 Intentad borrar todo lo relacionado con el 
-- Proveedor numero 2(lo normal es que NO seáis capaces de
-- conseguirlo por el momento)
-- Borramos las remesas relacionadas con el proveedor 2
DELETE FROM remesas
WHERE numPed IN (SELECT numPed 
                FROM pedidos 
                WHERE codProv = 2);

DELETE FROM pedidos
WHERE codProv = 2;

DELETE FROM proveedores
WHERE codProv = 2;

-- 29A Modificar el codigo de pieza 1 al codigo 101
-- UPDATE piezas
-- SET codPieza = 101
-- WHERE codPieza = 1;

-- 29B - Realizar las operaciones pertinentes
-- para cambiar el codigo del proveedor FERSA al 110(NOTA: esto se debe
-- hacer sin conocer el código del proveedor FERSA).

-- 30 Obtener el número de proveedores que tenemos.
SELECT COUNT(codProv) AS Num_Proveedores FROM proveedores;

-- 31A Obtener el número de piezas que tenemos
SELECT COUNT(codPieza) AS Num_Piezas FROM piezas;

-- 31B Obtener el número de tipos de piezas
-- (¡¡ojo!! No es tan fácil en ACCESS y SÍ en MYSQL, ORACLE, …)
SELECT COUNT(DISTINCT nomPieza) AS Num_Tipos_Piezas
FROM piezas;

-- 32A Obtener el número de poblaciones
SELECT COUNT(poblacion) AS numero_poblaciones
FROM proveedores;

-- 32B Obtener el número de poblaciones distintas(¡¡ojo!! Idem a 31.BIS)
SELECT DISTINCT COUNT(poblacion) AS numero_poblaciones
FROM proveedores;

-- 33 Obtener el número de pedidos realizados hasta el momento
SELECT COUNT(*) AS numero_pedidos
FROM pedidos;

-- 34 Obtener el valor total del stock de piezas
SELECT SUM(existencias * precio) AS Valor_Total_Piezas
FROM piezas;

-- 35 Obtener el importe total de todas las remesas realizadas hasta el momento


-- 36 