// models/prestadoresSelecionados.js

const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const PrestadoresSelecionados = sequelize.define('PrestadoresSelecionados', {
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
  data_selecao: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW
  },
  status_execucao: {
    type: DataTypes.STRING(20),
    allowNull: false,
    defaultValue: 'pendente',
    validate: {
      isIn: [['pendente', 'em andamento', 'em execucao', 'concluido']] // Certifique-se de incluir 'pendente'
    }
  }
}, {
  tableName: 'prestadores_selecionados',
  timestamps: false // Desativa a criação automática de timestamps devido a tabela não usar
});

module.exports = PrestadoresSelecionados;