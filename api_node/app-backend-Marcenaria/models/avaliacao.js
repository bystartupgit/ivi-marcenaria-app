//models/avaliacao.js

const { DataTypes } = require('sequelize');
const sequelize = require('../config/database');
const Usuario = require('./usuario');
const Cliente = require('./cliente');
const Prestador = require('./prestador');

// Definição do Modelo Sequelize para a tabela tb_avaliacoes
const Avaliacao = sequelize.define('tb_avaliacoes', {
    id: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    id_usuario_cliente: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    id_pedido: {
        type: DataTypes.INTEGER,
        allowNull: false
    },
    id_usuario_prestador: {
        type: DataTypes.INTEGER,
        allowNull: true 
    },
    avaliacao_prestador: {
        type: DataTypes.INTEGER,
        validate: {
            min: 1,
            max: 5
        },
        allowNull: true 
    },
    comentario_prestador: {
        type: DataTypes.TEXT,
        allowNull: true 
    },
    avaliacao_app: {
        type: DataTypes.INTEGER,
        validate: {
            min: 1,
            max: 5
        },
        allowNull: true 
    },
    comentario_app: {
        type: DataTypes.TEXT,
        allowNull: true 
    },
    data_avaliacao: {
        type: DataTypes.DATE,
        defaultValue: DataTypes.NOW,
    }
}, {
    tableName: 'tb_avaliacoes', 
    timestamps: false 
});

module.exports = Avaliacao;