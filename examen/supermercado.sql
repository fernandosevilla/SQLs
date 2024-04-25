DROP TABLE IF EXISTS Venta;
DROP TABLE IF EXISTS MAQUINAS_REGISTRADORAS;
DROP TABLE IF EXISTS PRODUCTOS;
DROP TABLE IF EXISTS CAJEROS;

CREATE TABLE CAJEROS (
	Codigo INT PRIMARY KEY NOT NULL,
    NomApels VARCHAR(50) NOT NULL
);

CREATE TABLE PRODUCTOS (
	Codigo INT PRIMARY KEY NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    precio INT NOT NULL
);

CREATE TABLE MAQUINAS_REGISTRADORAS (
	Codigo INT PRIMARY KEY NOT NULL,
    Piso INT NOT NULL
);

CREATE TABLE Venta (
	Cajero INT NOT NULL,
    Maquina INT NOT NULL,
    Producto INT NOT NULL,
    FOREIGN KEY (Cajero) REFERENCES CAJEROS(Codigo),
	FOREIGN KEY (Maquina) REFERENCES MAQUINAS_REGISTRADORAS(Codigo),
    FOREIGN KEY (Producto) REFERENCES PRODUCTOS(Codigo),
	PRIMARY KEY (Cajero, Maquina, Producto)
);

-- Datos de prueba para la tabla CAJEROS
INSERT INTO CAJEROS (Codigo, NomApels) VALUES
(1, 'Juan Pérez'),
(2, 'María García'),
(3, 'Luis Rodríguez'),
(4, 'Ana Martínez'),
(5, 'Carlos López'),
(6, 'Sofía Fernández'),
(7, 'Javier Ruiz'),
(8, 'Elena Gómez'),
(9, 'Pedro Sánchez'),
(10, 'Laura Díaz');

-- Datos de prueba para la tabla PRODUCTOS
INSERT INTO PRODUCTOS (Codigo, Nombre, Precio) VALUES
(101, 'Pan blanco', 50),
(102, 'Leche desnatada', 30),
(103, 'Huevos de gallina', 60),
(104, 'Aceite de oliva virgen extra', 80),
(105, 'Arroz integral', 40),
(106, 'Pasta de trigo integral', 45),
(107, 'Yogur natural', 25),
(108, 'Manzanas', 35),
(109, 'Pechuga de pollo', 70),
(110, 'Atún en lata', 55);

-- Datos de prueba para la tabla MAQUINAS_REGISTRADORAS
INSERT INTO MAQUINAS_REGISTRADORAS (Codigo, Piso) VALUES
(201, 1),
(202, 1),
(203, 2),
(204, 2),
(205, 3),
(206, 3),
(207, 4),
(208, 4),
(209, 5),
(210, 5);

-- Insertar los datos en la tabla Venta
INSERT INTO Venta (Cajero, Maquina, Producto) VALUES
(4, 201, 103),
(2, 202, 103),
(7, 202, 106),
(10, 202, 107),
(2, 203, 105),
(3, 203, 104),
(7, 203, 103),
(10, 203, 103),
(3, 204, 103),
(10, 204, 106),
(2, 205, 109),
(1, 206, 105),
(1, 206, 109),
(7, 206, 106),
(8, 206, 101),
(9, 206, 102),
(1, 207, 102),
(2, 207, 103),
(4, 207, 103),
(6, 207, 106),
(5, 208, 108),
(8, 208, 102),
(9, 208, 104),
(4, 209, 106),
(5, 209, 104),
(6, 209, 103),
(7, 209, 106),
(9, 209, 101),
(5, 210, 106),
(9, 210, 101);
