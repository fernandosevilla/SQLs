-- 1 Obtener los apellidos de todos los empleados
SELECT Apellidos
FROM Empleados;

-- 2 Obtener los apellidos de los empleados sin repeticiones
SELECT DISTINCT Apellidos
FROM Empleados;

-- 3 Obtener todos los datos de los empleados que se apellidan ‘López’
SELECT * 
FROM empleados
WHERE Apellidos = "Lopez";

-- 4 Obtener todos los datos de los empleados que se apellidan ‘López’ y los que se apellidan ‘Pérez’
SELECT * 
FROM Empleados
WHERE Apellidos = "Lopez" OR Apellidos = "Perez";

-- 5 Obtener todos los datos de los empleados que trabajan para el departamento 14
SELECT * 
FROM Empleados
WHERE Departamento = 14;

-- 6 Obtener todos los datos de los empleados que trabajan para el departamento 37 y para el departamento 77
SELECT * 
FROM Empleados
WHERE Departamento = 14 OR Departamento = 77;

-- 7 Obtener todos los datos de los empleados cuyo apellido comience por ‘P’
SELECT *
FROM Empleados
WHERE Apellidos LIKE "P%";

-- 8 Obtener el número de empleados de cada departamento.
SELECT Departamento, COUNT(*)
AS Numero_Empleados_Departamento
FROM Empleados
GROUP BY Departamento;

-- 9 Obtener un listado completo de empleados, incluyendo por cada empleado los datos del empleado y su departamento
SELECT E.Nombre, E.Apellidos, D.Nombre, D.Presupuesto
FROM Empleados E, Departamentos D
WHERE E.Departamento = D.Departamento;

-- 10 Obtener un listado completo de empleados, incluyendo el nombre y apellidos del empleado junto al nombre y presupuesto de su departamento.
SELECT Empleados.DNI, Empleados.Nombre, Empleados.Apellidos, Departamentos.Departamento, Departamentos.Presupuesto
FROM Empleados INNER JOIN Departamentos
ON Empleados.Departamento = Departamentos.Departamento;

-- 11 . Obtener los nombres y apellidos de los empleados que trabajen en departamentos cuyo presupuesto sea mayor de 60.000€
SELECT D.Nombre, D.Presupuesto, E.Nombre, E.Apellidos
FROM Departamentos D
JOIN Empleados E ON D.Departamento = E.Departamento
WHERE E.Departamento = D.Departamento AND D.Presupuesto > 60000
ORDER BY D.Presupuesto;

-- 12 Obtener los datos de los departamentos cuyo presupuesto es superior al presupuesto medio de todos los departamentos.
SELECT Departamento, Nombre, Presupuesto
FROM Departamentos
WHERE Presupuesto > (SELECT AVG(Presupuesto) FROM Departamentos);

-- 13 Obtener los nombres de los departamentos que tienen más de dos empleados
SELECT D.Nombre, COUNT(E.DNI) AS Num_Empleados
FROM 

-- 14 Añadir un nuevo departamento que se llame ‘Reciclaje’ con prepuesto de 40000€ y código 22.
-- Añadir un empleado vinculado al departamento recién creado: Esther García, con DNI 123456789S
-- INSERT INTO Departamentos (Departamento, Nombre, Presupuesto) VALUES
-- (22, 'Reciclaje', 40000);
-- INSERT INTO Empleados (DNI, Nombre, Apellidos, Departamento) VALUES
-- (12345679, 'Esther', 'García', 22);

-- 15 Aplicar un recorte presupuestario del 10% a todos los departamentos
UPDATE Departamentos SET Presupuesto = Presupuesto * 0.9;

-- 16. Reasignar a los empleados del departamento de investigación (código 14) al
-- departamento de naturaleza (código 9)
UPDATE Empleados
SET Departamento = 9
WHERE Departamento = 14;

-- 17. Despedir a todos los empleados que trabajan para el departamento de informática
-- (código 14)
DELETE FROM Empleados WHERE Departamento = 11;

-- 18. Despedir a todos los empleados que trabajen para departamentos cuyo presupuesto
-- sea superior a los 60.000€
DELETE FROM Empleados WHERE Departamento IN (SELECT Presupuesto FROM Departamentos WHERE Presupuesto > 60000);

-- 19. Despedir a todos los empleados.
DELETE FROM Empleados;
