//config/database.js
// Importa o módulo sequelize, referente ao banco de dados postgreSQL
const { Sequelize } = require('sequelize');

//Esses são os parâmetros para conectar ao banco de dados PostgreSQL. Certifique-se de que o nome do banco de dados, o usuário e a senha estejam corretos. Sempre que modificados as informações devem ser atualizadas aqui
const sequelize = new Sequelize('appmarcenaria', 'usermarcapp', 'AppM@rc&n@r!a', {
  host: 'localhost',
  dialect: 'postgres'
});

//Instrução para configurar o ORM (Object-Relational Mapper) Sequelize no Node.js com ExpressJS
module.exports = sequelize;
