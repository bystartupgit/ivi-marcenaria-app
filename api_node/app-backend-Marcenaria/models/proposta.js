// models/proposta.js

const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

const Proposta = sequelize.define('Proposta', {
  id_proposta: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  id_pedido: {
    type: DataTypes.INTEGER,
    allowNull: false
  },
  id_prestador: {
    type: DataTypes.INTEGER,
    allowNull: true,  // Permitir que o campo seja nulo
    references: {
      model: 'prestadores',
      key: 'id_prestador'
    }
  },
  mensagem: {
    type: DataTypes.STRING(255),
    allowNull: true
  },
  valor_total: {
    type: DataTypes.DECIMAL(10, 2),
    allowNull: true
  },
  valor_pix: {
    type: DataTypes.DECIMAL(10, 2),
    allowNull: true
  },
  valor_desconto: {
    type: DataTypes.DECIMAL(10, 2),
    allowNull: true
  },
  entrada_minima: {
    type: DataTypes.DECIMAL(10, 2),
    allowNull: true
  },
  parcelas: {
    type: DataTypes.INTEGER,
    allowNull: true
  },
  escassez_temporal: {
    type: DataTypes.BOOLEAN,
    allowNull: true
  },
  de_por: {
    type: DataTypes.DECIMAL(10, 2),
    allowNull: true
  },
  url_arquivo_orcamento: {
    type: DataTypes.STRING(255),
    allowNull: true
  },
  status: {
    type: DataTypes.STRING(50),
    allowNull: false,
    defaultValue: 'em negociação',
    validate: {
      isIn: [['aceita', 'recusada', 'em negociacao', 'aprovada', 'paga', 'cancelada']]
    }
  },
  data_criacao: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW
  },
  data_atualizacao: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW
  }
}, {
  timestamps: true,
  tableName: 'propostas',
  updatedAt: 'data_atualizacao',
  createdAt: 'data_criacao'
});

module.exports = Proposta;