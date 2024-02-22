DROP TABLE IF EXISTS LineasVenta;
DROP TABLE IF EXISTS Productos;
DROP TABLE IF EXISTS Ventas;
DROP TABLE IF EXISTS Clientes;
DROP TABLE IF EXISTS Oficinas;
DROP TABLE IF EXISTS Poblaciones;
DROP TABLE IF EXISTS Provincias;
DROP TABLE IF EXISTS Zonas;
DROP TABLE IF EXISTS Areas;

CREATE TABLE Areas (
	codigoArea INT PRIMARY KEY AUTO_INCREMENT,
    nombreArea VARCHAR(10)
);

CREATE TABLE Zonas (
	codigoZona INT PRIMARY KEY AUTO_INCREMENT,
    nombreZona VARCHAR(20) NOT NULL,
    codigoArea INT,
    FOREIGN KEY (codigoArea) REFERENCES Areas(codigoArea) ON DELETE CASCADE
);

CREATE TABLE Provincias (
	provincia VARCHAR(20) PRIMARY KEY NOT NULL,
    codigoZona INT,
    FOREIGN KEY (codigoZona) REFERENCES Zonas(codigoZona) ON DELETE CASCADE
);

CREATE TABLE Poblaciones (
	poblacion VARCHAR(30) PRIMARY KEY NOT NULL,
    provincia VARCHAR(20),
    FOREIGN KEY (provincia) REFERENCES Provincias(provincia) ON DELETE CASCADE
);

CREATE TABLE Oficinas (
	codigoOfi INT PRIMARY KEY AUTO_INCREMENT,
    poblacion VARCHAR(30),
    FOREIGN KEY (poblacion) REFERENCES Poblaciones(poblacion) ON DELETE CASCADE
);

CREATE TABLE Clientes (
	codigoCliente INT PRIMARY KEY AUTO_INCREMENT,
    nombreCliente VARCHAR(50) NOT NULL,
	direccionCliente VARCHAR(50) NOT NULL,
    codigoOfi INT,
    FOREIGN KEY (codigoOfi) REFERENCES Oficinas(codigoOfi) ON DELETE CASCADE
);

CREATE TABLE Ventas (
	numVenta INT PRIMARY KEY AUTO_INCREMENT,
    fechaVenta DATE NOT NULL,
    descuento INT,
    codigoCliente INT,
    FOREIGN KEY (codigoCliente) REFERENCES Clientes(codigoCliente) ON DELETE CASCADE
);

CREATE TABLE Productos (
	codigoProducto INT PRIMARY KEY AUTO_INCREMENT,
    nombreProducto VARCHAR(50),
    existencias INT,
    PVP INT
);

CREATE TABLE LineasVenta (
	numVenta INT,
	codigoProducto INT,
    PRIMARY KEY (numVenta, codigoProducto),
	cantidad INT,
    FOREIGN KEY (numVenta) REFERENCES Ventas(numVenta) ON DELETE CASCADE,
	FOREIGN KEY (codigoProducto) REFERENCES Productos(codigoProducto) ON DELETE CASCADE
);

-- Insertar datos en la tabla Areas
INSERT INTO Areas (nombreArea) VALUES
	('Área A'),
	('Área B'),
	('Área C');

-- Insertar datos en la tabla Zonas
INSERT INTO Zonas (nombreZona, codigoArea) VALUES
	('Zona 1', 1),
	('Zona 2', 1),
	('Zona 3', 2),
	('Zona 4', 3);

-- Insertar datos en la tabla Provincias
INSERT INTO Provincias (provincia, codigoZona) VALUES
	('Provincia 1', 1),
	('Provincia 2', 2),
	('Provincia 3', 3),
	('Provincia 4', 4);

-- Insertar datos en la tabla Poblaciones
INSERT INTO Poblaciones (poblacion, provincia) VALUES
	('Poblacion 1', 'Provincia 1'),
	('Poblacion 2', 'Provincia 1'),
	('Poblacion 3', 'Provincia 2'),
	('Poblacion 4', 'Provincia 3');

-- Insertar datos en la tabla Oficinas
INSERT INTO Oficinas (poblacion) VALUES
	('Poblacion 1'),
	('Poblacion 2'),
	('Poblacion 3');

-- Insertar datos en la tabla Clientes
INSERT INTO Clientes (nombreCliente, direccionCliente, codigoOfi) VALUES
	('Cliente 1', 'Dirección 1', 1),
	('Cliente 2', 'Dirección 2', 2),
	('Cliente 3', 'Dirección 3', 3);

-- Insertar datos en la tabla Ventas
INSERT INTO Ventas (fechaVenta, descuento, codigoCliente) VALUES
	('2024-01-26', 10, 1),
	('2024-01-27', 5, 2),
	('2024-01-28', 8, 3);

-- Insertar datos en la tabla Productos
INSERT INTO Productos (nombreProducto, existencias, PVP) VALUES
	('Producto 1', 100, 20),
	('Producto 2', 50, 30),
	('Producto 3', 75, 25);

-- Insertar datos en la tabla LineasVenta
INSERT INTO LineasVenta (numVenta, codigoProducto, cantidad) VALUES
	(1, 1, 5),
	(1, 2, 3),
	(2, 3, 10),
	(3, 1, 8);


ALTER TABLE Clientes
	DROP COLUMN direccionCliente;
ALTER TABLE Clientes
	ADD COLUMN Telef INT;
ALTER TABLE Clientes
	MODIFY COLUMN nombreCliente VARCHAR(30);
ALTER TABLE Clientes
	MODIFY COLUMN Telef VARCHAR(10);
    
ALTER TABLE Ventas
	DROP COLUMN descuento;

ALTER TABLE Productos
	DROP COLUMN nombreProducto,
    ADD COLUMN descripcionProducto VARCHAR(20),
    ADD COLUMN material VARCHAR(15),
    ADD COLUMN dimensiones VARCHAR(15);