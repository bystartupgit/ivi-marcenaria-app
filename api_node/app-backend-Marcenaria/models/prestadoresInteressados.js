// models/prestadoresInteressados.js

const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const PrestadoresInteressados = sequelize.define('PrestadoresInteressados', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  id_proposta: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: {
      model: 'propostas',
      key: 'id_proposta'
    }
  },
  id_prestador: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: {
      model: 'prestadores',
      key: 'id_prestador'
    }
  },
  status_interesse: {
    type: DataTypes.STRING(20),
    allowNull: false,
    defaultValue: 'pendente',
    validate: {
      isIn: [['pendente', 'interessado', 'recusado']] // Certifique-se de incluir 'pendente'
    }
  },
  data_interesse: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW
  }
}, {
  tableName: 'prestadores_interessados',
  timestamps: false // Desativa a criação automática de timestamps devido a tabela não usar
});

module.exports = PrestadoresInteressados;