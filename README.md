# Biblioteca Microservicios

Este proyecto consta de dos microservicios: un servicio de catálogo de libros y un servicio de autenticación/identidad.

## Requisitos

- Docker y Docker Compose instalados.

## Ejecución

1. Clona el repositorio.
2. Navega a la raíz del proyecto.
3. Ejecuta `docker-compose up --build` para construir y ejecutar los contenedores.
4. Los servicios estarán disponibles en:
   - Catalog Service: http://localhost:3002
   - Identity Service: http://localhost:5132
   - PostgreSQL: localhost:5432

Para detener: `docker-compose down`.

Para reconstruir: `docker-compose up --build`.