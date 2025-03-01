// models/preferenciasNotificacoes.js

const { DataTypes } = require('sequelize');
const sequelize = require('../config/database'); // Assumindo que você tem um arquivo de configuração do banco de dados

const PreferenciasNotificacoes = sequelize.define('PreferenciasNotificacoes', {
  id_usuario: {
    type: DataTypes.INTEGER,
    allowNull: false,
    primaryKey: true,
    references: {
      model: 'usuarios', // Nome da tabela de usuários
      key: 'id_usuario'
    }
  },
  tipo: {
    type: DataTypes.STRING(50),
    allowNull: false,
    primaryKey: true
  },
  firebase_token: {
    type: DataTypes.STRING(255),
    allowNull: true
  },
  in_token: {
    type: DataTypes.BOOLEAN,
    defaultValue: false
  },
  ativo: {
    type: DataTypes.BOOLEAN,
    defaultValue: true
  }
}, {
  tableName: 'preferencias_notificacoes',
  timestamps: false // Desativando timestamps automáticos
});

module.exports = PreferenciasNotificacoes;