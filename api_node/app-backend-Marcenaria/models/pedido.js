// models/pedido.js

const { DataTypes } = require('sequelize');
const sequelize = require('../config/database'); 

const Pedido = sequelize.define('Pedido', {
    id_pedido: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
    },
    id_cliente: {
        type: DataTypes.INTEGER,
        allowNull: false,
    },
    titulo: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    descricao: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    ambientes: {
      type: DataTypes.TEXT, 
      allowNull: true, 
    },
    data_pedido: {
        type: DataTypes.DATE,
        allowNull: false,
        defaultValue: DataTypes.NOW, 
    },
    status: {
        type: DataTypes.STRING,
        allowNull: false,
        defaultValue: 'em analise',
    },
    contato: {
      type: DataTypes.BOOLEAN,
      defaultValue: false,
    },
}, {
    tableName: 'pedidos', 
    timestamps: false, 
});

module.exports = Pedido;