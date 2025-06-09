FROM postgres:16

# Variables de entorno para PostgreSQL
ENV POSTGRES_DB=almacenes_db
ENV POSTGRES_USER=admin
ENV POSTGRES_PASSWORD=admin123

# Copiamos el script de inicialización
COPY init.sql /docker-entrypoint-initdb.d/
COPY queries.sql /queries.sql

# Expone el puerto por defecto
EXPOSE 5432
