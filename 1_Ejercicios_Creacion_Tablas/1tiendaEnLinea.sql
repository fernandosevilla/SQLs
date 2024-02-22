DROP TABLE IF EXISTS DetallesPedido; -- Si existe la tabla DetallesPedido la borra
DROP TABLE IF EXISTS Pedidos; -- Si existe la tabla Pedidos la borra
DROP TABLE IF EXISTS Productos; -- Si existe la tabla Productos la borra
DROP TABLE IF EXISTS Clientes; -- Si existe la tabla Clientes la borra
DROP TABLE IF EXISTS Categorias; -- Si existe la tabla Categorias la borra

-- Base de Datos de tienda en linea (practica 1)
CREATE TABLE Categorias (
	idCategoria INT PRIMARY KEY AUTO_INCREMENT,
    nombreCategoria VARCHAR(50) NOT NULL
);

CREATE TABLE Clientes (
	idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nombreCliente VARCHAR(50) NOT NULL,
	emailCliente VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE Productos (
	idProducto INT PRIMARY KEY AUTO_INCREMENT,
    nombreProducto VARCHAR(50) NOT NULL,
    precioProducto DECIMAL(10, 2),
    stock INT,
    idCategoria INT,
    FOREIGN KEY (idCategoria) REFERENCES Categorias(idCategoria) ON DELETE CASCADE -- Si se borra una categoria, se borraran todos los productos que formen parte de esa categoria
);

CREATE TABLE Pedidos (
	idPedido INT PRIMARY KEY AUTO_INCREMENT,
    fechaPedido DATETIME NOT NULL,
    pedidoCancelado BOOLEAN DEFAULT FALSE,
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente) ON DELETE CASCADE -- Si se borra un cliente, se borraran todos los pedidos que haya hecho un cliente
);

CREATE TABLE DetallesPedido(
	idDetallePedido INT PRIMARY KEY AUTO_INCREMENT,
	idPedido INT,
	idProducto INT,
    cantidad INT,
    UNIQUE (idPedido, idProducto),
	FOREIGN KEY (idPedido) REFERENCES Pedidos(idPedido) ON DELETE CASCADE, -- Cuando se borre un pedido, se borraran tambien sus detalles
    FOREIGN KEY (idProducto) REFERENCES Productos(idProducto) ON DELETE CASCADE -- Cuando se borre un producto, se borraran tambien sus detalles
);
