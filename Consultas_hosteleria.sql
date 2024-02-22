-- 1 Los datos de los camareros (id, apellido y nombre) que han atendido más de 5 mesas
SELECT DISTINCT c.Id_camarero, c.ape, c.nom, COUNT(*) AS Mesas_Atendidas
FROM camareros c, Camarero_Mesas caMesas
WHERE c.Id_camarero = caMesas.Id_camarero
GROUP BY c.Id_camarero
HAVING COUNT(*) > 5;

-- 2 Listar parejas de restaurantes que estén en la misma ciudad y que no se repitan
SELECT DISTINCT r1.Id_rte AS Restaurante1, r2.Id_rte AS Restaurante1, r1.localidad
FROM restaurantes r1, restaurantes r2
WHERE r1.localidad = r2.localidad
AND r2.Id_rte > r1.Id_rte;

-- 3 Listar los camareros con su id, apellido y nombre que han trabajado solo en el turno de comida
CREATE OR REPLACE VIEW camareros_comida AS 
SELECT DISTINCT c.Id_camarero, c.ape, c.nom FROM camareros c, Camarero_Mesas cam
WHERE c.Id_camarero = cam.Id_camarero
AND cam.turno = "comida";

CREATE OR REPLACE VIEW camareros_cena AS 
SELECT DISTINCT c.Id_camarero, c.ape, c.nom FROM camareros c, Camarero_Mesas cam
WHERE c.Id_camarero = cam.Id_camarero
AND cam.turno = "cena";

SELECT * FROM camareros_comida
WHERE Id_camarero
NOT IN (SELECT Id_camarero FROM camareros_cena);

-- 4 Listar los camareros con su id, nombre y apellidos que han atendido mas mesas que todos los camareros
-- que trabajan en el "Restaurante B"
CREATE OR REPLACE VIEW camareros_restaurante AS 
SELECT COUNT(*) AS contador
FROM camarero_mesas cm 
WHERE cm.Id_rte = 2;

CREATE OR REPLACE VIEW mesas_atendidas AS 
SELECT Id_camarero, COUNT(*) AS NMesas 
FROM camarero_mesas cm2
GROUP BY Id_camarero;

SELECT Id_camarero, ape, nom
FROM camareros
WHERE Id_camarero 
IN (SELECT Id_camarero FROM mesas_atendidas ma, camareros_restaurante cr
	WHERE ma.NMesas > cr.contador);