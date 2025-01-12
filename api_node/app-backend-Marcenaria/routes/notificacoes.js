// routes/notificacoes.js

const express = require('express');
const Notificacao = require('../models/notificacao');

const router = express.Router();

// Endpoint para alterar o status de uma notificação para lida
router.post('/status', async (req, res) => {
  try {
    const { id_notificacao } = req.body;

    if (!id_notificacao) {
      return res.status(400).json({ message: 'O ID da notificação é obrigatório.' });
    }

    const notificacao = await Notificacao.findByPk(id_notificacao);

    if (!notificacao) {
      return res.status(404).json({ message: 'Notificação não encontrada.' });
    }

    // Atualizar o campo 'lida' para true
    notificacao.lida = true;
    await notificacao.save();

    res.status(200).json({ message: 'Notificação marcada como lida com sucesso.' });
  } catch (error) {
    console.error('Erro ao alterar status da notificação:', error);
    res.status(500).json({ error: 'Erro ao alterar status da notificação' });
  }
});

// Endpoint para listar notificações de um usuário específico
router.post('/listar-notificacoes', async (req, res) => {
  try {
    const { idUsuario, page = 1, limit = 10 } = req.body; // Paginação

    const { count, rows: notificacoes } = await Notificacao.findAndCountAll({
      where: { id_usuario: idUsuario },
      offset: (page - 1) * limit,
      limit: limit,
      order: [['data_criacao', 'DESC']] // Ordenar por data de criação, mais recente primeiro
    });

    res.status(200).json({
      totalRegistros: count,
      totalPaginas: Math.ceil(count / limit),
      paginaAtual: page,
      notificacoes: notificacoes
    });
  } catch (error) {
    console.error('Erro ao listar notificações:', error);
    res.status(500).json({ error: 'Erro ao listar notificações' });
  }
});

module.exports = router;