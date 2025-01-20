// routes/prestadores.js

const express = require('express');
const router = express.Router();
const Prestador = require('../models/prestador'); 
const Usuario = require('../models/usuario'); 
const { Op } = require('sequelize'); 
const authenticateToken = require('../middleware/auth');

// Endpoint para listar prestadores com filtro por nome e incluir dados de usuários
router.post('/', authenticateToken, async (req, res) => {
  try {
    const { nome, page = 1, limit = 10 } = req.body;
    const offset = (page - 1) * limit;
    const prestadores = await Prestador.findAndCountAll({
      include: [{
        model: Usuario,
        where: nome ? { nome: { [Op.iLike]: `%${nome}%` } } : {}, 
        attributes: ['nome', 'email', 'telefone'] 
      }],
      limit: parseInt(limit), 
      offset: parseInt(offset)
    });
    res.status(200).json({
      totalRegistros: prestadores.count,
      totalPaginas: Math.ceil(prestadores.count / limit),
      paginaAtual: parseInt(page),
      prestadores: prestadores.rows
    });
  } catch (erro) {
    console.error('Erro ao listar prestadores:', erro);
    res.status(500).json({ error: 'Erro ao listar prestadores' });
  }
});

module.exports = router;