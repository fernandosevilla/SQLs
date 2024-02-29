DROP TABLE IF EXISTS fichajes;
DROP TABLE IF EXISTS Juega_En;
DROP TABLE IF EXISTS jugadores;
DROP TABLE IF EXISTS equipos;
DROP TABLE IF EXISTS estadios;

CREATE TABLE estadios (
	idEstadio INT PRIMARY KEY NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(100) NOT NULL
);

CREATE TABLE equipos (
	idEquipo INT PRIMARY KEY NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    ciudad_sede VARCHAR(100) NOT NULL,
    estadio INT NOT NULL,
    FOREIGN KEY (estadio) REFERENCES estadios(idEstadio)
);

CREATE TABLE jugadores (
	idJugador INT PRIMARY KEY NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(200) NOT NULL,
    fecha_nacimiento DATE NOT NULL
);

CREATE TABLE Juega_En (
	jugador INT NOT NULL,
    equipo INT NOT NULL,
    temporada VARCHAR(50) NOT NULL,
    FOREIGN KEY (jugador) REFERENCES jugadores(idJugador),
    FOREIGN KEY (equipo) REFERENCES equipos(idEquipo),
    PRIMARY KEY (jugador, equipo, temporada)
);

CREATE TABLE fichajes (
	jugador INT NOT NULL,
    temporada VARCHAR(50) NOT NULL,
    equipo_vende INT NOT NULL,
    equipo_compra INT NOT NULL,
    precio DECIMAL NOT NULL,
    FOREIGN KEY (jugador) REFERENCES jugadores(idJugador),
    FOREIGN KEY (equipo_vende) REFERENCES equipos(idEquipo),
    FOREIGN KEY (equipo_compra) REFERENCES equipos(idEquipo),
    PRIMARY KEY (jugador, temporada)
);

-- Datos de prueba para la tabla estadios
INSERT INTO estadios (idEstadio, nombre, ciudad) VALUES
(1, 'Santiago Bernabéu', 'Madrid'),
(2, 'Camp Nou', 'Barcelona'),
(3, 'Wanda Metropolitano', 'Madrid');

-- Datos de prueba para la tabla equipos
INSERT INTO equipos (idEquipo, nombre, ciudad_sede, estadio) VALUES
(1, 'Real Madrid', 'Madrid', 1),
(2, 'FC Barcelona', 'Barcelona', 2),
(3, 'Atlético de Madrid', 'Madrid', 3);

-- Datos de prueba para la tabla jugadores
INSERT INTO jugadores (idJugador, nombre, apellidos, fecha_nacimiento) VALUES
(1, 'Cristiano', 'Ronaldo', '1985-02-05'),
(2, 'Lionel', 'Messi', '1987-06-24'),
(3, 'Karim', 'Benzema', '1987-12-19');

-- Datos de prueba para la tabla Juega_En
INSERT INTO Juega_En (jugador, equipo, temporada) VALUES
(1, 1, 'Temporada 2022'),
(2, 2, 'Temporada 2022'),
(3, 1, 'Temporada 2022');

-- Datos de prueba para la tabla fichajes
INSERT INTO fichajes (jugador, temporada, equipo_vende, equipo_compra, precio) VALUES
(1, 'Temporada 2022', 2, 1, 10.00),
(2, 'Temporada 2022', 1, 2, 12.00),
(3, 'Temporada 2022', 3, 1, 80.00);
