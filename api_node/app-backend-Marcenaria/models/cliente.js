// models/cliente.js

const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');
const Usuario = require('./usuario');

const Cliente = sequelize.define('Cliente', {
  id_cliente: {
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
  status: {
    type: DataTypes.BOOLEAN,
    defaultValue: true,
  },
}, {
  tableName: 'clientes',
  timestamps: false,
});

module.exports = Cliente;