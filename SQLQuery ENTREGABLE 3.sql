--CREAR BASE DE DATOS
CREATE DATABASE Ventas_Tech_DB;
GO
USE Ventas_Tech_DB;
GO

--Sección 2 — CREATE TABLES

--CREAR TABLAS
CREATE TABLE categorias (
	id_categoria INT PRIMARY KEY,
	nombre_categoria VARCHAR(50) NOT NULL,
	descripcion VARCHAR(200)
);

CREATE TABLE productos (
	id_producto INT PRIMARY KEY,
	nombre_producto VARCHAR(100) NOT NULL,
	id_categoria INT,
	precio DECIMAL(10,2) NOT NULL,
	stock INT DEFAULT 0,
	activo BIT DEFAULT 1,--1 Activo 0 Inactivo
	FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);
--Tabla ventas
CREATE TABLE ventas (
	id_venta INT PRIMARY KEY,
	id_cliente INT,
	id_producto INT,
	cantidad INT NOT NULL,
	precio_unitario DECIMAL(10,2) NOT NULL,
	fecha_venta DATE NOT NULL,
	FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
	FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

CREATE TABLE clientes (
	id_cliente INT PRIMARY KEY,
	nombre VARCHAR (100) NOT NULL,
	email VARCHAR(100) NOT NULL,
	ciudad VARCHAR(50),
	fecha_registro DATE NOT NULL
);

--Sección 3 — INSERT DATA
-- INSERTAR DATOS EN LA BD
 --1er insercion 

INSERT INTO categorias VALUES(1, 'computacion', 'laptop, pec, monitores');
INSERT INTO categorias VALUES (2, 'Accesorios', 'Periféricos y complementos');
INSERT INTO categorias VALUES (3, 'Audio', 'Auriculares y parlantes');
INSERT INTO categorias VALUES (4, 'Almacenamiento', 'Discos y memorias');
SELECT * FROM categorias; -- Sección 4 — VALIDACIÓN

--2dainsercion

 INSERT INTO productos VALUES(1,'Laptop Pro 15 Lenovo',1,1200.00,15,1);

 INSERT INTO productos (id_producto,nombre_producto,id_categoria,precio,stock,activo) VALUES (2,'MOUSE',2,28.00,15,1);
 INSERT INTO productos (id_producto,nombre_producto,id_categoria,precio,stock,activo) VALUES (3,'Monitor 4k 27',1,450.00,12,1);
 INSERT INTO productos (id_producto,nombre_producto,id_categoria,precio,stock,activo) VALUES (4,'Auriculares BT Pro',3,120.00,35,1);
 INSERT INTO productos (id_producto,nombre_producto,id_categoria,precio,stock,activo) VALUES (5,'SSDexterno 1TB',4,130.00,18,1);
 INSERT INTO productos (id_producto,nombre_producto,id_categoria,precio,stock,activo) VALUES (6,'Teclado mecánico',2,95.00,40,1);
SELECT * FROM productos; --Sección 4 — VALIDACIÓN

INSERT INTO clientes VALUES(1,'Marias Lopez','maria@mail.com','Buenos Aires','2024-01-05');
INSERT INTO clientes VALUES(2,'Carlos Ruiz','carlos@mail.com','Cordoba','2024-01-10');
INSERT INTO clientes VALUES(3,'Ana Gomez','ana@mail.com','Rosario','2024-02-01');
INSERT INTO clientes VALUES(4,'Pedro Sanz','pedro@mail.com','Mendoza','2024-02-15');
INSERT INTO clientes VALUES(5,'Laira Torres','laura@mail.com','Tucuman','2024-03-01')
SELECT * FROM clientes; --Sección 4 — VALIDACIÓN

INSERT INTO ventas (id_venta, id_cliente, id_producto, cantidad, precio_unitario, fecha_venta) VALUES
  ( 1, 1, 1, 2, 1200.00, '2024-03-05'),
  ( 2, 2, 2, 5,   28.00, '2024-03-06'),
  ( 3, 3, 3, 1,  450.00, '2024-03-07'),
  ( 4, 1, 4, 2,  120.00, '2024-03-08'),
  ( 5, 4, 5, 3,  130.00, '2024-03-10'),
  ( 6, 2, 6, 4,   95.00, '2024-03-11'),
  ( 7, 5, 1, 1, 1200.00, '2024-03-12'),
  ( 8, 3, 2, 8,   28.00, '2024-03-13'),
  ( 9, 4, 4, 1,  120.00, '2024-03-14'),
  (10, 5, 3, 2,  450.00, '2024-03-15');

  SELECT * FROM ventas; --Sección 4 — VALIDACIÓN




