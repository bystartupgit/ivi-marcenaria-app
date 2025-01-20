// routes/chat.js

const express = require('express');
const router = express.Router();
const HistoricoSuporte = require('../models/historicoSuporte');
const { verificarPermissoes, notificarParticipantes } = require('../utils/funcoesChat');
const authenticateToken = require('../middleware/auth');

// Endpoint para enviar uma mensagem no chat
router.post('/', authenticateToken, async (req, res) => {
  try {
    const { id_usuario, id_pedido, mensagem } = req.body;

    // Validação do tamanho da mensagem
    if (mensagem.length > 250) {
      return res.status(400).json({ mensagem: 'A mensagem não pode exceder 250 caracteres.' });
    }

    // Verificar permissões de comunicação
    const temPermissao = await verificarPermissoes(id_usuario, id_pedido);
    if (!temPermissao) {
      return res.status(403).json({ mensagem: 'Permissão negada.' });
    }

    // Registrar mensagem no banco de dados
    const novaMensagem = await HistoricoSuporte.create({ id_usuario, id_pedido, mensagem });

    // Notificar participantes do chat
    notificarParticipantes(id_pedido, novaMensagem);

    res.status(201).json({ mensagem: novaMensagem });
  } catch (erro) {
    res.status(500).json({ erro: 'Erro ao enviar mensagem.' });
  }
});

// Endpoint para listar mensagens de um pedido
router.post('/:id_pedido/listar', authenticateToken, async (req, res) => {
    try {
      const { id_pedido } = req.params;
      const { page , limit } = req.body; // Valores padrão para paginação
      // Calcular o deslocamento (offset) baseado na página e limite
      if(page === "" || page === "0"){
        page = 1;
      }
      if(limit === "" || limit === "0"){
        page = 10;
      }
      const offset = (page - 1) * limit;
      //console.log("Page é:", page);
      //console.log("Limit é:", limit);
      //console.log("O valor é:", offset);
      // Obter o número total de mensagens
      const totalMensagens = await HistoricoSuporte.count({
        where: { id_pedido }
      });
  
      // Calcular o número total de páginas
      const totalPages = Math.ceil(totalMensagens / limit);
  
      // Obter mensagens do banco de dados com paginação
      const mensagens = await HistoricoSuporte.findAll({
        where: { id_pedido },
        order: [['data_envio', 'ASC']],
        limit: parseInt(limit),
        offset: parseInt(offset)
      });
  
      res.status(200).json({
        mensagens,
        paginaAtual: parseInt(page),
        totalPaginas: totalPages,
        totalMensagens: totalMensagens
      });
    } catch (erro) {
      res.status(500).json({ erro: 'Erro ao listar mensagens.' });
    }
  });

module.exports = router;