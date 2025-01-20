// routes/propostas.js

const express = require('express');
const router = express.Router();
const Proposta = require('../models/proposta');
const PrestadoresInteressados = require('../models/prestadoresInteressados');
const PrestadoresSelecionados = require('../models/prestadoresSelecionados');
const Cliente = require('../models/cliente');
const Pedido = require('../models/pedido'); // Assumindo que este é o modelo para pedidos
const Prestador = require('../models/prestador'); // Assumindo que este é o modelo para prestadores
const { registrarNotificacoes } = require('../utils/registrarNotificacoes');
const { obterAdministradoresParaNotificacao } = require('../utils/registrarNotificacoes');
const authenticateToken = require('../middleware/auth');

// Helper para verificar a existência do registro
async function verificarExistencia(model, id) {
  if (id) {
    const existe = await model.findByPk(id);
    return !!existe; // Retorna true se o registro existir
  }
  return true; // Se o id for nulo, consideramos como não aplicável
}

// Endpoint para criar uma nova proposta
router.post('/criar', authenticateToken, async (req, res) => {
  try {
    const {
      id_pedido,
      mensagem,
      valor_total,
      valor_pix,
      valor_desconto,
      entrada_minima,
      parcelas,
      escassez_temporal,
      de_por,
      url_arquivo_orcamento
    } = req.body;

    // Verificação de existência do pedido
    const pedido = await Pedido.findByPk(id_pedido);
    if (!pedido) {
      return res.status(404).json({ error: 'Pedido não encontrado.' });
    }

    if (!valor_total || !valor_pix || !valor_desconto) {
      return res.status(400).json({ error: 'Campos obrigatórios não foram preenchidos.' });
    }

    // Criando uma nova proposta no banco de dados
    const proposta = await Proposta.create({
      id_pedido,
      mensagem,
      valor_total,
      valor_pix,
      valor_desconto,
      entrada_minima,
      parcelas,
      escassez_temporal,
      de_por,
      url_arquivo_orcamento,
      status: 'em negociacao'
    });
    // Atualizar status da proposta para "em execução"
    await Pedido.update(
      { status: 'aceito' },
      { where: { id_pedido: id_pedido } }
    );
    // Registrar notificação para o cliente
    await registrarNotificacoes(
      [pedido.id_cliente], // ID do cliente
      'cliente', // Tipo de entidade
      'nova_proposta', // Tipo de notificação
      {
        id_pedido: id_pedido,
        id_proposta: proposta.id_proposta
      }
    );

    res.status(201).json(proposta);
  } catch (error) {
    console.error('Erro ao criar proposta:', error);
    res.status(500).json({ error: 'Erro ao criar proposta' });
  }
});

// Endpoint para selecionar prestadores potenciais
router.post('/:idProposta/selecionar-potencial', authenticateToken, async (req, res) => {
  try {
    const { idProposta } = req.params;
    const { prestadores } = req.body; // Array de IDs de prestadores

    // Verificação de existência da proposta
    if (!(await verificarExistencia(Proposta, idProposta))) {
      return res.status(404).json({ error: 'Proposta não encontrada.' });
    }

    for (const id_prestador of prestadores) {
      // Verificação de existência de cada prestador
      if (!(await verificarExistencia(Prestador, id_prestador))) {
        return res.status(404).json({ error: `Prestador com ID ${id_prestador} não encontrado.` });
      }
    }

    const interesses = await Promise.all(prestadores.map(id_prestador =>
      PrestadoresInteressados.create({
        id_proposta: idProposta,
        id_prestador,
        status_interesse: 'pendente'
      })
    ));

    // Registrar notificações para prestadores
    await Promise.all(prestadores.map(id_prestador =>
      registrarNotificacoes(
        [id_prestador], // IDs dos prestadores
        'prestador', // Tipo de entidade
        'interesse_prestador', // Tipo de notificação
        {
          id_proposta: idProposta,
          id_prestador: id_prestador
        }
      )
    ));

    res.status(201).json(interesses);
  } catch (error) {
    console.error('Erro ao registrar prestadores potenciais:', error);
    res.status(500).json({ error: 'Erro ao registrar prestadores potenciais' });
  }
});

// Endpoint para prestadores demonstrarem interesse ou recusar
router.post('/:idProposta/interesse', authenticateToken, async (req, res) => {
  try {
    const { idProposta } = req.params;
    const { id_prestador, status_interesse } = req.body; // status_interesse: 'interessado' ou 'recusado'

    // Verificação de existência da proposta e do prestador
    const proposta = await Proposta.findByPk(idProposta);
    if (!proposta) {
      return res.status(404).json({ error: 'Proposta não encontrada.' });
    }

    if (!(await verificarExistencia(Prestador, id_prestador))) {
      return res.status(404).json({ error: 'Prestador não encontrado.' });
    }

    await PrestadoresInteressados.update(
      { status_interesse },
      { where: { id_proposta: idProposta, id_prestador } }
    );

    // Obter IDs dos administradores para notificação
    const idsAdministradores = await obterAdministradoresParaNotificacao();

    // Registrar notificação para os administradores
    await registrarNotificacoes(
      idsAdministradores, // IDs dos administradores
      'administrador',    // Tipo de entidade
      'interesse', // Tipo de notificação
      {
        id_proposta: idProposta,
        id_prestador: id_prestador,
        status_interesse: status_interesse
      }
    );

    res.status(200).json({ 
      message: 'Interesse registrado com sucesso.'
    });
  } catch (error) {
    console.error('Erro ao atualizar interesse:', error);
    res.status(500).json({ error: 'Erro ao atualizar interesse' });
  }
});

