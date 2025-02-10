const { Sequelize, DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const HistoricoSuporte = sequelize.define('HistoricoSuporte', {
  id_mensagem: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  id_pedido: {
    type: DataTypes.INTEGER,
    allowNull: true
  },
  id_usuario: {
    type: DataTypes.INTEGER,
    allowNull: false
  },
  id_usuario_suporte: {
    type: DataTypes.INTEGER,
    allowNull: false
  },
  in_suporte: {
    type: DataTypes.BOOLEAN,
    defaultValue: false
  },
  mensagem: {
    type: DataTypes.TEXT,
    allowNull: false
  },
  data_envio: {
    type: DataTypes.DATE,
    defaultValue: Sequelize.NOW
  }
}, {
  tableName: 'historico_suporte',
  timestamps: false
});

module.exports = HistoricoSuporte;