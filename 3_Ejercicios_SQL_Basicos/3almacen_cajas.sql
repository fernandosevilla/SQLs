DROP TABLE IF EXISTS cajas;
DROP TABLE IF EXISTS almacenes;

CREATE TABLE almacenes (
	codigo INT PRIMARY KEY,
    lugar NVARCHAR(100),
    capacidad INT
);

CREATE TABLE cajas (
	numReferencia char(5) PRIMARY KEY,
    contenido NVARCHAR(100),
    valor INT,
    codigoAlmacen INT,
    FOREIGN KEY (codigoAlmacen) REFERENCES almacenes(codigo)
);

-- Datos de prueba para la tabla 'almacenes'
INSERT INTO almacenes (codigo, lugar, capacidad) VALUES
(1, 'Almacén A', 2),
(2, 'Bilbao', 800),
(3, 'Almacén C', 1200);

-- Datos de prueba para la tabla 'cajas'
INSERT INTO cajas (numReferencia, contenido, valor, codigoAlmacen) VALUES
('C001', 'Libros', 1500, 1),
('C006', 'Test', 1500, 1),
('C007', 'Test3', 1500, 1),
('C002', 'Electrónicos', 200, 2),
('C003', 'Ropa', 30, 2),
('C004', 'Herramientas', 100, 3),
('C005', 'Juguetes', 400, 3);
