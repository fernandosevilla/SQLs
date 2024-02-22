DROP TABLE IF EXISTS Camarero_Mesas;
DROP TABLE IF EXISTS mesas;
DROP TABLE IF EXISTS camareros;
DROP TABLE IF EXISTS restaurantes;

CREATE TABLE restaurantes (
	Id_rte INT PRIMARY KEY NOT NULL,
    nombre VARCHAR(100),
    calle VARCHAR(255),
    numero INT,
    localidad VARCHAR(255)
);

CREATE TABLE camareros (
	Id_camarero INT PRIMARY KEY NOT NULL,
    ape VARCHAR(200),
    nom VARCHAR(100),
    Id_rte INT,
    comision INT,
    FOREIGN KEY (Id_rte) REFERENCES restaurantes(Id_rte)
);

CREATE TABLE mesas (
	Id_mesa INT,
    Id_rte INT,
    numero_personas INT,
    FOREIGN KEY (Id_rte) REFERENCES restaurantes(Id_rte),
    PRIMARY KEY (Id_mesa, Id_rte)
);

CREATE TABLE Camarero_Mesas (
	Id_mesa INT,
    Id_rte INT,
	fecha DATE NOT NULL,
    turno ENUM('comida', 'cena'),
    Id_camarero INT,
	FOREIGN KEY (Id_mesa) REFERENCES mesas(Id_mesa),
	FOREIGN KEY (Id_rte) REFERENCES restaurantes(Id_rte),
	FOREIGN KEY (Id_camarero) REFERENCES camareros(Id_camarero),
	PRIMARY KEY (Id_mesa, Id_rte, fecha)
);

-- Inserciones en la tabla restaurantes
INSERT INTO restaurantes (Id_rte, nombre, calle, numero, localidad) VALUES
(1, 'Restaurante A', 'Calle A', 123, 'Madrid'),
(2, 'Restaurante B', 'Calle B', 456, 'Barcelona'),
(3, 'Restaurante C', 'Calle C', 789, 'Sevilla'),
(4, 'Restaurante D', 'Calle D', 101, 'Madrid'),
(5, 'Restaurante E', 'Calle E', 202, 'Sevilla'),
(6, 'Restaurante D', 'Calle D', 101, 'Valencia'),
(7, 'Restaurante E', 'Calle E', 202, 'Valencia');

-- Inserciones en la tabla camareros
INSERT INTO camareros (Id_camarero, ape, nom, Id_rte, comision) VALUES
(1, 'Gomez', 'Juan', 1, 10),
(2, 'Perez', 'Maria', 2, 8),
(3, 'Martinez', 'Carlos', 3, 12),
(4, 'Rodriguez', 'Laura', 4, 9),
(5, 'Lopez', 'Pedro', 5, 11),
(6, 'Jimenez', 'Hugo', 2, 15);

-- Inserciones en la tabla mesas
INSERT INTO mesas (Id_mesa, Id_rte, numero_personas) VALUES
(101, 1, 4),
(102, 1, 2),
(201, 2, 6),
(202, 2, 3),
(301, 3, 8),
(302, 3, 5),
(401, 4, 3),
(402, 4, 4),
(501, 5, 2),
(502, 5, 6),
(503, 5, 6);

-- Inserciones en la tabla Camarero_Mesas (actualizada)
INSERT INTO Camarero_Mesas (Id_mesa, Id_rte, fecha, turno, Id_camarero) VALUES
(101, 1, '2024-02-16', 'comida', 1),
(102, 1, '2024-02-16', 'cena', 1),
(201, 2, '2024-02-17', 'comida', 1),
(202, 2, '2024-02-17', 'cena', 1),
(301, 3, '2024-02-18', 'comida', 1),
(302, 3, '2024-02-18', 'cena', 1),
(401, 4, '2024-02-19', 'comida', 2),
(402, 4, '2024-02-19', 'cena', 3),
(501, 5, '2024-02-20', 'comida', 4),
(502, 5, '2024-02-20', 'cena', 5),
(503, 5, '2024-02-25', 'comida', 6);

