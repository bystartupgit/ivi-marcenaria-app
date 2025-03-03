// routes/usuarios.js

const express = require('express');
const router = express.Router();
const Usuario = require('../models/usuario');
const PasswordRecovery = require('../models/passwordRecovery');
const Cliente = require('../models/cliente');
const Prestador = require('../models/prestador');
const Administrador = require('../models/administrador');
const PreferenciasNotificacoes = require('../models/preferenciasNotificacoes');
const authenticateToken = require('../middleware/auth');
const jwt = require('jsonwebtoken');
const nodemailer = require('nodemailer');
const bcrypt = require('bcrypt');
const crypto = require('crypto');
const { google } = require('googleapis');

const fs = require('fs');

// Carregar configurações de email
const emailConfig = JSON.parse(fs.readFileSync('emailConfig.json', 'utf8'));

// Função para criar o transporte de email
function createEmailTransport() {
  if (emailConfig.service === 'gmail' && emailConfig.authMethod === 'oauth2') {
    const oAuth2Client = new google.auth.OAuth2(
      emailConfig.clientId,
      emailConfig.clientSecret,
      emailConfig.REDIRECT_URI
    );
    oAuth2Client.setCredentials({ refresh_token: emailConfig.refreshToken });

    return nodemailer.createTransport({
      service: 'gmail',
      auth: {
        type: 'OAuth2',
        user: emailConfig.email,
        clientId: emailConfig.clientId,
        clientSecret: emailConfig.clientSecret,
        refreshToken: emailConfig.refreshToken,
        accessToken: oAuth2Client.getAccessToken(),
      },
    });
  } else {
    return nodemailer.createTransport({
      host: emailConfig.host,
      port: emailConfig.port,
      secure: emailConfig.secure,
      auth: {
        user: emailConfig.email,
        pass: emailConfig.password,
      },
    });
  }
}

// Função para enviar email de recuperação
async function sendRecoveryEmail(email, token) {
  try {
    const transport = createEmailTransport();
    const mailOptions = {
      from: `App Marcenaria <${emailConfig.email}>`,
      to: email,
      subject: 'Recuperação de senha',
      text: `Você está recebendo este email porque você (ou alguém mais) solicitou a redefinição da senha da sua conta.\n\n` +
            `Por favor, acesse o aplicativo e informe o token abaixo para completar o processo dentro de uma hora:\n\n` +
            `Token: ${token}\n\n` +
            `Se você não solicitou isso, por favor ignore este email e sua senha permanecerá inalterada.\n`,
    };

    const result = await transport.sendMail(mailOptions);
    return result;
  } catch (error) {
    console.error('Erro ao enviar email de recuperação:', error);
    throw new Error('Erro ao enviar email de recuperação');
  }
}

// routes/usuarios.js

