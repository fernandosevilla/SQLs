DROP TABLE IF EXISTS Inscripciones; -- Si existe la tabla Inscripciones la borra
DROP TABLE IF EXISTS Cursos; -- Si existe la tabla Cursos la borra
DROP TABLE IF EXISTS Estudiantes; -- Si existe la tabla Estudiantes la borra

-- Crear tabla de estudiantes con clave primaria
CREATE TABLE Estudiantes (
	EstudianteID INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Edad INT,
    Carrera VARCHAR(50)
);

-- Crear tabla de cursos con clave primaria
CREATE TABLE Cursos (
	CursoID INT PRIMARY KEY,
    NombreCurso VARCHAR (50) NOT NULL
);

-- Crear tabla de inscripciones con claves primitivas y externas, sin permitir valores nulos
CREATE TABLE Inscripciones (
	InscripcionID INT PRIMARY KEY,
	EstudianteID INT NOT NULL,
    CursoID INT NOT NULL,
    FechaInscripcion DATE,
    FOREIGN KEY (EstudianteID) REFERENCES Estudiantes(EstudianteID),
    FOREIGN KEY (CursoID) REFERENCES Cursos(CursoID)
);

INSERT INTO Estudiantes (EstudianteID, Nombre, Edad, Carrera) VALUES
(1, 'Juan Pérez', 20, 'Ingeniería Informática'),
(2, 'María Rodríguez', 22, 'Ciencias de Datos'),
(3, 'Carlos López', 21, 'Matemáticas');

INSERT INTO Cursos (CursoID, NombreCurso) VALUES
(101, 'Bases de Datos'),
(102, 'Programación'),
(103, 'Estadísticas');

INSERT INTO Inscripciones (InscripcionID, EstudianteID, CursoID, FechaInscripcion) VALUES
(1001, 1, 101, '2023-01-01'),
(1002, 2, 102, '2023-01-03'),
(1003, 3, 103, '2023-01-01');
