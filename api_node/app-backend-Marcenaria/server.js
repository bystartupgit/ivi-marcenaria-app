// server.js

const express = require('express');
const bodyParser = require('body-parser');
const sequelize = require('./config/database'); // Caminho para o arquivo de configuração do Sequelize
require('./config/associations');

// Importar rotas
const pedidosRoutes = require('./routes/pedidos');
const usuarioRoutes = require('./routes/usuarios');
const midiaRoutes = require('./routes/midia');
const propostasRoutes = require('./routes/propostas');
const preferenciasNotificacoesRoutes = require('./routes/preferenciasNotificacoes');
const mensagensChat = require('./routes/chat');
const clientesRoutes = require('./routes/clientes');
const prestadoresRoutes = require('./routes/prestadores');
const administradoresRoutes = require('./routes/administradores');
const notificacoesRoutes = require('./routes/notificacoes');

const validaRotas = 0;

// Inicializar o aplicativo Express 
const app = express();

// Middleware para analisar o corpo da requisição
app.use(bodyParser.json());

// Definição das rotas
app.get('/', (req, res) => {
  res.send('Base ok');
});

app.get('/about', (req, res) => {
  res.send('App Marcenaria');
});

// Rotas ativas da aplicação
app.use('/api/pedidos', pedidosRoutes);
app.use('/api/usuarios', usuarioRoutes);
app.use('/api/midia', midiaRoutes);
app.use('/api/propostas', propostasRoutes);
app.use('/api/preferencias-notificacoes', preferenciasNotificacoesRoutes);
app.use('/api/mensagens', mensagensChat);
app.use('/api/clientes', clientesRoutes);
app.use('/api/prestadores', prestadoresRoutes);
app.use('/api/administradores', administradoresRoutes);
app.use('/api/notificacoes', notificacoesRoutes);

// Middleware para listar as rotas
if(validaRotas==1){
    app._router.stack.forEach((middleware) => {
      if (middleware.route) { // Rota definida
          console.log(middleware.route);
      } else if (middleware.name === 'router') { // Sub-roteador
          middleware.handle.stack.forEach((handler) => {
              if (handler.route) {
                  console.log(handler.route);
              }
          });
      }
    });
}

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
