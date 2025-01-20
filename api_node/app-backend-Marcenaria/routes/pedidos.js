const express = require('express');
const router = express.Router();
const Pedido = require('../models/pedido'); // Importando o modelo Pedido
const Cliente = require('../models/cliente');
const Proposta = require('../models/proposta'); // Modelo Proposta
const Usuario = require('../models/usuario'); // Modelo Usuario
const {registrarNotificacoes} = require('../utils/registrarNotificacoes');
const PrestadoresInteressados = require('../models/prestadoresInteressados');
const PrestadoresSelecionados = require('../models/prestadoresSelecionados');
const authenticateToken = require('../middleware/auth');
const { Op } = require('sequelize'); // Operadores do Sequelize

async function verificarExistencia(model, id) {
    if (id) {
      const existe = await model.findByPk(id);
      return !!existe; 
    }
    return true; 
  }

// Criar um novo Pedido
router.post('/criar', authenticateToken, async (req, res) => {
  try {
    const { id_cliente, titulo, descricao, status, contato, ambientes } = req.body;

    if (!id_cliente || !descricao || !titulo) {
      return res.status(400).json({ message: 'Os campos obrigatórios devem ser fornecidos (titulo, descricao e id_cliente).' });
    }

    const clienteExiste = await verificarExistencia(Cliente, id_cliente);
    if (!clienteExiste) {
      return res.status(400).json({ message: 'Cliente não encontrado.' });
    }

    const novoPedido = await Pedido.create({
      id_cliente,
      titulo,
      descricao,
      status,
      contato: contato || false, // Define o valor padrão como false se não for fornecido
      ambientes, // Novo campo para armazenar os ambientes
      data_pedido: new Date(), // Define a data atual para data_pedido
    });

    try {
      await registrarNotificacoes([id_cliente], 'cliente', 'novo_pedido', { id_cliente: id_cliente, id_pedido: novoPedido.id_pedido });
      res.status(201).json({
        message: 'Pedido criado e notificação enviada com sucesso.',
        pedido: novoPedido
      });
    } catch (notificationError) {
      console.error('Erro ao enviar notificação:', notificationError);
      res.status(201).json({
        message: 'Pedido criado com sucesso, mas falha ao enviar notificação.',
        pedido: novoPedido
      });
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro ao criar pedido.' });
  }
});

// Listar Pedidos de Cliente Específico Aguardando Orçamento
router.post('/cliente/:id/aguardando-orcamento', authenticateToken, async (req, res) => {
  try {
    const { id } = req.params;
    const { page = 1, limit = 10 } = req.body; // Usando o corpo da requisição para paginação
    const offset = (Number(page) - 1) * Number(limit);

    const { count, rows: pedidos } = await Pedido.findAndCountAll({
      where: {
        id_cliente: id,
        status: 'em analise' // Status correspondente a "aguardando orçamento"
      },
      limit: Number(limit),
      offset: Number(offset)
    });

    res.status(200).json({
      totalRegistros: count,
      totalPaginas: Math.ceil(count / Number(limit)),
      paginaAtual: Number(page),
      pedidos
    });
  } catch (error) {
    console.error('Erro ao listar pedidos aguardando orçamento:', error);
    res.status(500).json({ error: 'Erro ao listar pedidos aguardando orçamento' });
  }
});

// Listar Pedidos de Cliente Específico Aguardando Aprovação
router.post('/cliente/:id/aguardando-aprovacao', authenticateToken, async (req, res) => {
  try {
    const { id } = req.params;
    const { page = 1, limit = 10 } = req.body;
    const offset = (Number(page) - 1) * Number(limit);

    // Buscar as propostas associadas aos pedidos do cliente que estão aguardando aprovação
    const { count, rows: propostas } = await Proposta.findAndCountAll({
      where: {
        status: 'em negociacao' // Status correspondente a "aguardando aprovação"
      },
      include: [{
        model: Pedido,
        as: 'pedido',
        where: { id_cliente: id },
        attributes: ['titulo', 'contato']
      }],
      limit: Number(limit),
      offset: Number(offset)
    });

    res.status(200).json({
      totalRegistros: count,
      totalPaginas: Math.ceil(count / Number(limit)),
      paginaAtual: Number(page),
      propostas
    });
  } catch (error) {
    console.error('Erro ao listar pedidos aguardando aprovação:', error);
    res.status(500).json({ error: 'Erro ao listar pedidos aguardando aprovação' });
  }
});

// Listar Pedidos de Cliente Específico em Produção
router.post('/cliente/:id/em-producao', authenticateToken, async (req, res) => {
  try {
    const { id } = req.params;
    const { page = 1, limit = 10 } = req.body;
    const offset = (Number(page) - 1) * Number(limit);

    const { count, rows: pedidos } = await Pedido.findAndCountAll({
      where: {
        id_cliente: id,
        status: 'em execucao'
      },
      attributes: ['id_pedido', 'titulo', 'descricao', 'status', 'contato', 'data_pedido'],
      limit: Number(limit),
      offset: Number(offset)
    });

    res.status(200).json({
      totalRegistros: count,
      totalPaginas: Math.ceil(count / Number(limit)),
      paginaAtual: Number(page),
      pedidos
    });
  } catch (error) {
    console.error('Erro ao listar pedidos em produção:', error);
    res.status(500).json({ error: 'Erro ao listar pedidos em produção' });
  }
});

// Listar Pedidos de Cliente Específico Concluídos
router.post('/cliente/:id/concluidos', authenticateToken, async (req, res) => {
  try {
    const { id } = req.params;
    const { page = 1, limit = 10 } = req.body;
    const offset = (Number(page) - 1) * Number(limit);

    // Buscar todos os pedidos do cliente que estão concluídos
    const { count, rows: pedidos } = await Pedido.findAndCountAll({
      where: {
        id_cliente: id,
        status: 'concluido' // Status correspondente a "concluídos"
      },
      limit: Number(limit),
      offset: Number(offset)
    });

    res.status(200).json({
      totalRegistros: count,
      totalPaginas: Math.ceil(count / Number(limit)),
      paginaAtual: Number(page),
      pedidos
    });
  } catch (error) {
    console.error('Erro ao listar pedidos concluídos:', error);
    res.status(500).json({ error: 'Erro ao listar pedidos concluídos' });
  }
});

// Listar Pedidos que o Prestador Precisa Demonstrar Interesse
router.post('/prestador/:id/selecionado-aceitar', authenticateToken, async (req, res) => {
  try {
    const { id } = req.params;
    const { page = 1, limit = 10 } = req.body;
    const offset = (page - 1) * limit;

    const propostasInteressadas = await PrestadoresInteressados.findAndCountAll({
      where: { id_prestador: id, status_interesse: 'pendente' },
      include: [{
        model: Proposta,
        as: 'proposta',
        attributes: ['id_proposta'],
        include: [{
          model: Pedido,
          as: 'pedido',
          attributes: ['id_pedido', 'titulo', 'ambientes', 'status']
        }]
      }],
      limit,
      offset
    });

    res.status(200).json({
      totalRegistros: propostasInteressadas.count,
      totalPaginas: Math.ceil(propostasInteressadas.count / limit),
      paginaAtual: page,
      propostasInteressadas: propostasInteressadas.rows
    });
  } catch (error) {
    console.error('Erro ao listar propostas para demonstrar interesse:', error);
    res.status(500).json({ error: 'Erro ao listar propostas' });
  }
});

// Listar Pedidos em Execução
router.post('/prestador/:id/em-execucao', authenticateToken, async (req, res) => {
  try {
    const { id } = req.params;
    const { page = 1, limit = 10 } = req.body;
    const offset = (page - 1) * limit;

    const pedidosEmExecucao = await PrestadoresSelecionados.findAndCountAll({
      where: { id_prestador: id },
      include: [{
        model: Proposta,
        as: 'proposta',
        attributes: ['id_proposta'],
        include: [{
          model: Pedido,
          as: 'pedido',
          where: { status: 'em execucao' },
          attributes: ['id_pedido', 'titulo', 'ambientes', 'status']
        }]
      }],
      limit,
      offset
    });

    res.status(200).json({
      totalRegistros: pedidosEmExecucao.count,
      totalPaginas: Math.ceil(pedidosEmExecucao.count / limit),
      paginaAtual: page,
      pedidosEmExecucao: pedidosEmExecucao.rows
    });
  } catch (error) {
    console.error('Erro ao listar pedidos em execução:', error);
    res.status(500).json({ error: 'Erro ao listar pedidos em execução' });
  }
});

// Listar Pedidos com Execução Pendente
router.post('/prestador/:id/sem-execucao', authenticateToken, async (req, res) => {
  try {
    const { id } = req.params;
    const { page = 1, limit = 10 } = req.body;
    const offset = (page - 1) * limit;

    const pedidosSemExecucao = await PrestadoresSelecionados.findAndCountAll({
      where: {
        id_prestador: id,
        status_execucao: 'pendente'
      },
      include: [{
        model: Proposta,
        as: 'proposta',
        include: [{
          model: Pedido,
          as: 'pedido',
          attributes: ['id_pedido', 'titulo', 'ambientes', 'status']
        }]
      }],
      limit,
      offset
    });

    res.status(200).json({
      totalRegistros: pedidosSemExecucao.count,
      totalPaginas: Math.ceil(pedidosSemExecucao.count / limit),
      paginaAtual: page,
      pedidosSemExecucao: pedidosSemExecucao.rows.map(selecao => ({
        id_pedido: selecao.proposta.pedido.id_pedido,
        titulo: selecao.proposta.pedido.titulo,
        status: selecao.proposta.pedido.status
      }))
    });
  } catch (error) {
    console.error('Erro ao listar pedidos com execução pendente:', error);
    res.status(500).json({ error: 'Erro ao listar pedidos com execução pendente' });
  }
});

// Listar Pedidos Concluídos para um Prestador
router.post('/prestador/:id/concluidos', authenticateToken, async (req, res) => {
  try {
    const { id } = req.params;
    const { page = 1, limit = 10 } = req.body;
    const offset = (page - 1) * limit;

    const pedidosConcluidos = await PrestadoresSelecionados.findAndCountAll({
      where: {
        id_prestador: id,
        status_execucao: 'concluido' // Verifica se o prestador concluiu a execução
      },
      include: [{
        model: Proposta,
        as: 'proposta',
        include: [{
          model: Pedido,
          as: 'pedido',
          where: { status: 'concluido' }, // Verifica se o pedido está concluído
          attributes: ['id_pedido', 'titulo', 'ambientes', 'status']
        }]
      }],
      limit,
      offset
    });

    res.status(200).json({
      totalRegistros: pedidosConcluidos.count,
      totalPaginas: Math.ceil(pedidosConcluidos.count / limit),
      paginaAtual: page,
      pedidosConcluidos: pedidosConcluidos.rows.map(selecao => ({
        id_pedido: selecao.proposta.pedido.id_pedido,
        titulo: selecao.proposta.pedido.titulo,
        status: selecao.proposta.pedido.status
      }))
    });
  } catch (error) {
    console.error('Erro ao listar pedidos concluídos:', error);
    res.status(500).json({ error: 'Erro ao listar pedidos concluídos' });
  }
});

// Função auxiliar para listar pedidos com base no status
const listarPedidosPorStatus = async (req, res, status, verificarPropostas = null) => {
  try {
    const { page = 1, limit = 10 } = req.body;
    const offset = (page - 1) * limit;

    let condicoes = { status };

    if (verificarPropostas !== null) {
      const propostasExistem = await Proposta.findAll({
        attributes: ['id_pedido'],
      });
      const idsPedidosComPropostas = propostasExistem.map(p => p.id_pedido);

      if (verificarPropostas) {
        // Pedidos que têm propostas
        condicoes.id_pedido = { [Op.in]: idsPedidosComPropostas };
      } else {
        // Pedidos que não têm propostas
        condicoes.id_pedido = { [Op.notIn]: idsPedidosComPropostas };
      }
    }

    const pedidos = await Pedido.findAndCountAll({
      where: condicoes,
      attributes: ['id_pedido', 'titulo', 'status', 'ambientes'],
      limit,
      offset,
    });

    res.status(200).json({
      totalRegistros: pedidos.count,
      totalPaginas: Math.ceil(pedidos.count / limit),
      paginaAtual: page,
      pedidos: pedidos.rows,
    });
  } catch (error) {
    console.error(`Erro ao listar pedidos com status ${status}:`, error);
    res.status(500).json({ error: `Erro ao listar pedidos com status ${status}` });
  }
};

// Listar Pedidos Recusados
router.post('/listar/recusados', authenticateToken, async (req, res) => {
  listarPedidosPorStatus(req, res, 'recusado');
});

// Listar Pedidos em Execução
router.post('/listar/em-execucao', authenticateToken, async (req, res) => {
  listarPedidosPorStatus(req, res, 'em execucao');
});

// Listar Pedidos que ainda não estão em execução
router.post('/listar/aceitos', authenticateToken, async (req, res) => {
  listarPedidosPorStatus(req, res, 'aceito');
});

// Listar Pedidos Concluídos
router.post('/listar/concluidos', authenticateToken, async (req, res) => {
  listarPedidosPorStatus(req, res, 'concluido');
});

// Listar Pedidos Aguardando Orçamento
router.post('/listar/aguardando-orcamento', authenticateToken, async (req, res) => {
  listarPedidosPorStatus(req, res, 'em analise', false);
});

// Listar Pedidos Aguardando Aprovação dos Clientes
router.post('/listar/aguardando-aprovacao', authenticateToken, async (req, res) => {
  listarPedidosPorStatus(req, res, 'em analise', true);
});

// Endpoint para obter quantitativos de pedidos
router.post('/quantitativos', authenticateToken, async (req, res) => {
  try {
    const propostasExistem = await Proposta.findAll({
      attributes: ['id_pedido'],
    });
    const idsPedidosComPropostas = propostasExistem.map(p => p.id_pedido);

    const [recusados, emExecucao, aceitos, concluidos, aguardandoAprovacao, aguardandoOrcamento] = await Promise.all([
      Pedido.count({ where: { status: 'recusado' } }),
      Pedido.count({ where: { status: 'em execucao' } }),
      Pedido.count({ where: { status: 'aceito' } }),
      Pedido.count({ where: { status: 'concluido' } }),
      Pedido.count({
        where: {
          status: 'em analise',
          id_pedido: { [Op.in]: idsPedidosComPropostas },
        },
      }),
      Pedido.count({
        where: {
          status: 'em analise',
          id_pedido: { [Op.notIn]: idsPedidosComPropostas },
        },
      }),
    ]);

    res.status(200).json({
      Pedidos: {
        recusados,
        em_execucao: emExecucao,
        aceitos,
        concluidos,
        aguardando_aprovacao: aguardandoAprovacao,
        aguardando_orcamento: aguardandoOrcamento,
      },
    });
  } catch (error) {
    console.error('Erro ao obter quantitativos de pedidos:', error);
    res.status(500).json({ error: 'Erro ao obter quantitativos de pedidos' });
  }
});

module.exports = router;