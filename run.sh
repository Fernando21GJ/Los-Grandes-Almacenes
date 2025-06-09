#!/usr/bin/env bash

# Espera hasta que PostgreSQL esté listo dentro del contenedor
until docker exec almacenes_db pg_isready -U admin; do
  echo "Esperando a PostgreSQL en el contenedor..."
  sleep 2
done

echo "PostgreSQL está listo. Ejecutando queries.sql dentro del contenedor..."
docker exec -i almacenes_db psql -U admin -d almacenes_db -f /queries.sql
