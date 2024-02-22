DROP TABLE IF EXISTS Habilidades; -- Si existe la tabla Habilidades la borra
DROP TABLE IF EXISTS HabilidadesProyecto; -- Si existe la tabla HabilidadesProyecto la borra
DROP TABLE IF EXISTS Proyectos; -- Si existe la tabla Proyectos la borra
DROP TABLE IF EXISTS Empleados; -- Si existe la tabla Empleados la borra
DROP TABLE IF EXISTS Departamentos; -- Si existe la tabla Departamentos la borra


CREATE TABLE Departamentos (
	numeroDepartamento INT PRIMARY KEY AUTO_INCREMENT,
    nombreDepartamento VARCHAR(200),
    ubicacion VARCHAR(200)
);

CREATE TABLE Empleados (
	numeroEmpleados INT PRIMARY KEY AUTO_INCREMENT,
    nombreEmpleado VARCHAR(200) NOT NULL,
    fechaInicioEmpleo DATE,
    salario DECIMAL(10, 2),
	numeroDepartamento INT,
    FOREIGN KEY (numeroDepartamento) REFERENCES Departamentos(numeroDepartamento)
);

CREATE TABLE Proyectos (
	numeroProyecto INT PRIMARY KEY AUTO_INCREMENT,
    nombreProyecto VARCHAR(200) NOT NULL,
    fechaInicioProyecto DATE NOT NULL,
    numeroDepartamento INT,
	FOREIGN KEY (numeroDepartamento) REFERENCES Departamentos(numeroDepartamento)
);

CREATE TABLE HabilidadesProyecto (
	numeroEmpleados INT,
	numeroProyecto INT,
	numeroDepartamento INT,
    horasTrabajadas INT,
    PRIMARY KEY(numeroEmpleados, numeroProyecto, numeroDepartamento, horasTrabajadas),
	FOREIGN KEY (numeroEmpleados) REFERENCES Empleados(numeroEmpleados),
	FOREIGN KEY (numeroProyecto) REFERENCES Proyectos(numeroProyecto),
	FOREIGN KEY (numeroDepartamento) REFERENCES Departamentos(numeroDepartamento)
);

CREATE TABLE Habilidades (
	nombreHabilidad VARCHAR(200) PRIMARY KEY UNIQUE NOT NULL
);

-- Insertar datos en la tabla Departamentos
INSERT INTO Departamentos (nombreDepartamento, ubicacion) VALUES
('Departamento de Desarrollo', 'Piso 5'),
('Departamento de Recursos Humanos', 'Piso 2'),
('Departamento de Marketing', 'Piso 3');

-- Insertar datos en la tabla Empleados
INSERT INTO Empleados (nombreEmpleado, fechaInicioEmpleo, salario, numeroDepartamento) VALUES
('Juan Pérez', '2020-01-15', 50000.00, 1),
('María García', '2019-05-20', 60000.50, 2),
('Carlos Rodríguez', '2021-02-10', 45000.75, 3);

-- Insertar datos en la tabla Proyectos
INSERT INTO Proyectos (nombreProyecto, fechaInicioProyecto, numeroDepartamento) VALUES
('Proyecto A', '2022-03-01', 1),
('Proyecto B', '2021-08-15', 2),
('Proyecto C', '2023-01-10', 3);

-- Insertar datos en la tabla HabilidadesProyecto
INSERT INTO HabilidadesProyecto (numeroEmpleados, numeroProyecto, numeroDepartamento, horasTrabajadas) VALUES
(1, 1, 1, 40),
(1, 1, 1, 20),
(2, 1, 2, 30),
(3, 2, 3, 25),
(1, 3, 1, 35);

-- Insertar datos en la tabla Habilidades
INSERT INTO Habilidades (nombreHabilidad) VALUES
('Programación en Java'),
('Gestión de Proyectos'),
('Marketing Digital');
