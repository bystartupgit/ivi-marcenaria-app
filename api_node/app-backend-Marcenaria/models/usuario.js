// models/usuario.js

const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');

// Definição do modelo de Usuário
const Usuario = sequelize.define('Usuario', {
  id_usuario: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  nome: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  email: {
    type: DataTypes.STRING,
    allowNull: false,
    unique: true,
  },
  senha: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  tipo_usuario: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  data_criacao: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW,
  },
  status: {
    type: DataTypes.BOOLEAN,
    defaultValue: true,
  },
  cpf: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  telefone: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  imagem_perfil: {
    type: DataTypes.TEXT,
    allowNull: true,
  },
}, {
  tableName: 'usuarios',
  timestamps: false,
});

module.exports = Usuario;