// Endpoint para selecionar prestadores interessados para execução
router.post('/:idProposta/selecionar-execucao', authenticateToken, async (req, res) => {
  try {
    const { idProposta } = req.params;
    const { prestadores } = req.body; // Array de IDs de prestadores

    // Verificação de existência da proposta
    if (!(await verificarExistencia(Proposta, idProposta))) {
      return res.status(404).json({ error: 'Proposta não encontrada.' });
    }

    const prestadoresNaoInteressados = [];

    for (const id_prestador of prestadores) {
      // Verifica se o prestador está interessado
      const interesse = await PrestadoresInteressados.findOne({
        where: { id_proposta: idProposta, id_prestador, status_interesse: 'interessado' }
      });

      if (!interesse) {
        prestadoresNaoInteressados.push(id_prestador);
      }
    }

    // Se houver prestadores não interessados, retorna erro
    if (prestadoresNaoInteressados.length > 0) {
      return res.status(400).json({
        error: `Os seguintes prestadores não estão interessados e não podem ser selecionados para execução: ${prestadoresNaoInteressados.join(', ')}`
      });
    }

    const selecoes = await Promise.all(prestadores.map(id_prestador =>
      PrestadoresSelecionados.create({
        id_proposta: idProposta,
        id_prestador,
        status_execucao: 'pendente'
      })
    ));

    // Registrar notificações para prestadores selecionados
    await Promise.all(prestadores.map(id_prestador =>
      registrarNotificacoes(
        [id_prestador], // IDs dos prestadores
        'prestador', // Tipo de entidade
        'selecao_prestadores', // Tipo de notificação
        {
          id_proposta: idProposta,
          id_prestador: id_prestador
        }
      )
    ));

    res.status(201).json(selecoes);
  } catch (error) {
    console.error('Erro ao selecionar prestadores para execução:', error);
    res.status(500).json({ error: 'Erro ao selecionar prestadores para execução' });
  }
});

// Endpoint para aprovar proposta
router.post('/:id_proposta/aprovar', authenticateToken, async (req, res) => {
  const { id_proposta } = req.params;
  const { id_cliente } = req.body;

  try {
    // Buscar a proposta
    const proposta = await Proposta.findByPk(id_proposta);
    
    if (!proposta) {
      return res.status(404).json({ error: 'Proposta não encontrada.' });
    }

    // Buscar o pedido relacionado
    const pedido = await Pedido.findOne({
      where: {
        id_pedido: proposta.id_pedido,
        id_cliente: id_cliente
      }
    });

    if (!pedido) {
      return res.status(404).json({ error: 'Pedido não encontrado ou não pertence ao cliente.' });
    }

    // Atualizar status da proposta
    await Proposta.update(
      { status: 'aceita' },
      { where: { id_proposta: id_proposta } }
    );

    // Registrar notificação
    await registrarNotificacoes(
      [pedido.id_cliente],
      'cliente',
      'aprovacao_proposta',
      {
        id_pedido: pedido.id_pedido,
        id_proposta: id_proposta
      }
    );

    // Atualiza o status do pedido
    await Pedido.update(
      { status: 'aceito' },
      { where: { id_pedido: pedido.id_pedido } }
    );

    res.status(200).json({
      message: 'Proposta aprovada com sucesso',
      proposta: proposta
    });
  } catch (error) {
    console.error('Erro ao aprovar proposta:', error);
    res.status(500).json({
      message: 'Erro ao aprovar proposta',
      error: error.message
    });
  }
});

// Endpoint para reprovar proposta
router.post('/:id_proposta/reprovar', authenticateToken, async (req, res) => {
  const { id_proposta } = req.params;
  const { id_cliente } = req.body;

  try {
    // Buscar a proposta
    const proposta = await Proposta.findByPk(id_proposta);
    
    if (!proposta) {
      return res.status(404).json({ error: 'Proposta não encontrada.' });
    }

    // Buscar o pedido relacionado
    const pedido = await Pedido.findOne({
      where: {
        id_pedido: proposta.id_pedido,
        id_cliente: id_cliente
      }
    });

    if (!pedido) {
      return res.status(404).json({ error: 'Pedido não encontrado ou não pertence ao cliente.' });
    }

    // Atualizar status da proposta
    await Proposta.update(
      { status: 'recusada' },
      { where: { id_proposta: id_proposta } }
    );

    // Registrar notificação
    await registrarNotificacoes(
      [pedido.id_cliente],
      'cliente',
      'reprovacao_proposta',
      {
        id_pedido: pedido.id_pedido,
        id_proposta: id_proposta
      }
    );

    // Atualiza o status do pedido
    await Pedido.update(
      { status: 'recusado' },
      { where: { id_pedido: pedido.id_pedido } }
    );

    res.status(200).json({
      message: 'Proposta reprovada com sucesso',
      proposta: proposta
    });
  } catch (error) {
    console.error('Erro ao reprovar proposta:', error);
    res.status(500).json({
      message: 'Erro ao reprovar proposta',
      error: error.message
    });
  }
});

