// models/passwordRecovery.js

const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');
const Usuario = require('./usuario');

// Definição do modelo de passwordRecovery
const PasswordRecovery = sequelize.define('PasswordRecovery', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true
  },
  user_id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    references: {
      model: 'usuarios', 
      key: 'id_usuario'
    }
  },
  token: {
    type: DataTypes.STRING,
    allowNull: false
  },
  created_at: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW
  }
}, {
  tableName: 'password_recovery', 
  timestamps: false 
});

module.exports = PasswordRecovery;