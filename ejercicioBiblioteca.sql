DROP TABLE IF EXISTS Prestamos; -- Si existe la tabla Prestamos la borra
DROP TABLE IF EXISTS Usuarios; -- Si existe la tabla Usuarios la borra
DROP TABLE IF EXISTS CopiasLibros; -- Si existe la tabla CopiasLibros la borra
DROP TABLE IF EXISTS Libros; -- Si existe la tabla Libros la borra
DROP TABLE IF EXISTS Autores; -- Si existe la tabla Autores la borra

CREATE TABLE Autores (
	idAutor INT PRIMARY KEY,
    nombreAutor VARCHAR(50) NOT NULL
);

CREATE TABLE Libros (
	idLibro INT PRIMARY KEY,
    nombreLibro VARCHAR(50) NOT NULL,
    idAutor INT NOT NULL,
    FOREIGN KEY (idAutor) REFERENCES Autores(idAutor)
);

CREATE TABLE CopiasLibros (
	idCopia INT PRIMARY KEY,
    IdLibro INT,
    UNIQUE (idLibro, idCopia),
    FOREIGN KEY (idLibro) REFERENCES Libros(IdLibro)
);

CREATE TABLE Usuarios (
	idUsuario INT PRIMARY KEY,
    nombreUsuario VARCHAR(50) NOT NULL,
    direccionUsuario VARCHAR(100) NOT NULL,
    numTlf INT NOT NULL
);

-- Crear una tabla llamada Prestamos
CREATE TABLE Prestamos (
    idPrestamo INT PRIMARY KEY, -- Identificador único del préstamo
    fechaPrestamo DATE NOT NULL, -- Fecha en que se realizó el préstamo (no puede ser nula)
    fechaDevolucion DATE NOT NULL, -- Fecha en que se debe devolver el préstamo (no puede ser nula)
    idUsuario INT NOT NULL, -- Identificador del usuario que realizó el préstamo (no puede ser nulo)
    idCopia INT, -- Identificador de la copia del libro prestado (puede ser nulo)
    devuelto BOOLEAN DEFAULT FALSE, -- Indica si el libro ha sido devuelto (valor predeterminado: FALSE)
    FOREIGN KEY (idCopia) REFERENCES CopiasLibros(idCopia), -- Clave externa que referencia la tabla CopiasLibros y su columna idCopia
    FOREIGN KEY (idUsuario) REFERENCES Usuarios(idUsuario), -- Clave externa que referencia la tabla Usuarios y su columna idUsuario
    CHECK (devuelto IN (0, 1)) -- Restricción que asegura que devuelto solo puede ser 0 o 1
);


INSERT INTO Autores (idAutor, nombreAutor) VALUES
(1, 'Gabriel García Márquez'),
(2, 'J.K. Rowling'),
(3, 'Isabel Allende'),
(4, 'George R.R. Martin'),
(5, 'Haruki Murakami');

INSERT INTO Libros (idLibro, nombreLibro, idAutor) VALUES
(101, 'Cien años de soledad', 1),
(102, 'Harry Potter y la piedra filosofal', 2),
(103, 'La casa de los espíritus', 3),
(104, 'Juego de tronos', 4),
(105, 'Kafka en la orilla', 5);

INSERT INTO CopiasLibros (idCopia, idLibro) VALUES
(1001, 101),
(1002, 102),
(1003, 103),
(1004, 104),
(1005, 105),
(1006, 101); -- Ejemplo de otra copia del mismo libro

INSERT INTO Usuarios (idUsuario, nombreUsuario, direccionUsuario, numTlf) VALUES
(201, 'Ana Torres', 'Calle Falsa 123, Ciudad Ficticia', 5551234),
(202, 'Luis Gómez', 'Avenida Principal 456, Gran Ciudad', 5555678),
(203, 'Sofía Rodríguez', 'Urbanización La Paz, Calle 12', 5559012),
(204, 'Carlos Pérez', 'Barrio San Juan, Manzana 5', 5553456),
(205, 'Lucía Hernández', 'Residencias El Sol, Apartamento 3B', 5557890);

INSERT INTO Prestamos (idPrestamo, fechaPrestamo, fechaDevolucion, idUsuario, idCopia, devuelto) VALUES
(301, '2024-01-10', '2024-01-24', 201, 1001, FALSE),
(302, '2024-01-12', '2024-01-26', 202, 1002, TRUE),
(303, '2024-01-14', '2024-01-28', 203, 1003, FALSE),
(304, '2024-01-16', '2024-01-30', 204, 1004, TRUE),
(305, '2024-01-18', '2024-02-01', 205, 1005, FALSE);
