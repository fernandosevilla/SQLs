DROP TABLE IF EXISTS remesas;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS piezas;
DROP TABLE IF EXISTS proveedores;

CREATE TABLE proveedores (
    codProv INT PRIMARY KEY NOT NULL,
    nombre VARCHAR(50) UNIQUE NOT NULL,
    poblacion VARCHAR(50) NOT NULL
);

CREATE TABLE piezas (
    codPieza INT PRIMARY KEY NOT NULL,
    nomPieza VARCHAR(50) NOT NULL,
    peso INT NOT NULL,
    color VARCHAR(50),
    existencias INT NOT NULL,
    precio INT NOT NULL
);

CREATE TABLE pedidos (
    numPed INT PRIMARY KEY NOT NULL,
    fechaP DATE NOT NULL,
    codProv INT,
    FOREIGN KEY (codProv) REFERENCES proveedores(codProv)
);

CREATE TABLE remesas (
    numPed INT,
    codPieza INT,
    ctd INT,
    FOREIGN KEY (numPed) REFERENCES pedidos(numPed),
    FOREIGN KEY (codPieza) REFERENCES piezas(codPieza),
    PRIMARY KEY (numPed, codPieza)
);

INSERT INTO proveedores (codProv, nombre, poblacion) VALUES
(1, 'Fersa', 'Alcazar'),
(2, 'Tarsa', 'Madrid'),
(3, 'Melorsa', 'Toledo'),
(4, 'Corsa', 'Madrid'),
(5, 'Ferreto', 'Ciudad Real');

INSERT INTO piezas (codPieza, nomPieza, peso, color, existencias, precio) VALUES
(1, 'Tuerca', 20, 'Dorado', 10, 110),
(2, 'Tuerca', 60, 'Plata', 60, 120),
(3, 'Tornillo', 30, 'Plata', 120, 50),
(4, 'Puntilla', 55, 'Dorado', 40, 150),
(5, 'Tornillo', 30, 'Dorado', 30, 30),
(6, 'Puntilla', 10, 'Plata', 80, 100),
(7, 'Tuerca', 30, 'Dorado', 0, 40),
(8, 'Puntilla', 125, 'Dorado', 0, 200);

INSERT INTO pedidos (numPed, fechaP, codProv) VALUES
(1, '2009-01-01', 1),
(2, '2009-01-10', 2),
(3, '2009-01-25', 3),
(4, '2009-02-02', 1),
(5, '2009-02-05', 4),
(6, '2009-02-15', 1),
(7, '2009-02-20', 2),
(8, '2009-03-03', 2),
(9, '2009-03-13', 3),
(10, '2009-03-20', 1),
(11, '2009-04-04', 1),
(12, '2009-04-24', 4);

INSERT INTO remesas (numPed, codPieza, ctd) VALUES
(1, 1, 120),
(1, 3, 50),
(1, 2, 150),
(2, 4, 250),
(3, 1, 100),
(3, 6, 300),
(4, 5, 250),
(5, 1, 80),
(5, 2, 150),
(5, 3, 100),
(5, 4, 220),
(6, 5, 130),
(6, 6, 320),
(7, 1, 180),
(7, 4, 50),
(8, 3, 350),
(9, 2, 75),
(9, 5, 150),
(9, 1, 125),
(10, 6, 140),
(10, 3, 75),
(11, 4, 160),
(11, 2, 180),
(11, 1, 220),
(12, 5, 300),
(12, 3, 200);