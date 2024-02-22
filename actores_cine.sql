DROP TABLE IF EXISTS actuar;
DROP TABLE IF EXISTS pases;
DROP TABLE IF EXISTS salas;
DROP TABLE IF EXISTS peliculas;
DROP TABLE IF EXISTS directores;
DROP TABLE IF EXISTS actores;
DROP TABLE IF EXISTS personas;

CREATE TABLE personas (
	idPersona INT PRIMARY KEY,
    apellidos VARCHAR(50),
    nombre VARCHAR(50)
);

CREATE TABLE actores (
	idPersona INT,
    FOREIGN KEY (idPersona) REFERENCES personas(idPersona)
);

CREATE TABLE directores (
	idPersona INT,
    nacionalidad VARCHAR(100),
    FOREIGN KEY (idPersona) REFERENCES personas(idPersona)
);

CREATE TABLE peliculas (
	idPelicula INT PRIMARY KEY,
    titulo VARCHAR(100),
    duracion VARCHAR(100),
    genero VARCHAR(50),
    director INT,
    sueldo DECIMAL,
    FOREIGN KEY (director) REFERENCES directores(idPersona)
);

CREATE TABLE salas (
	idSala INT PRIMARY KEY,
    planta INT,
    filas INT,
    butacas INT
);

CREATE TABLE pases (
	idSala INT,
    dia INT,
    hora VARCHAR(20),
    idPelicula INT,
    FOREIGN KEY (idSala) REFERENCES salas(idSala),
    FOREIGN KEY (idPelicula) REFERENCES peliculas(idPelicula),
    PRIMARY KEY (idSala, dia, hora)
);

CREATE TABLE actuar (
    idPelicula INT,
	actor INT,
    personaje VARCHAR(50),
    sueldo DECIMAL,
    FOREIGN KEY (idPelicula) REFERENCES peliculas(idPelicula),
    FOREIGN KEY (actor) REFERENCES actores(idPersona),
    PRIMARY KEY (idPelicula, actor)
);

INSERT INTO personas (idPersona, apellidos, nombre) VALUES
(1, 'González', 'Carlos'),
(2, 'López', 'María'),
(3, 'Martínez', 'Juan'),
(4, 'Rodríguez', 'Ana'),
(5, 'Pérez', 'Pedro'),
(6, 'Fernández', 'Laura'),
(7, 'Gómez', 'Diego');

INSERT INTO actores (idPersona) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7);

INSERT INTO directores (idPersona, nacionalidad) VALUES
(1, 'Mexicano'),
(2, 'Español'),
(3, 'Estadounidense'),
(4, 'Argentino'),
(5, 'Italiano'),
(6, 'Francés'),
(7, 'Brasileño');

INSERT INTO peliculas (idPelicula, titulo, duracion, genero, director, sueldo) VALUES
(1, 'Matrix', '120 minutos', 'Acción', 1, 500000),
(2, 'La La Land', '128 minutos', 'Acción', 1, 600000),
(3, 'Origen', '150 minutos', 'Acción', 1, 700000),
(4, 'El Caballero de la Noche', '152 minutos', 'Acción', 1, 800000),
(5, 'La Vida es Bella', '116 minutos', 'Acción', 1, 450000),
(6, 'Los Vengadores', '122 minutos', 'Romance', 6, 550000),
(7, 'xdxdxd', '130 minutos', 'Crimen', 7, 750000);

INSERT INTO salas (idSala, planta, filas, butacas) VALUES
(1, 1, 10, 20),
(2, 2, 8, 15),
(3, 3, 12, 25),
(4, 1, 9, 18),
(5, 2, 10, 22),
(6, 3, 7, 14),
(7, 1, 11, 24);

INSERT INTO pases (idSala, dia, hora, idPelicula) VALUES
(1, 1, '15:00', 1),
(2, 2, '18:30', 2),
(3, 3, '21:00', 3),
(4, 1, '14:15', 4),
(5, 2, '16:45', 5),
(6, 3, '20:30', 6),
(7, 1, '19:15', 7);

INSERT INTO actuar (idPelicula, actor, personaje, sueldo) VALUES
(1, 1, 'Neo', 300000),
(1, 2, 'Trinity', 280000),
(2, 3, 'Sebastián', 320000),
(2, 4, 'Mia', 300000000),
(6, 5, 'Cobb', 350000),
(6, 6, 'Mal', 330000),
(6, 7, 'Joker', 400000);