// Endpoint para iniciar a execução de uma proposta
router.post('/:idProposta/iniciar-execucao', authenticateToken, async (req, res) => {
  try {
    const { idProposta } = req.params;
    const { id_prestador } = req.body;
    //const { id_pedido } = req.body;
    // Buscar a proposta
    const proposta = await Proposta.findByPk(idProposta);
    if (!proposta) {
      return res.status(404).json({ error: 'Proposta não encontrada.' });
    }

    // Obter o pedido relacionado
    const pedido = await Pedido.findByPk(proposta.id_pedido);
    if (!pedido) {
      return res.status(404).json({ error: 'Pedido relacionado não encontrado.' });
    }

    // Atualizar status da proposta para "em execução"
    await pedido.update(
      { status: 'em execucao' },
      { where: { id_pedido: proposta.id_pedido } }
    );
    // Atualizar status da proposta para "em execução"
    await PrestadoresSelecionados.update(
      { status_execucao: 'em execucao' },
      { where: { id_proposta: proposta.id_proposta, id_prestador: id_prestador } }
    );

    // Obter IDs dos administradores para notificação 
    const idsAdministradores = await obterAdministradoresParaNotificacao();

    // Registrar notificações para o cliente e administradores
    await registrarNotificacoes(
      [pedido.id_cliente, ...idsAdministradores],
      'cliente', // Tipo de entidade
      'inicio_execucao', // Tipo de notificação
      {
        id_proposta: idProposta,
        id_pedido: proposta.id_pedido
      }
    );

    res.status(200).json({
      message: 'Execução iniciada com sucesso.',
      proposta: proposta
    });
  } catch (error) {
    console.error('Erro ao iniciar execução:', error);
    res.status(500).json({ error: 'Erro ao iniciar execução' });
  }
});

// Endpoint para registrar o pagamento de uma proposta
router.post('/:idProposta/pagamento', authenticateToken, async (req, res) => {
  try {
    const { idProposta } = req.params;

    // Buscar a proposta
    const proposta = await Proposta.findByPk(idProposta);
    if (!proposta) {
      return res.status(404).json({ error: 'Proposta não encontrada.' });
    }

    // Atualizar o status da proposta para "paga"
    await proposta.update(
      { status: 'paga' }
    );

    res.status(200).json({
      message: 'Pagamento registrado com sucesso.',
      proposta: proposta
    });
  } catch (error) {
    console.error('Erro ao registrar pagamento:', error);
    res.status(500).json({ error: 'Erro ao registrar pagamento' });
  }
});

// Endpoint para concluir a execução de uma proposta
router.post('/:idProposta/conclusao-execucao', authenticateToken, async (req, res) => {
  try {
    const { idProposta } = req.params;

    // Buscar a proposta
    const proposta = await Proposta.findByPk(idProposta);
    if (!proposta) {
      return res.status(404).json({ error: 'Proposta não encontrada.' });
    }

    const idPedido = proposta.id_pedido; // ou proposta.id_cliente se estiver diretamente disponível

    if (!idPedido) {
      return res.status(400).json({ error: 'Identificador de pedido não encontrado na proposta.' });
    }

    // Buscar o id_cliente usando o id_usuario
    const collpedido = await Pedido.findOne({
      where: { id_pedido: idPedido }
    });

    // Atualizar o status do pedido para "concluido"
    await Pedido.update(
      { status: 'concluido' },
      { where: { id_pedido: proposta.id_pedido } }
    );

    // Atualizar o status dos prestadores selecionados para "concluido"
    await PrestadoresSelecionados.update(
      { status_execucao: 'concluido' },
      { where: { id_proposta: proposta.id_proposta } }
    );

    // Obter IDs dos administradores para notificação
    const idsAdministradores = await obterAdministradoresParaNotificacao();

    // Registrar notificações para o cliente e administradores
    await registrarNotificacoes(
      [collpedido.id_cliente, ...idsAdministradores],
      'cliente', // Tipo de entidade
      'conclusao_execucao', // Tipo de notificação
      {
        id_proposta: idProposta,
        id_pedido: proposta.id_pedido
      }
    );

    res.status(200).json({
      message: 'Execução concluída com sucesso.',
      proposta: proposta
    });
  } catch (error) {
    console.error('Erro ao concluir execução:', error);
    res.status(500).json({ error: 'Erro ao concluir execução' });
  }
});

module.exports = router;