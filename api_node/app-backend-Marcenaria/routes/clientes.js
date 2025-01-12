// routes/clientes.js

const express = require('express');
const router = express.Router();
const Cliente = require('../models/cliente'); // Importar o modelo Cliente
const Usuario = require('../models/usuario'); // Modelo Usuario
const { Op } = require('sequelize'); // Operadores do Sequelize

// Endpoint para listar clientes com filtro por nome e incluir dados de usuários
router.post('/', async (req, res) => {
    try {
      const { nome, page = 1, limit = 10 } = req.body;
      const offset = (page - 1) * limit;
      const clientes = await Cliente.findAndCountAll({
        include: [{
          model: Usuario,
          where: nome ? { nome: { [Op.iLike]: `%${nome}%` } } : {}, 
          attributes: ['nome', 'email', 'telefone'] 
        }],
        limit: parseInt(limit), 
        offset: parseInt(offset)
      });
      res.status(200).json({
        totalRegistros: clientes.count,
        totalPaginas: Math.ceil(clientes.count / limit),
        paginaAtual: parseInt(page),
        clientes: clientes.rows
      });
    } catch (erro) {
      console.error('Erro ao listar clientes:', erro);
      res.status(500).json({ error: 'Erro ao listar clientes' });
    }
  });
  

module.exports = router;