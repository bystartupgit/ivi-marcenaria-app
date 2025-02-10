// models/prestador.js

const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');
const Usuario = require('./usuario');

const Prestador = sequelize.define('Prestador', {
  id_prestador: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  id_usuario: {
    type: DataTypes.INTEGER,
    references: {
      model: Usuario,
      key: 'id_usuario',
    },
  },
  documentos: {
    type: DataTypes.ARRAY(DataTypes.TEXT),
  },
  fotos_estabelecimento: {
    type: DataTypes.ARRAY(DataTypes.TEXT),
  },
  status_contrato: {
    type: DataTypes.STRING,
    defaultValue: 'pendente',
  },
  funcoes: {
    type: DataTypes.ARRAY(DataTypes.STRING),
    allowNull: false,
    defaultValue: []
  },
  status: {
    type: DataTypes.BOOLEAN,
    defaultValue: true,
  },
}, {
  tableName: 'prestadores',
  timestamps: false,
});

// Definir a associação entre Prestador e Usuario
Prestador.belongsTo(Usuario, { foreignKey: 'id_usuario' });

module.exports = Prestador;