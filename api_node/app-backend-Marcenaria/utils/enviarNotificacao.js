// src/utils/enviarNotificacao.js
const messaging = require('../config/firebaseConfig');

async function enviarNotificacao(userId, title, body, data) {
  try {
    const usuario = await PreferenciasNotificacoes.findOne({ where: { id_usuario: userId } });
    if (!usuario || !usuario.firebase_token) {
      console.log('Token não encontrado para o usuário:', userId);
      return;
    }

    const message = {
      notification: {
        title: title,
        body: body
      },
      data: data,
      token: usuario.firebase_token,
    };

    const response = await messaging.send(message);
    console.log('Notificação enviada com sucesso:', response);
  } catch (error) {
    console.error('Erro ao enviar notificação:', error);
  }
}

module.exports = enviarNotificacao;