// models/administrador.js

const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');
const Usuario = require('./usuario');

// Definição do modelo de Administrador
const Administrador = sequelize.define('Administrador', {
  id_administrador: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  id_usuario: {
    type: DataTypes.INTEGER,
    allowNull: false,
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
  tableName: 'administradores',
  timestamps: false,
});

module.exports = Administrador;