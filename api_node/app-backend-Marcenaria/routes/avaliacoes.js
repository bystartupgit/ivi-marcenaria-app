// routes/avaliacoes.js
const express = require('express');
const router = express.Router();
const Avaliacao = require('../models/avaliacao');
const Pedido = require('../models/pedido');
const Cliente = require('../models/cliente'); // Importar o modelo Cliente
const Usuario = require('../models/usuario'); // Modelo Usuario
const { Op } = require('sequelize'); // Operadores do Sequelize
const authenticateToken = require('../middleware/auth');
const Prestador = require('../models/prestador');
const sequelize = require('../config/database'); 

// Endpoint para registrar uma nova avaliação
router.post('/registrar', async (req, res) => {
    try {
        const {
            id_usuario_cliente,
            id_pedido,
            id_usuario_prestador,
            avaliacao_prestador,
            comentario_prestador,
            avaliacao_app,
            comentario_app
        } = req.body;

        // Validação dos dados de entrada
        if (!id_usuario_cliente || !id_pedido) {
            return res.status(400).json({
                message: 'id_usuario_cliente e id_pedido são obrigatórios'
            });
        }
        //validar se usuario relacionado ao cliente referenciado no campo id_usuario da tabela cliente existe
        if (id_usuario_cliente) {
            const id_usuario = id_usuario_cliente;
            const cliente = await Cliente.findOne({
                where: {
                    id_usuario: id_usuario
                }
            });
            if (!cliente) {
                return res.status(404).json({
                    message: 'Cliente nao encontrado'
                });
            }
        }
        //validar se usuario relacionado ao prestador referenciado no campo id_usuario da tabela prestador existe
        if (id_usuario_prestador) {
            const id_usuario = id_usuario_prestador;
            const prestador = await Prestador.findOne({
                where: {
                    id_usuario: id_usuario
                }
            });
            if (!prestador) {
                return res.status(404).json({
                    message: 'Prestador nao encontrado'
                });
            }
        }
        //validar se pedido referenciado no campo id_pedido da tabela pedido existe
        if (id_pedido) {
            const pedido = await Pedido.findByPk(id_pedido);
            if (!pedido) {
                return res.status(404).json({
                    message: 'Pedido nao encontrado'
                });
            }
        }
        const novaAvaliacao = await Avaliacao.create({
            id_usuario_cliente,
            id_pedido,
            id_usuario_prestador,
            avaliacao_prestador,
            comentario_prestador,
            avaliacao_app,
            comentario_app
        });

        return res.status(201).json({
            message: 'Avaliação registrada com sucesso!',
            avaliacao: novaAvaliacao
        });
    } catch (error) {
        console.error('Erro ao registrar avaliação:', error);
        return res.status(500).json({
            message: 'Erro ao registrar avaliação',
            error: error.message
        });
    }
});

// Endpoint para editar uma avaliação existente
router.post('/editar', async (req, res) => {
    try {
        const {
            id,
            id_usuario_cliente,
            id_pedido,
            id_usuario_prestador,
            avaliacao_prestador,
            comentario_prestador,
            avaliacao_app,
            comentario_app
        } = req.body;

        // Validação do ID da avaliação
        if (!id) {
            return res.status(400).json({
                message: 'O ID da avaliação é obrigatório'
            });
        }

        const avaliacao = await Avaliacao.findByPk(id);

        if (!avaliacao) {
            return res.status(404).json({
                message: 'Avaliação não encontrada'
            });
        }

        avaliacao.id_usuario_cliente = id_usuario_cliente || avaliacao.id_usuario_cliente;
        avaliacao.id_pedido = id_pedido || avaliacao.id_pedido;
        avaliacao.id_usuario_prestador = id_usuario_prestador || avaliacao.id_usuario_prestador;
        avaliacao.avaliacao_prestador = avaliacao_prestador || avaliacao.avaliacao_prestador;
        avaliacao.comentario_prestador = comentario_prestador || avaliacao.comentario_prestador;
        avaliacao.avaliacao_app = avaliacao_app || avaliacao.avaliacao_app;
        avaliacao.comentario_app = comentario_app || avaliacao.comentario_app;

        await avaliacao.save();

        return res.status(200).json({
            message: 'Avaliação atualizada com sucesso!',
            avaliacao: avaliacao
        });
    } catch (error) {
        console.error('Erro ao editar avaliação:', error);
        return res.status(500).json({
            message: 'Erro ao editar avaliação',
            error: error.message
        });
    }
});

// Endpoint para listar a média de avaliação de um prestador
router.post('/status', async (req, res) => {
    try {
        const {
            id_usuario_prestador,
            app_status
        } = req.body; // Use req.body para obter parâmetros do corpo da requisição

        // Validação inicial: Verificar se o parâmetro id_usuario_prestador foi fornecido
        if (!id_usuario_prestador || app_status === undefined) {
            return res.status(400).json({
                message: 'id_usuario_prestador e app_status são obrigatórios'
            });
        }

        let tipoStatus = ""; // Declaração da variável tipoStatus fora dos blocos if/else
        let media;

        if (app_status === 1) {
            // Calcular a média das avaliações do aplicativo
            tipoStatus = " aplicação"; // Atribuição do valor
            media = await Avaliacao.findOne({
                where: {
                    id_usuario_prestador: null
                },
                attributes: [
                    [sequelize.fn('AVG', sequelize.col('avaliacao_app')), 'media_avaliacao']
                ]
            });

            if (!media || media.dataValues.media_avaliacao === null) {
                return res.status(200).json({
                    message: 'Nenhuma avaliação do aplicativo encontrada',
                    media: 0
                });
            }

        } else {
            // Validar se id_usuario_prestador é um número
            tipoStatus = " prestador"; // Atribuição do valor
            if (isNaN(id_usuario_prestador)) {
                return res.status(400).json({
                    message: 'id_usuario_prestador deve ser um número'
                });
            }

            const prestadorId = parseInt(id_usuario_prestador, 10); // Converter para inteiro

            // Calcular a média das avaliações do prestador
            media = await Avaliacao.findOne({
                where: {
                    id_usuario_prestador: prestadorId
                },
                attributes: [
                    [sequelize.fn('AVG', sequelize.col('avaliacao_prestador')), 'media_avaliacao']
                ]
            });

            if (!media || media.dataValues.media_avaliacao === null) {
                return res.status(200).json({
                    message: 'Nenhuma avaliação do prestador encontrada',
                    media: 0
                });
            }
        }

        if (!media) {
            return res.status(404).json({
                message: 'Avaliações não encontradas'
            });
        }

        const mediaFormatada = parseFloat(media.dataValues.media_avaliacao).toFixed(2); // Formatar a média com duas casas decimais
        // Arredondar a média para o inteiro mais próximo
        const mediaAvaliacao = Math.ceil(mediaFormatada);

        return res.status(200).json({
            message: 'Média das avaliações' + tipoStatus,
            media: parseFloat(mediaAvaliacao) // Converter para número novamente para garantir o tipo correto
        });
    } catch (error) {
        console.error('Erro ao listar a média de avaliação do prestador:', error);
        return res.status(500).json({
            message: 'Erro ao listar a média de avaliação do prestador',
            error: error.message
        });
    }
});

module.exports = router; // Exportar o roteador