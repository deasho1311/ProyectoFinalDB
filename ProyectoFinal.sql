DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS Producto;
DROP TABLE IF EXISTS Pedido;
DROP TABLE IF EXISTS Inventario;
DROP TABLE IF EXISTS Empleado;
DROP TABLE IF EXISTS Evento;

CREATE TABLE Cliente (
    ID_Cliente INTEGER PRIMARY KEY AUTOINCREMENT,
    Nombre TEXT NOT NULL,
    Telefono TEXT,
    Correo_Electronico TEXT,
    Direccion TEXT
);

CREATE TABLE Producto (
    ID_Producto INTEGER PRIMARY KEY AUTOINCREMENT,
    Nombre TEXT NOT NULL,
    Tipo TEXT,
    Precio REAL NOT NULL,
    Disponibilidad INTEGER DEFAULT 1
);

CREATE TABLE Pedido (
    ID_Pedido INTEGER PRIMARY KEY AUTOINCREMENT,
    Fecha TEXT NOT NULL,
    Hora TEXT NOT NULL,
    Total REAL,
    Metodo_Pago TEXT
);

CREATE TABLE Inventario (
    ID_Inventario INTEGER PRIMARY KEY AUTOINCREMENT,
    Producto_ID INTEGER,
    Cantidad_Disponible INTEGER,
    Unidad_Medida TEXT,
    Ultima_Actualizacion TEXT,
    FOREIGN KEY (Producto_ID) REFERENCES Producto(ID_Producto)
);

CREATE TABLE Empleado (
    ID_Empleado INTEGER PRIMARY KEY AUTOINCREMENT,
    Nombre TEXT NOT NULL,
    Puesto TEXT,
    Turno TEXT,
    Telefono TEXT
);

CREATE TABLE Evento (
    ID_Evento INTEGER PRIMARY KEY AUTOINCREMENT,
    Cliente_ID INTEGER,
    Fecha TEXT NOT NULL,
    Tipo_Evento TEXT,
    Cantidad_Invitados INTEGER,
    FOREIGN KEY (Cliente_ID) REFERENCES Cliente(ID_Cliente)
);

INSERT INTO Cliente (Nombre, Telefono, Correo_Electronico, Direccion)
VALUES 
('Juan Pérez', '6681234567', 'juan@example.com', 'Calle 5 #123'),
('María López', '6689876543', 'maria@example.com', 'Av. Principal #45');

INSERT INTO Producto (Nombre, Tipo, Precio, Disponibilidad)
VALUES
('Taco de Asada', 'taco de maíz', 25.00, 1),
('Agua de Horchata', 'bebida', 15.00, 1),
('Taco de Pastor', 'taco de harina', 30.00, 1);

INSERT INTO Pedido (Fecha, Hora, Total, Metodo_Pago)
VALUES
('2025-11-28', '13:45', 70.00, 'Efectivo'),
('2025-11-28', '14:10', 45.00, 'Tarjeta');

INSERT INTO Inventario (Producto_ID, Cantidad_Disponible, Unidad_Medida, Ultima_Actualizacion)
VALUES
(1, 50, 'piezas', '2025-11-28'),
(2, 20, 'litros', '2025-11-28'),
(3, 40, 'piezas', '2025-11-28');

INSERT INTO Empleado (Nombre, Puesto, Turno, Telefono)
VALUES
('Carlos Ramírez', 'Cocinero', 'Matutino', '6681112233'),
('Ana Torres', 'Cajera', 'Vespertino', '6682223344');

INSERT INTO Evento (Cliente_ID, Fecha, Tipo_Evento, Cantidad_Invitados)
VALUES
(1, '2025-12-05', 'Fiesta', 30),
(2, '2025-12-10', 'Reunión', 15);

SELECT * FROM Cliente;
SELECT * FROM Producto;
SELECT * FROM Pedido;
SELECT * FROM Inventario;
SELECT * FROM Empleado;
SELECT * FROM Evento;
