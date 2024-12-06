const express = require('express');
const router = express.Router();
const Midia = require('../models/midia');
const Usuario = require('../models/usuario');
const Cliente = require('../models/cliente');
const Prestador = require('../models/prestador');
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

module.exports = router;