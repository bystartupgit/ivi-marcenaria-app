// routes/midia.js
const express = require('express');
const router = express.Router();
const Midia = require('../models/midia');
const Usuario = require('../models/usuario');
const Cliente = require('../models/cliente');
const Prestador = require('../models/prestador');
const Pedido = require('../models/pedido');
const Proposta = require('../models/proposta');
const Administrador = require('../models/administrador');

// Helper para verificar a existência do registro
async function verificarExistencia(model, id) {
  if (id) {
    const existe = await model.findByPk(id);
    return !!existe; // Retorna true se o registro existir
  }
  return true; // Se o id for nulo, consideramos como não aplicável
}

// Rota para registrar metadados de mídia
router.post('/', async (req, res) => {
  try {
    const { nome_arquivo, tipo, caminho, id_cliente, id_prestador, id_pedido, id_proposta, descricao } = req.body;

    // Verificar se o nome do arquivo esta vazio
    if (!nome_arquivo) {
        return res.status(400).json({ message: 'O nome do arquivo deve ser informado.' });
    }

    // Verificar se todos os IDs estão vazios
    if (!id_cliente && !id_prestador && !id_pedido && !id_proposta) {
      return res.status(400).json({ message: 'Pelo menos um identificador de associação deve ser fornecido.' });
    }

    // Verificar a existência dos registros nas tabelas correspondentes
    const clienteExiste = await verificarExistencia(Cliente, id_cliente);
    const prestadorExiste = await verificarExistencia(Prestador, id_prestador);
    //const pedidoExiste = await verificarExistencia(Pedido, id_pedido);
    //const propostaExiste = await verificarExistencia(Proposta, id_proposta);

    if (!clienteExiste) {
      return res.status(400).json({ message: 'Cliente não encontrado.' });
    }
    if (!prestadorExiste) {
      return res.status(400).json({ message: 'Prestador não encontrado.' });
    }
    /*
    if (!pedidoExiste) {
      return res.status(400).json({ message: 'Pedido não encontrado.' });
    }
    if (!propostaExiste) {
      return res.status(400).json({ message: 'Proposta não encontrada.' });
    }
    */
    // Criar novo registro de mídia
    const novaMidia = await Midia.create({
      nome_arquivo,
      tipo,
      caminho,
      id_cliente,
      id_prestador,
      id_pedido,
      id_proposta,
      descricao,
    });

    res.status(201).json({
      message: 'Mídia registrada com sucesso',
      midia: novaMidia,
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro ao registrar a mídia' });
  }
});

router.post('/listar-todas-midias', async (req, res) => {
  try {
    const { page = 1, limit = 10 } = req.body; // Paginação

    const { count, rows: midias } = await Midia.findAndCountAll({
      include: [
        { model: Cliente, as: 'cliente', attributes: ['id_cliente'], required: false },
        { model: Pedido, as: 'pedido', attributes: ['id_pedido', 'titulo', 'status', 'ambientes'], required: false },
        { model: Proposta, as: 'proposta', attributes: ['id_proposta'], required: false }
      ],
      offset: (page - 1) * limit,
      limit: limit,
      order: [['data_criacao', 'DESC']]
    });

    res.status(200).json({
      totalRegistros: count,
      totalPaginas: Math.ceil(count / limit),
      paginaAtual: page,
      midias: midias
    });
  } catch (error) {
    console.error('Erro ao listar mídias:', error);
    res.status(500).json({ error: 'Erro ao listar mídias' });
  }
});

// Endpoint para listar mídias de um pedido específico
router.post('/listar-midias-pedido', async (req, res) => {
  try {
    const { idPedido, page = 1, limit = 10 } = req.body;

    const { count, rows: midias } =  await Midia.findAndCountAll({
      where: { id_pedido: idPedido },
      include: [
        { model: Pedido, as: 'pedido', attributes: ['id_pedido', 'titulo', 'status', 'ambientes'], required: false }
      ],
      offset: (page - 1) * limit,
      limit: limit
    });

    res.status(200).json({
      totalRegistros: count,
      totalPaginas: Math.ceil(count / limit),
      paginaAtual: page,
      midias: midias
    });
  } catch (error) {
    console.error('Erro ao listar mídias do pedido:', error);
    res.status(500).json({ error: 'Erro ao listar mídias do pedido' });
  }
});

// Endpoint para listar mídias de uma proposta específica
router.post('/listar-midias-proposta', async (req, res) => {
  try {
    const { idProposta, page = 1, limit = 10 } = req.body;

    const { count, rows: midias } = await Midia.findAndCountAll({
      where: { id_proposta: idProposta },
      include: [
        { model: Proposta, as: 'proposta', attributes: ['id_proposta'], required: false }
      ],
      offset: (page - 1) * limit,
      limit: limit
    });

    res.status(200).json({
      totalRegistros: count,
      totalPaginas: Math.ceil(count / limit),
      paginaAtual: page,
      midias: midias
    });
  } catch (error) {
    console.error('Erro ao listar mídias da proposta:', error);
    res.status(500).json({ error: 'Erro ao listar mídias da proposta' });
  }
});

// Endpoint para listar uma mídia específica
router.post('/listar-midia', async (req, res) => {
  try {
    const { idMidia } = req.body;

    const midia = await Midia.findByPk(idMidia, {
      include: [
        { model: Cliente, as: 'cliente', attributes: ['id_cliente'], required: false },
        { model: Pedido, as: 'pedido', attributes: ['id_pedido', 'titulo', 'status', 'ambientes'], required: false },
        { model: Proposta, as: 'proposta', attributes: ['id_proposta'], required: false }
      ]
    });

    if (!midia) {
      return res.status(404).json({ error: 'Mídia não encontrada' });
    }

    res.status(200).json(midia);
  } catch (error) {
    console.error('Erro ao listar mídia específica:', error);
    res.status(500).json({ error: 'Erro ao listar mídia específica' });
  }
});


module.exports = router;