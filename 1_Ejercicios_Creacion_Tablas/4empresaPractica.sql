DROP TABLE IF EXISTS Asignaciones;
DROP TABLE IF EXISTS Empleados;
DROP TABLE IF EXISTS Tareas;
DROP TABLE IF EXISTS Proyectos;

CREATE TABLE Proyectos (
	proyecto_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_proyecto VARCHAR(255) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE
);

CREATE TABLE Tareas (
	tarea_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_tarea VARCHAR(255) NOT NULL,
    descripcion TEXT,
    proyecto_id INT,
    FOREIGN KEY (proyecto_id) REFERENCES Proyectos(proyecto_id) ON DELETE CASCADE
);

CREATE TABLE Empleados (
	empleado_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    cargo VARCHAR(100),
    salario DECIMAL(10,2)
);

CREATE TABLE Asignaciones (
	asignacion_id INT PRIMARY KEY AUTO_INCREMENT,
    horas_trabajadas INT,
    fecha_asignacion DATE,
    empleado_id INT,
    tarea_id INT,
	FOREIGN KEY (tarea_id) REFERENCES Tareas(tarea_id) ON DELETE CASCADE,
    FOREIGN KEY (empleado_id) REFERENCES Empleados(empleado_id) ON DELETE CASCADE
);

-- Insertar datos en la tabla Proyectos
INSERT INTO Proyectos (nombre_proyecto, fecha_inicio, fecha_fin) VALUES
('Proyecto A', '2022-03-01', '2022-05-15'),
('Proyecto B', '2021-08-15', '2021-11-30'),
('Proyecto C', '2023-01-10', '2023-06-30');

-- Insertar datos en la tabla Tareas
INSERT INTO Tareas (nombre_tarea, descripcion, proyecto_id) VALUES
('Desarrollo de funciones', 'Implementar nuevas funciones en el sistema', 1),
('Diseño de interfaz', 'Crear una interfaz de usuario atractiva', 1),
('Investigación de mercado', 'Analizar tendencias de mercado para el proyecto', 2),
('Pruebas de software', 'Realizar pruebas exhaustivas del sistema', 3);

-- Insertar datos en la tabla Empleados
INSERT INTO Empleados (nombre, cargo, salario) VALUES
('Juan Pérez', 'Desarrollador', 60000.00),
('María García', 'Diseñador UX', 55000.50),
('Carlos Rodríguez', 'Analista de Marketing', 50000.75);

-- Insertar datos en la tabla Asignaciones
INSERT INTO Asignaciones (horas_trabajadas, fecha_asignacion, empleado_id, tarea_id) VALUES
(40, '2022-03-05', 1, 1),
(30, '2022-03-07', 2, 2),
(25, '2021-09-01', 3, 3),
(35, '2023-02-15', 1, 4);
