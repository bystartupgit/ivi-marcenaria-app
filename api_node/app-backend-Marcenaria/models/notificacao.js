const { DataTypes } = require('sequelize');
const sequelize = require('../config/database'); // Assumindo que você tem um arquivo de configuração do banco de dados

const Notificacao = sequelize.define('Notificacao', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  id_usuario: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: {
      model: 'usuarios',
      key: 'id_usuario'
    }
  },
  tipo: {
    type: DataTypes.STRING(50),
    allowNull: false
  },
  mensagem: {
    type: DataTypes.TEXT,
    allowNull: false
  },
  id_prestador: {
    type: DataTypes.INTEGER,
    allowNull: true,
  },
  id_pedido: {
    type: DataTypes.INTEGER,
    allowNull: true,
  },
  id_proposta: {
    type: DataTypes.INTEGER,
    allowNull: true,
  },
  lida: {
    type: DataTypes.BOOLEAN,
    defaultValue: false
  },
  data_criacao: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW
  }
}, {
  tableName: 'notificacoes',
  timestamps: false 
});

module.exports = Notificacao;