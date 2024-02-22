DROP TABLE IF EXISTS Interacciones; -- Si existe la tabla Interacciones la borra
DROP TABLE IF EXISTS Playlist; -- Si existe la tabla Playlist la borra
DROP TABLE IF EXISTS Calificaciones; -- Si existe la tabla Calificaciones la borra
DROP TABLE IF EXISTS Usuarios; -- Si existe la tabla Usuarios la borra
DROP TABLE IF EXISTS Peliculas; -- Si existe la tabla Peliculas la borra
DROP TABLE IF EXISTS Generos; -- Si existe la tabla Generos la borra

-- Base de Datos de peliculas (practica 2)
CREATE TABLE Generos (
	idGenero INT PRIMARY KEY AUTO_INCREMENT,
    nombreGenero VARCHAR(100)
);

CREATE TABLE Peliculas (
	idPelicula INT PRIMARY KEY AUTO_INCREMENT,
    tituloPelicula VARCHAR(200),
    añoLanzamiento INT NOT NULL,
    duracion TIME NOT NULL,
    idGenero INT,
    FOREIGN KEY (idGenero) REFERENCES Generos(idGenero)
);

CREATE TABLE Usuarios (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nombreUsuario VARCHAR(200) NOT NULL
);

CREATE TABLE Calificaciones (
	idCalificacion INT PRIMARY KEY AUTO_INCREMENT,
    idPelicula INT,
    idUsuario INT,
    calificacion INT,
    FOREIGN KEY (idPelicula) REFERENCES Peliculas(idPelicula),
    FOREIGN KEY (idUsuario) REFERENCES Usuarios(idUsuario)
);

CREATE TABLE Playlist (
	idPlaylist INT PRIMARY KEY AUTO_INCREMENT,
    idUsuario INT,
    nombrePlaylist VARCHAR(200),
    idPelicula INT,
    FOREIGN KEY (idUsuario) REFERENCES Usuarios(idUsuario) ON DELETE CASCADE,
    FOREIGN KEY (idPelicula) REFERENCES Peliculas(idPelicula) ON DELETE CASCADE

);

CREATE TABLE Interacciones (
	idInteraccion INT PRIMARY KEY AUTO_INCREMENT,
    idUsuario INT,
    idPelicula INT,
    tipoInteraccion VARCHAR(200),
    FOREIGN KEY (idUsuario) REFERENCES Usuarios(idUsuario) ON DELETE CASCADE,
    FOREIGN KEY (idPelicula) REFERENCES Peliculas(idPelicula) ON DELETE CASCADE
);

-- Inserción en la tabla Generos
INSERT INTO Generos (nombreGenero) VALUES 
('Acción');
INSERT INTO Generos (nombreGenero) VALUES 
('Comedia');
INSERT INTO Generos (nombreGenero) VALUES 
('Drama');

-- Inserción en la tabla Peliculas
INSERT INTO Peliculas (tituloPelicula, añoLanzamiento, duracion, idGenero) VALUES 
('Inception', 2010, '02:28:00', 1);
INSERT INTO Peliculas (tituloPelicula, añoLanzamiento, duracion, idGenero) VALUES 
('The Hangover', 2009, '01:40:00', 2);

-- Inserción en la tabla Usuarios
INSERT INTO Usuarios (nombreUsuario) VALUES 
('Alice');
INSERT INTO Usuarios (nombreUsuario) VALUES 
('Bob');

-- Inserción en la tabla Calificaciones
INSERT INTO Calificaciones (idPelicula, idUsuario, calificacion) VALUES 
(1, 1, 5);
INSERT INTO Calificaciones (idPelicula, idUsuario, calificacion) VALUES 
(2, 2, 4);

-- Inserción en la tabla Playlist
INSERT INTO Playlist (idUsuario, nombrePlaylist, idPelicula) VALUES 
(1, 'Favoritos de Alice', 1);
INSERT INTO Playlist (idUsuario, nombrePlaylist, idPelicula) VALUES 
(2, 'Comedia de Bob', 2);

-- Inserción en la tabla Interacciones
INSERT INTO Interacciones (idUsuario, idPelicula, tipoInteraccion) VALUES 
(1, 2, 'Visualización');
INSERT INTO Interacciones (idUsuario, idPelicula, tipoInteraccion) VALUES 
(2, 1, 'Favorito');
