// utils/funcoesChat.js

const Pedido = require('../models/pedido');
const Usuario = require('../models/usuario');
const Proposta = require('../models/proposta');
const Notificacao = require('../models/notificacao');
const PrestadoresSelecionados = require('../models/prestadoresSelecionados');
const Administrador = require('../models/administrador');
const Cliente = require('../models/cliente');
const Prestador = require('../models/prestador');
const PreferenciasNotificacoes = require('../models/preferenciasNotificacoes');
const enviarNotificacao = require('./enviarNotificacao');

// Função para verificar permissões de um usuário em relação a um pedido
async function verificarPermissoes(id_usuario, id_pedido) {
    try {
      // Buscar o id_cliente usando o id_usuario
      const cliente = await Cliente.findOne({
        where: { id_usuario: id_usuario }
      });
      // Verificar se o usuário é o cliente do pedido
      const pedido = await Pedido.findOne({ where: { id_pedido, id_cliente: cliente.id_cliente } });
      if (pedido) {
        return true;
      }
      
      // Obter a proposta associada ao pedido
      const proposta = await Proposta.findOne({ where: { id_pedido: id_pedido } });
      if (!proposta) {
        console.error('Proposta não encontrada para o pedido.');
        return false;
      }
       // Obter a usuário associado ao prestador
       const prestador = await Prestador.findOne({ where: { id_usuario } });
       if (!prestador) {
         console.error('Usuário não encontrado para o prestador.');
         return false;
       } 
      // Verificar se o usuário é um prestador selecionado para a execução da proposta
      const prestadorSelecionado = await PrestadoresSelecionados.findOne({
        where: { id_proposta: proposta.id_proposta, id_prestador: prestador.id_prestador }
      });
      if (prestadorSelecionado) {
        return true;
      }
  
      // Verificar se o usuário é um administrador ativo
      const administrador = await Administrador.findOne({ where: { id_usuario, status: true } });
      if (administrador) {
        return true;
      }
  
      return false;
    } catch (erro) {
      console.error('Erro ao verificar permissões:', erro);
      return false;
    }
  }

// Função para notificar participantes de um pedido no contexto do chat
async function notificarParticipantes(id_pedido, mensagem) {
  try {
    const pedido = await Pedido.findOne({ where: { id_pedido } });
    const enviarPush = true;
    if (!pedido) {
      console.error('Pedido não encontrado.');
      return;
    }

    const proposta = await Proposta.findOne({ where: { id_pedido } });
    if (!proposta) {
      console.error('Proposta não encontrada para o pedido.');
      return;
    }

    // Obter o id_usuario do cliente
    const cliente = await Cliente.findOne({ where: { id_cliente: pedido.id_cliente } });
    const idsUsuarios = cliente ? [cliente.id_usuario] : [];

    // Obter os id_usuario dos prestadores associados à proposta
    const prestadores = await PrestadoresSelecionados.findAll({ where: { id_proposta: proposta.id_proposta } });
    for (const prestador of prestadores) {
      const prestadorInfo = await Prestador.findOne({ where: { id_prestador: prestador.id_prestador } });
      if (prestadorInfo) {
        idsUsuarios.push(prestadorInfo.id_usuario);
      }
    }

    // Obter os id_usuario dos administradores ativos
    const administradores = await Administrador.findAll({ where: { status: true } });
    administradores.forEach(admin => idsUsuarios.push(admin.id_usuario));

    // Remover duplicatas
    const destinatarios = [...new Set(idsUsuarios)];

    // Criar notificações para cada destinatário com base nas preferências
    await Promise.all(destinatarios.map(async id_usuario => {
      // Evitar notificar o usuário que enviou a mensagem
      if (id_usuario === mensagem.id_usuario) {
        return;
      }

      const preferencia = await PreferenciasNotificacoes.findOne({
        where: { id_usuario, tipo: 'nova_mensagem', ativo: true }
      });

      if (preferencia) {
        await Notificacao.create({
          id_usuario,
          tipo: 'nova_mensagem',
          mensagem: `Nova mensagem no pedido ${id_pedido}: ${mensagem.mensagem}`,
          id_pedido: id_pedido // Incluindo o id_pedido na notificação
        });
        // Enviar notificação push se enviarPush for true
        if (enviarPush) {
          const usuario = await Usuario.findOne({ where: { id_usuario: id_usuario } });
          if (usuario && usuario.preferenciasNotificacoes && usuario.preferenciasNotificacoes.firebaseToken) {
            try {
              await enviarNotificacao(usuario.preferenciasNotificacoes.firebaseToken, 'Nova Mensagem', `Nova mensagem no pedido ${id_pedido}: ${mensagem.mensagem}`, { id_pedido: id_pedido.toString() });
            } catch (error) {
              console.error('Erro ao enviar push notification:', error);
            }
          }
        }
      } else {
        console.log(`Usuário ${id_usuario} optou por não receber notificações de 'nova_mensagem'.`);
      }
    }));
  } catch (erro) {
    console.error('Erro ao notificar participantes:', erro);
  }
}

module.exports = { verificarPermissoes, notificarParticipantes };