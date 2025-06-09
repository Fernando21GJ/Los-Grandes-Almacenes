-- 1. Creación de tablas
CREATE TABLE productos (
  codigo SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio NUMERIC(10,2) NOT NULL
);

CREATE TABLE cajeros (
  cedula VARCHAR(20) PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  numero_caja INT NOT NULL
);

CREATE TABLE maquinas_registradoras (
  id SERIAL PRIMARY KEY,
  piso INT NOT NULL
);

CREATE TABLE ventas (
  id SERIAL PRIMARY KEY,
  producto_codigo INT NOT NULL REFERENCES productos(codigo),
  cajero_cedula VARCHAR(20) NOT NULL REFERENCES cajeros(cedula),
  maquina_id INT NOT NULL REFERENCES maquinas_registradoras(id),
  cantidad INT NOT NULL,
  precio_unitario NUMERIC(10,2) NOT NULL,
  fecha TIMESTAMP DEFAULT NOW()
);

-- 2. Datos de ejemplo
INSERT INTO productos (nombre, precio) VALUES
  ('Laptop', 15000.00),
  ('Smartphone', 8000.00),
  ('Tablet', 5000.00);

INSERT INTO cajeros (cedula, nombre, numero_caja) VALUES
  ('C001', 'Luis Martínez', 1),
  ('C002', 'Ana Gómez', 2),
  ('C003', 'Pedro Sánchez', 3);

INSERT INTO maquinas_registradoras (piso) VALUES
  (1), (2), (3);

INSERT INTO ventas (producto_codigo, cajero_cedula, maquina_id, cantidad, precio_unitario) VALUES
  (1, 'C001', 1, 1, 15000.00),
  (2, 'C002', 2, 2, 8000.00),
  (3, 'C003', 3, 3, 5000.00),
  (1, 'C002', 2, 1, 15000.00),
  (2, 'C001', 1, 1, 8000.00),
  (3, 'C001', 1, 2, 5000.00);