// Rota para registrar um novo usuário (cliente, prestador ou administrador)
router.post('/registrar', async (req, res) => {
  try {
    const { nome, email, senha, tipo_usuario, cpf, telefone, imagem_perfil, funcoes } = req.body;

    // Validação básica dos dados
    if (!nome || !email || !senha || !tipo_usuario || !cpf || !telefone) {
      return res.status(400).json({ message: 'Campos obrigatórios não preenchidos' });
    }

    // Verificar se o usuário já existe
    const usuarioExistente = await Usuario.findOne({ where: { email } });
    if (usuarioExistente) {
      return res.status(409).json({ message: 'Email já está em uso' });
    }

    // Hash da senha para segurança
    const hashedPassword = await bcrypt.hash(senha, 10);

    // Criar novo usuário
    const novoUsuario = await Usuario.create({
      nome,
      email,
      senha: hashedPassword,
      tipo_usuario,
      cpf,
      telefone,
      imagem_perfil,
    });

    // Criar um registro específico com base no tipo de usuário
    let idCliente = null, idPrestador = null, idAdministrador = null;
    
    if (tipo_usuario === 'cliente') {
      const novoCliente = await Cliente.create({
        id_usuario: novoUsuario.id_usuario,
        status: true,
      });
      idCliente = novoCliente.id_cliente;
    } else if (tipo_usuario === 'prestador') {
      const novoPrestador = await Prestador.create({
        id_usuario: novoUsuario.id_usuario,
        status_contrato: 'pendente',
        status: true,
        funcoes,
      });
      idPrestador = novoPrestador.id_prestador;
    } else if (tipo_usuario === 'administrador') {
      const novoAdministrador = await Administrador.create({
        id_usuario: novoUsuario.id_usuario,
        status: true,
      });
      idAdministrador = novoAdministrador.id_administrador;
    }

    // Definir preferências de notificação com base no tipo de usuário
    let preferencias = [];
    if (tipo_usuario === 'cliente') {
      preferencias = [
        { tipoNotificacao: "inicio_execucao", ativo: true },
        { tipoNotificacao: "conclusao_execucao", ativo: true },
        { tipoNotificacao: "nova_mensagem", ativo: true },
        { tipoNotificacao: "nova_proposta", ativo: true }
      ];
    } else if (tipo_usuario === 'prestador') {
      preferencias = [
        { tipoNotificacao: "interesse_prestador", ativo: true },
        { tipoNotificacao: "nova_mensagem", ativo: true },
        { tipoNotificacao: "selecao_prestadores", ativo: true }
      ];
    } else if (tipo_usuario === 'administrador') {
      preferencias = [
        { tipoNotificacao: "novo_pedido", ativo: true },
        { tipoNotificacao: "interesse", ativo: true },
        { tipoNotificacao: "aprovacao_proposta", ativo: true },
        { tipoNotificacao: "reprovacao_proposta", ativo: true },
        { tipoNotificacao: "inicio_execucao", ativo: true },
        { tipoNotificacao: "conclusao_execucao", ativo: true },
        { tipoNotificacao: "nova_mensagem", ativo: true }
      ];
    }

    // Inserir preferências de notificação diretamente no banco de dados
    for (const pref of preferencias) {
      await PreferenciasNotificacoes.create({
        id_usuario: novoUsuario.id_usuario,
        tipo: pref.tipoNotificacao,
        ativo: pref.ativo
      });
    }

    res.status(201).json({
      message: 'Usuário registrado com sucesso',
      usuario: {
        id_usuario: novoUsuario.id_usuario,
        id_cliente: idCliente,
        id_prestador: idPrestador,
        id_administrador: idAdministrador,
        email: novoUsuario.email,
        tipo_usuario: novoUsuario.tipo_usuario,
        data_criacao: novoUsuario.data_criacao
      }
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro ao registrar usuário' });
  }
});

// Rota para autenticar um usuário
router.post('/login', async (req, res) => {
  try {
    const { email, senha } = req.body;

    // Verificação básica dos dados
    if (!email || !senha) {
      return res.status(400).json({ message: 'Email e senha são obrigatórios' });
    }

    // Procurar o usuário pelo email
    const usuario = await Usuario.findOne({ where: { email } });
    if (!usuario) {
      return res.status(401).json({ message: 'Credenciais inválidas' });
    }

    // Verificar a senha
    const senhaValida = await bcrypt.compare(senha, usuario.senha);
    if (!senhaValida) {
      return res.status(401).json({ message: 'Credenciais inválidas' });
    }

    // Buscar o token de push do usuário
    const preferenciasNotificacoes = await PreferenciasNotificacoes.findOne({
      where: {
        id_usuario: usuario.id_usuario,
        in_token: true // Garante que estamos buscando apenas tokens
      }
    });

    const firebaseToken = preferenciasNotificacoes ? preferenciasNotificacoes.firebase_token : null;

    // Gerar um token JWT
    const token = jwt.sign(
      { id_usuario: usuario.id_usuario, tipo_usuario: usuario.tipo_usuario },
      'seuSegredoJWT', // Substitua por uma chave secreta segura
      { expiresIn: '1h' }
    );

    // Enviar a resposta com o token e o token de push
    res.status(200).json({
      message: 'Login bem-sucedido',
      token: token,
      usuario: {
        id_usuario: usuario.id_usuario,
        email: usuario.email,
        tipo_usuario: usuario.tipo_usuario,
        firebaseToken: firebaseToken // Adiciona o token de push ao objeto usuario
      }
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro ao autenticar usuário' });
  }
});

// Rota para recuperação de senha
router.post('/recoverPassword', async (req, res) => {
  try {
    const { email } = req.body;

    if (!email) {
      return res.status(400).json({ message: 'Email é obrigatório' });
    }

    const usuario = await Usuario.findOne({ where: { email } });
    if (!usuario) {
      return res.status(404).json({ message: 'Usuário não encontrado' });
    }

    const token = crypto.randomBytes(3).toString('hex');
    usuario.recoveryToken = token;
    usuario.recoveryTokenExpires = Date.now() + 1800000; // 30 minutos
    await usuario.save();

    // Salvar o token na tabela de recuperação
    await PasswordRecovery.create({
      user_id: usuario.id_usuario,
      token: token,
      created_at: new Date()
    });

    await sendRecoveryEmail(usuario.email, token);
    res.status(200).json({ message: 'Email de recuperação enviado com sucesso' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro ao processar recuperação de senha' });
  }
});

// Rota para validar token de recuperação
router.post('/validateToken', async (req, res) => {
  try {
    const { token } = req.body;

    if (!token) {
      return res.status(400).json({ message: 'Token é obrigatório' });
    }

    const recovery = await PasswordRecovery.findOne({ where: { token } });

    if (!recovery) {
      return res.status(404).json({ message: 'Token inválido ou expirado' });
    }

    // Verificar se o token ainda é válido (menos de 30 minutos)
    const tokenAge = Date.now() - new Date(recovery.created_at).getTime();
    if (tokenAge > 30 * 60 * 1000) { // 30 minutos em milissegundos
      return res.status(401).json({ message: 'Token expirado' });
    }

    res.status(200).json({ message: 'Token válido' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Erro ao validar token' });
  }
});

// Endpoint para listar informações detalhadas de um usuário
router.post('/detalhes', authenticateToken, async (req, res) => {
  const { id, tipo } = req.body;

  try {
    // Buscar informações de perfil com base no tipo
    let perfil;
    if (tipo === 'cliente') {
      perfil = await Cliente.findOne({ where: { id_usuario: id } });
    } else if (tipo === 'prestador') {
      perfil = await Prestador.findOne({ where: { id_usuario: id } });
    } else if (tipo === 'administrador') {
      perfil = await Administrador.findOne({ where: { id_usuario: id } });
    } else {
      return res.status(400).json({ message: 'Tipo de perfil inválido.' });
    }

    if (!perfil) {
      return res.status(404).json({ message: 'Perfil não encontrado.' });
    }

    // Buscar o usuário pelo ID do usuário obtido do perfil, excluindo o campo "senha"
    const usuario = await Usuario.findOne({
      where: { id_usuario: perfil.id_usuario },
      attributes: { exclude: ['senha'] } // Excluir o campo "senha"
    });

    if (!usuario) {
      return res.status(404).json({ message: 'Usuário não encontrado.' });
    }

    // Preparar a resposta
    const resposta = {
      usuario: usuario,
      perfil: perfil
    };

    res.status(200).json(resposta);
  } catch (error) {
    console.error('Erro ao listar informações detalhadas do usuário:', error);
    res.status(500).json({ error: 'Erro ao listar informações detalhadas do usuário.' });
  }
});

// Endpont para realizar atualização de dados dos clientes
router.post('/update/:id', authenticateToken, async (req, res) => {
  try {
    const { id } = req.params;
    const { nome, email, telefone, imagem_perfil, funcoes } = req.body;
    
    // Verificar se o Usuario existe
    const usuario = await Usuario.findByPk(id);
    if (!usuario) {
      return res.status(404).json({ error: 'Usuário nao encontrado' });
    }
    const id_usuario = usuario.id_usuario;
    // Atualizar apenas os dados enviados no corpo da solicitação referentes ao usuário associado
    await Usuario.update({ nome, email, telefone, imagem_perfil }, { where: { id_usuario } });

    // Mensagem de sucesso para o tipo de perfil do usuário
    const tipo = usuario.tipo_usuario;
    if (tipo === 'cliente') {
      res.status(200).json({ message: 'Dados do cliente atualizados com sucesso' });
    } else if (tipo === 'prestador') {
      await Prestador.update({ funcoes }, { where: { id_usuario } });
      res.status(200).json({ message: 'Dados do prestador atualizados com sucesso' });
    } else if (tipo === 'administrador') {
      res.status(200).json({ message: 'Dados do administrador atualizados com sucesso' });
    } else {
      return res.status(400).json({ message: 'Tipo de perfil inválido.' });
    }

  } catch (erro) {
    console.error('Erro ao atualizar dados do usuário:', erro);
    res.status(500).json({ error: 'Erro ao atualizar dados do usuário' });
  }
});

module.exports = router;