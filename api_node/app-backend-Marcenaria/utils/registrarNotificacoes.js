// utils/registrarNotificacoes.js

const Notificacao = require('../models/notificacao');
const PreferenciasNotificacoes = require('../models/preferenciasNotificacoes');
const Cliente = require('../models/cliente');
const Prestador = require('../models/prestador');
const Administrador = require('../models/administrador');
const Usuario = require('../models/usuario');
const enviarNotificacao = require('./enviarNotificacao'); 

// Função para selecionar administradores ativos
async function obterAdministradoresParaNotificacao() {
  try {
    const administradores = await Administrador.findAll({
      where: {
        status: true
      },
      attributes: ['id_administrador']
    });
    return administradores.map(admin => admin.id_administrador);
  } catch (error) {
    console.error('Erro ao obter administradores para notificação:', error);
    throw new Error('Erro ao obter administradores para notificação');
  }
}

// Função para gerar mensagens de notificação
function gerarMensagem(tipo, dados) {
  switch (tipo) {
    case 'novo_pedido':
      return `Um novo pedido foi aberto pelo cliente ${dados.id_cliente}.`;
    case 'nova_proposta':
      return `Uma nova proposta foi criada para o pedido ${dados.id_pedido}.`;
    case 'aprovacao_proposta':
      return `A proposta para o pedido ${dados.id_pedido} foi aprovada.`;
    case 'reprovacao_proposta':
      return `A proposta para o pedido ${dados.id_pedido} foi recusada.`;
    case 'interesse_prestador':
      return `Você precisa manifestar interesse pois foi selecionado como prestador potencial para a proposta ${dados.id_proposta}.`;
    case 'selecao_prestadores':
      return `Você foi selecionado para executar a proposta ${dados.id_proposta}.`;
    case 'interesse':
      return `O prestador ${dados.id_prestador} manifestou interesse na proposta ${dados.id_proposta}.`;
    case 'inicio_execucao':
      return `A execução da proposta ${dados.id_proposta} foi iniciada.`;
    case 'conclusao_execucao':
      return `A execução da proposta ${dados.id_proposta} foi concluída.`;
    case 'nova_mensagem':
      return `Você recebeu uma nova mensagem no chat do pedido ${dados.id_pedido}.`;
    default:
      return '';
  }
}

async function obterUsuarios(idsEntidades, tipoEntidade) {
  let usuarios = [];
  if (tipoEntidade === 'cliente') {
    usuarios = await Cliente.findAll({
      where: { id_cliente: idsEntidades },
      attributes: ['id_usuario']
    });
  } else if (tipoEntidade === 'prestador') {
    usuarios = await Prestador.findAll({
      where: { id_prestador: idsEntidades },
      attributes: ['id_usuario']
    });
  } else if (tipoEntidade === 'administrador') {
    usuarios = await Administrador.findAll({
      where: { id_administrador: idsEntidades },
      attributes: ['id_usuario']
    });
  }
  return usuarios.map(u => u.id_usuario);
}

async function usuarioExiste(idUsuario) {
  const usuario = await Usuario.findOne({ where: { id_usuario: idUsuario } });
  return !!usuario;
}

async function registrarNotificacoes(entidades, tipoEntidade, tipoNotificacao, dados) {
  try {
    // Obter IDs dos administradores apenas quando necessário
    const idsAdministradores = await obterAdministradoresParaNotificacao();
    const idAdministrador = await obterUsuarios(idsAdministradores, 'administrador');
    const enviarPush = true;
    // Combinar destinatários
    let destinatarios = [...idAdministrador];
    const usuarios = await obterUsuarios(entidades, tipoEntidade);
    destinatarios = destinatarios.concat(usuarios);
    destinatarios = [...new Set(destinatarios)];

    for (const idUsuario of destinatarios) {
      if (idUsuario > 0 && await usuarioExiste(idUsuario)) {
        const preferencia = await PreferenciasNotificacoes.findOne({
          where: { id_usuario: idUsuario, tipo: tipoNotificacao }
        });

        if (preferencia && preferencia.ativo) {
          const mensagem = gerarMensagem(tipoNotificacao, dados);
          await Notificacao.create({
            id_usuario: idUsuario,
            tipo: tipoNotificacao,
            mensagem: mensagem,
            id_pedido: dados.hasOwnProperty('id_pedido') ? dados.id_pedido : null,
            id_proposta: dados.hasOwnProperty('id_proposta') ? dados.id_proposta : null,
            id_prestador: dados.hasOwnProperty('id_prestador') ? dados.id_prestador : null
          });
          // Enviar notificação push se enviarPush for true
          if (enviarPush) {
            const usuario = await Usuario.findOne({ where: { id_usuario: idUsuario } });
            if (usuario && usuario.preferenciasNotificacoes && usuario.preferenciasNotificacoes.firebaseToken) {
              try {
                await enviarNotificacao(usuario.preferenciasNotificacoes.firebaseToken, 'Nova Notificação', mensagem, dados);
              } catch (error) {
                console.error('Erro ao enviar push notification:', error);
              }
            }
          }
        }
      }
    }
  } catch (error) {
    console.error('Erro ao registrar notificações:', error);
  }
}

module.exports = {
  registrarNotificacoes,
  obterAdministradoresParaNotificacao
};