// routes/chat.js

const express = require('express');
const router = express.Router();
const HistoricoSuporte = require('../models/historicoSuporte');
const Usuario = require('../models/usuario');
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

// Endpoint para enviar uma mensagem ao suporte
router.post('/suporte', authenticateToken, async (req, res) => {
  try {
    const { id_usuario, id_usuario_suporte, mensagem } = req.body;

    // Validação dos dados
    if (!id_usuario || !id_usuario_suporte || !mensagem) {
      return res.status(400).json({ mensagem: 'Campos obrigatórios não preenchidos.' });
    }
    // Verificar se o Usuario existe
    const usuario = await Usuario.findByPk(id_usuario);
    if (!usuario) {
      return res.status(404).json({ error: 'Usuário nao encontrado' });
    }
    // Validação do tamanho da mensagem
    if (mensagem.length > 250) {
      return res.status(400).json({ mensagem: 'A mensagem não pode exceder 250 caracteres.' });
    }

    // Registrar mensagem no banco de dados como mensagem de suporte
    const novaMensagem = await HistoricoSuporte.create({
      id_usuario,
      id_usuario_suporte,
      mensagem,
      in_suporte: true // Marcar como mensagem de suporte
    });

    res.status(201).json({ mensagem: novaMensagem });
  } catch (erro) {
    console.error('Erro ao enviar mensagem de suporte:', erro);
    res.status(500).json({ erro: 'Erro ao enviar mensagem de suporte.' });
  }
});

// Endpoint para listar mensagens de suporte de um usuário específico
router.post('/suporte/:id_usuario_suporte/listar', authenticateToken, async (req, res) => {
  try {
    const { id_usuario_suporte } = req.params;
    const { page , limit } = req.body; // Valores padrão para paginação
    const offset = (page - 1) * limit; // Calcular o deslocamento
    // Buscar mensagens de suporte para o usuário específico com paginação
    const { count, rows: mensagensSuporte } = await HistoricoSuporte.findAndCountAll({
      where: {
        id_usuario_suporte,
        in_suporte: true
      },
      order: [['data_envio', 'ASC']], // Ordenar por data de criação
      limit,
      offset
    });

    // Calcular o total de páginas
    const totalPages = Math.ceil(count / limit);

    // Responder com as mensagens e informações de paginação
    res.status(200).json({
      mensagens: mensagensSuporte,
      paginaAtual: page,
      totalPaginas: totalPages,
      totalMensagens: count
    });
  } catch (erro) {
    console.error('Erro ao listar mensagens de suporte:', erro);
    res.status(500).json({ erro: 'Erro ao listar mensagens de suporte.' });
  }
});

module.exports = router;