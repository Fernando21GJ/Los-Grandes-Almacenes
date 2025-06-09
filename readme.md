## 🚀 Cómo Usarlo

1. Clona el repositorio.
2. Levanta con Docker Compose:
   ```bash
   docker-compose up --build
   ```
4. Verifica que la base de datos esté en funcionamiento:
   ```bash
   docker ps
   ```

   Ejemplo de salida:
    ```bash
   docker ps

   nombre         | ventas
   ---------------+--------
   Smartphone     |      2
   Tablet         |      2
   Laptop         |      2
   (3 rows)

   cajero      |  producto   | precio_unitario | piso
   ---------------+-------------+-----------------+------
   Luis Martínez | Laptop      |        15000.00 |    1
   Ana Gómez     | Smartphone  |         8000.00 |    2
   Pedro Sánchez | Tablet      |         5000.00 |    3
   Ana Gómez     | Laptop      |        15000.00 |    2
   Luis Martínez | Smartphone  |         8000.00 |    1
   Luis Martínez | Tablet      |         5000.00 |    1
   (6 rows)

   piso | ventas_totales
   -------+----------------
    3 |       15000.00
    2 |       31000.00
    1 |       33000.00
   (3 rows)

   cedula |    nombre     | total_ventas
   --------+---------------+--------------
   C001   | Luis Martínez |     33000.00
   C003   | Pedro Sánchez |     15000.00
   C002   | Ana Gómez     |     31000.00
   (3 rows)

   cedula | nombre
   --------+--------
   (0 rows)
   ```





5.Detén y limpia los contenedores:
   ```bash
   docker compose down -v
   ```
      
   
