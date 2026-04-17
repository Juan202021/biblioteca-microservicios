import { config } from './src/config/env.js';
import sequelize from './src/config/database.js';
import app from './src/app.js';

// Importar modelos para sincronización
import './src/models/book.model.js';

const startServer = async () => {
  try {
    // Sincronizar base de datos
    console.log('Syncing database...');
    await sequelize.sync({ alter: true });
    console.log('✓ Database synchronized successfully');

    // Iniciar servidor
    app.listen(config.port, () => {
      console.log(`✓ Catalog Service running on port ${config.port}`);
      console.log(`✓ Auth Service URL: ${config.authServiceUrl}`);
      console.log(`✓ Database: ${config.database.database}@${config.database.host}:${config.database.port}`);
    });
  } catch (error) {
    console.error('✗ Failed to start server:');
    console.error(error.message);
    process.exit(1);
  }
};

// Graceful shutdown
process.on('SIGINT', async () => {
  console.log('\nShutting down gracefully...');
  await sequelize.close();
  process.exit(0);
});

startServer();
