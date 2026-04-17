# Catalog Service

Microservicio de catálogo de libros.

## Endpoints

### Health Check (sin autenticación)
```
GET /api/catalog/health
```

### Libros

#### Listar libros
```
GET /api/catalog/books?title=&author=&category=&available=true&page=1&limit=10
```

#### Listar libros disponibles
```
GET /api/catalog/books/available?page=1&limit=10
```

#### Obtener detalle de un libro
```
GET /api/catalog/books/:id
```

#### Crear libro (Admin, Bibliotecario)
```
POST /api/catalog/books
Content-Type: application/json
Authorization: Bearer <token>

{
  "title": "El Quijote",
  "author": "Miguel de Cervantes",
  "isbn": "978-84-206-4734-6",
  "editorial": "Alfaguara",
  "year": 1605,
  "categories": ["Clásicos", "Literatura Española"],
  "totalCopies": 5,
  "availableCopies": 3,
  "description": "Novela de aventuras..."
}
```

#### Editar libro (Admin, Bibliotecario)
```
PUT /api/catalog/books/:id
Content-Type: application/json
Authorization: Bearer <token>

{
  "title": "El Quijote de la Mancha",
  "author": "Miguel de Cervantes",
  ...
}
```

#### Eliminar libro (Admin, Bibliotecario)
```
DELETE /api/catalog/books/:id
Authorization: Bearer <token>
```

#### Actualizar disponibilidad (Admin, Bibliotecario)
```
PATCH /api/catalog/books/:id/availability
Content-Type: application/json
Authorization: Bearer <token>

{
  "availableCopies": 2
}
```

## Autenticación

Todos los endpoints (excepto `/health`) requieren autenticación mediante Token Introspection:

1. El cliente envía el request con header `Authorization: Bearer <token>`
2. El middleware `auth.middleware.js` extrae el token
3. Llama a `POST {AUTH_SERVICE_URL}/api/auth/introspect` con el token
4. Si el servicio responde con `"active": true`, se autentica el usuario
5. Si `"active": false` o el servicio no responde, devuelve 401 ó 503


## Roles y Permisos

### Roles disponibles
- **Admin**: Acceso total (CRUD)
- **Bibliotecario**: Acceso total (CRUD)
- **Estudiante**: Solo lectura
- **Profesor**: Solo lectura


## Formato de Respuestas

### Éxito
```json
{
  "success": true,
  "data": {...}
}
```

### Éxito con paginación
```json
{
  "success": true,
  "data": [...],
  "pagination": {
    "page": 1,
    "limit": 10,
    "total": 100
  }
}
```

### Error
```json
{
  "success": false,
  "error": "Mensaje descriptivo del error"
}
```

## Notas de desarrollo

- El servicio utiliza Token Introspection en vez de validación local con JWT
- La validación del token se hace en cada request
- Los errores de validación vienen de express-validator
- El ORM es Sequelize (no raw SQL)
- Paginación por defecto: page=1, limit=10
- Máximo limit permitido: 100
