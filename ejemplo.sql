DROP TABLE IF EXISTS Empleados; -- Si existe la tabla Empleados la borra
DROP TABLE IF EXISTS Departamentos; -- Si existe la tabla Departamentos la borra

-- Creamos la tabla Departamentos
CREATE TABLE Departamentos (
	idDepartamentos INT PRIMARY KEY,
    nombreDepartamento VARCHAR(100)
);

-- Creamos la tabla Empleados
CREATE TABLE Empleados (
	idEmpleados INT PRIMARY KEY,
    idDepartamentos INT NOT NULL,
    Nombre VARCHAR(100),
    Salario DECIMAL(10, 2),
  	FOREIGN KEY (idDepartamentos) REFERENCES Departamentos(idDepartamentos)
);

INSERT INTO Departamentos (idDepartamentos, nombreDepartamento) VALUES
(1, 'Recursos Humanos'),
(2, 'Tecnología de la Información'),
(3, 'Marketing'),
(4, 'Finanzas'),
(5, 'Ventas');

INSERT INTO Empleados (idEmpleados, idDepartamentos, Nombre, Salario) VALUES
(101, 1, 'Ana Martínez', 30000.00),
(102, 2, 'Jorge López', 35000.50),
(103, 3, 'Laura Jiménez', 32000.75),
(104, 1, 'Roberto Fernández', 30500.00),
(105, 4, 'Sofía García', 38000.00),
(106, 2, 'Carlos Hernández', 34000.20),
(107, 5, 'Luisa Pérez', 31000.00);
