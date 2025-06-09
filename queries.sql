-- b) Número de ventas de cada producto, ordenado de más a menos
SELECT p.nombre, COUNT(v.id) AS ventas
FROM productos p
JOIN ventas v ON p.codigo = v.producto_codigo
GROUP BY p.nombre
ORDER BY ventas DESC;

-- c) Informe completo: cajero, producto, precio, piso
SELECT c.nombre AS cajero,
       p.nombre AS producto,
       v.precio_unitario,
       m.piso
FROM ventas v
JOIN cajeros c ON v.cajero_cedula = c.cedula
JOIN productos p ON v.producto_codigo = p.codigo
JOIN maquinas_registradoras m ON v.maquina_id = m.id;

-- d) Ventas totales (importe) por piso
SELECT m.piso,
       SUM(v.cantidad * v.precio_unitario) AS ventas_totales
FROM ventas v
JOIN maquinas_registradoras m ON v.maquina_id = m.id
GROUP BY m.piso;

-- e) Código y nombre de cajero + importe total de sus ventas
SELECT c.cedula,
       c.nombre,
       SUM(v.cantidad * v.precio_unitario) AS total_ventas
FROM ventas v
JOIN cajeros c ON v.cajero_cedula = c.cedula
GROUP BY c.cedula, c.nombre;

-- f) Cajeros que vendieron en pisos con ventas totales < 5000
WITH ventas_piso AS (
  SELECT m.piso, SUM(v.cantidad * v.precio_unitario) AS total_piso
  FROM ventas v
  JOIN maquinas_registradoras m ON v.maquina_id = m.id
  GROUP BY m.piso
)
SELECT DISTINCT c.cedula, c.nombre
FROM ventas v
JOIN cajeros c ON v.cajero_cedula = c.cedula
JOIN maquinas_registradoras m ON v.maquina_id = m.id
JOIN ventas_piso vp ON m.piso = vp.piso
WHERE vp.total_piso < 5000;