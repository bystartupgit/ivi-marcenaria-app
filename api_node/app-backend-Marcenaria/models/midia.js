const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Midia = sequelize.define('Midia', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  nome_arquivo: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  tipo: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  caminho: {
    type: DataTypes.TEXT,
    allowNull: false,
  },
  id_cliente: {
    type: DataTypes.INTEGER,
    allowNull: true,
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
  descricao: {
    type: DataTypes.TEXT,
    allowNull: true,
  },
  data_criacao: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW,
  },
}, {
  tableName: 'midia',
  timestamps: false,
});

module.exports = Midia;