// config/associations.js

const Pedido = require('../models/pedido');
const Proposta = require('../models/proposta');
const Cliente = require('../models/cliente');
const PrestadoresInteressados = require('../models/prestadoresInteressados');
const PrestadoresSelecionados = require('../models/prestadoresSelecionados');
const Midia = require('../models/midia'); // Certifique-se de que o modelo Midia está importado

// Associações para PrestadoresInteressados
PrestadoresInteressados.belongsTo(Proposta, { foreignKey: 'id_proposta', as: 'proposta' });
Proposta.hasMany(PrestadoresInteressados, { foreignKey: 'id_proposta', as: 'interessados' });

// Associações para Proposta e Pedido
Proposta.belongsTo(Pedido, { foreignKey: 'id_pedido', as: 'pedido' });
Pedido.hasMany(Proposta, { foreignKey: 'id_pedido', as: 'propostas' });

// Associações para PrestadoresSelecionados
PrestadoresSelecionados.belongsTo(Proposta, { foreignKey: 'id_proposta', as: 'proposta' });
Proposta.hasMany(PrestadoresSelecionados, { foreignKey: 'id_proposta', as: 'selecionados' });

// Associações para Pedido e Cliente
Pedido.belongsTo(Cliente, { foreignKey: 'id_cliente', as: 'cliente' });
Cliente.hasMany(Pedido, { foreignKey: 'id_cliente', as: 'pedidos' });

// Associações para Midia
Midia.belongsTo(Cliente, { foreignKey: 'id_cliente', as: 'cliente' });
Midia.belongsTo(Pedido, { foreignKey: 'id_pedido', as: 'pedido' });
Midia.belongsTo(Proposta, { foreignKey: 'id_proposta', as: 'proposta' });

module.exports = { Pedido, Proposta, Cliente, PrestadoresInteressados, PrestadoresSelecionados, Midia };