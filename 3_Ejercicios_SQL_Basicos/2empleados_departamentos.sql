DROP TABLE IF EXISTS Empleados;
DROP TABLE IF EXISTS Departamentos;

CREATE TABLE Departamentos (
	Departamento INT PRIMARY KEY,
	Nombre NVARCHAR(100),
	Presupuesto INT
);

CREATE TABLE Empleados (
	DNI VARCHAR(8) PRIMARY KEY,
    Nombre NVARCHAR(100),
    Apellidos NVARCHAR(250),
    Departamento INT,
    FOREIGN KEY (Departamento) REFERENCES Departamentos(Departamento)
);

-- Insertar datos en la tabla Departamentos
INSERT INTO Departamentos (Departamento, Nombre, Presupuesto) VALUES
	(1, 'Ventas', 50000),
	(2, 'Recursos Humanos', 80000),
	(3, 'Producción', 60000),
	(4, 'Investigacion', 90000),
	(5, 'ASDF', 5000),
	(14, 'Desarrollo', 70000),
	(77, 'Diseño', 223);


-- Insertar datos en la tabla Empleados
INSERT INTO Empleados (DNI, Nombre, Apellidos, Departamento) VALUES
	('12345678', 'Juan', 'Pérez', 1),
	('12345665', 'Roberto', 'Pérez', 2),
	('23456789', 'María', 'González', 77),
	('34567890', 'Carlos', 'López', 2),
	('45678901', 'Laura', 'Martínez', 2);
