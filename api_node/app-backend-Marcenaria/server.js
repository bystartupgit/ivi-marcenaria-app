// server.js

const express = require('express');
const bodyParser = require('body-parser');
const sequelize = require('./config/database'); // Caminho para o arquivo de configuração do Sequelize

// Importar rotas
const pedidosRoutes = require('./routes/pedidos');
const usuarioRoutes = require('./routes/usuarios');
const midiaRoutes = require('./routes/midia');

// Inicializar o aplicativo Express
const app = express();

// Middleware para analisar o corpo da requisição
app.use(bodyParser.json());

// Rotas
app.use('/api/pedidos', pedidosRoutes);
app.use('/api/usuarios', usuarioRoutes);
app.use('/api/midia', midiaRoutes);

// Sincronizar com o banco de dados
sequelize.sync().then(() => {
  console.log('Conectado ao banco de dados com sucesso.');
}).catch(error => {
  console.error('Erro ao conectar ao banco de dados:', error);
});

// Iniciar o servidor e exibe uma mensagem no console quando o servidor está rodando e o banco ok
const PORT = process.env.PORT || 5000;
app.listen(PORT, async () => {
  try {
    await sequelize.authenticate();
    console.log('Conexão com o banco de dados estabelecida com sucesso');
    console.log(`Servidor rodando na porta ${PORT}`);
  } catch (error) {
    console.error('Não foi possível conectar ao banco de dados:', error);
  }
});
