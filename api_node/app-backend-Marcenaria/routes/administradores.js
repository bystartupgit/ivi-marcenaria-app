// routes/administradores.js

const express = require('express');
const router = express.Router();
const Administrador = require('../models/administrador'); // Modelo Administrador
const Usuario = require('../models/usuario'); // Modelo Usuario
const { Op } = require('sequelize'); // Operadores do Sequelize
const authenticateToken = require('../middleware/auth');

// Endpoint para listar administradores com filtro por nome e incluir dados de usuários
router.post('/', authenticateToken, async (req, res) => {
  try {
    const { nome, page = 1, limit = 10 } = req.body;
    const offset = (page - 1) * limit;
    const administradores = await Administrador.findAndCountAll({
      include: [{
        model: Usuario,
        where: nome ? { nome: { [Op.iLike]: `%${nome}%` } } : {}, 
        attributes: ['nome', 'email', 'telefone'] 
      }],
      limit: parseInt(limit), 
      offset: parseInt(offset)
    });

    res.status(200).json({
      totalRegistros: administradores.count,
      totalPaginas: Math.ceil(administradores.count / limit),
      paginaAtual: parseInt(page),
      administradores: administradores.rows
    });
  } catch (erro) {
    console.error('Erro ao listar administradores:', erro);
    res.status(500).json({ error: 'Erro ao listar administradores' });
  }
});

module.exports = router;