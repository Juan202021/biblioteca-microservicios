import express from 'express';
import bookRoutes from './routes/book.routes.js';
import { errorMiddleware } from './middlewares/error.middleware.js';

const app = express();

// Middlewares globales
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Health check sin autenticación
app.get('/health', (req, res) => {
  res.json({
    success: true,
    message: 'Catalog Service is running',
    timestamp: new Date().toISOString()
  });
});

// Rutas
app.use('/books', bookRoutes);

// Ruta no encontrada
app.use((req, res) => {
  res.status(404).json({
    success: false,
    error: 'Endpoint not found'
  });
});

// Middleware de errores (debe ser el último)
app.use(errorMiddleware);

export default app;
