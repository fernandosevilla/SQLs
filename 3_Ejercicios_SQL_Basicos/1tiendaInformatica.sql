DROP TABLE IF EXISTS Articulos;
DROP TABLE IF EXISTS Fabricantes;

CREATE TABLE Fabricantes (
	codigoFabricante INT PRIMARY KEY AUTO_INCREMENT,
    nombreFabricante NVARCHAR(100)
);

CREATE TABLE Articulos (
	codigoArticulo INT PRIMARY KEY AUTO_INCREMENT,
    nombreArticulo NVARCHAR(100),
    precio INT NOT NULL,
    codigoFabricante INT,
    FOREIGN KEY (codigoFabricante) REFERENCES Fabricantes(codigoFabricante)
);

INSERT INTO Fabricantes (codigoFabricante, nombreFabricante) VALUES
(1, 'ElectroTech'),
(2, 'GadgetMasters'),
(3, 'TechInnovate'),
(4, 'SmartSolutions'),
(5, 'InnoGizmo'),
(6, 'DigitalCraft'),
(7, 'FutureTech'),
(8, 'InnovateElectronics'),
(9, 'EcoGadgets'),
(10, 'TechGenius');

INSERT INTO Articulos (codigoArticulo, nombreArticulo, precio, codigoFabricante) VALUES
(101, 'Smartphone X1', 599, 1),
(102, 'Laptop ProBook', 899, 2),
(103, 'Wireless Headphones 3000', 129, 3),
(104, 'Smartwatch Elite', 249, 1),
(105, 'Ultra Slim Tablet', 399, 4),
(106, 'Gaming Mouse X', 49, 2),
(107, '4K UHD TV', 999, 5),
(108, 'Portable Bluetooth Speaker', 79, 3),
(109, 'High-Performance Router', 129, 4),
(110, 'SmarthHome Hub', 199, 5);
