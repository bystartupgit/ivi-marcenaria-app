// routes/preferenciasNotificacoes.js
const express = require('express');
const router = express.Router();
const PreferenciasNotificacoes = require('../models/preferenciasNotificacoes');

router.post('/registrar-preferencias', async (req, res) => {
    try {
        const { id_usuario } = req.body; // Campo obrigatório
        
        // Validação do id_usuario
        if (!id_usuario) {
            return res.status(400).json({ 
                error: 'ID do usuário é obrigatório' 
            });
        }

        const preferencias = req.body.preferencias;

        // Tipos de notificação válidos baseados na função gerarMensagem
        const tiposValidos = [
            'novo_pedido', 
            'nova_proposta', 
            'interesse',
            'aprovacao_proposta',
            'reprovacao_proposta', 
            'selecao_prestadores', 
            'interesse_prestador', 
            'inicio_execucao', 
            'conclusao_execucao', 
            'nova_mensagem'
        ];

        if (!preferencias || !Array.isArray(preferencias)) {
            return res.status(400).json({ 
                error: 'Formato inválido. Envie um array de preferências.' 
            });
        }

        // Validar tipos de notificação
        const tiposInvalidos = preferencias.filter(p => 
            !tiposValidos.includes(p.tipoNotificacao)
        );

        if (tiposInvalidos.length > 0) {
            return res.status(400).json({ 
                error: 'Tipos de notificação inválidos',
                tiposInvalidos: tiposInvalidos.map(p => p.tipoNotificacao)
            });
        }

        const preferenciasProcessadas = [];

        for (const preferencia of preferencias) {
            const [preferenciaExistente, criada] = await PreferenciasNotificacoes.findOrCreate({
                where: { 
                  id_usuario: id_usuario, 
                    tipo: preferencia.tipoNotificacao 
                },
                defaults: {
                  id_usuario: id_usuario,
                    tipo: preferencia.tipoNotificacao,
                    ativo: preferencia.ativo !== undefined ? preferencia.ativo : true
                }
            });

            // Se não foi criada, significa que já existia, então atualizamos
            if (!criada) {
                preferenciaExistente.ativo = preferencia.ativo !== undefined 
                    ? preferencia.ativo 
                    : preferenciaExistente.ativo;
                
                await preferenciaExistente.save();
                preferenciasProcessadas.push(preferenciaExistente);
            } else {
                preferenciasProcessadas.push(preferenciaExistente);
            }
        }

        res.status(200).json({
            message: 'Preferências de notificação processadas com sucesso',
            preferencias: preferenciasProcessadas
        });

    } catch (error) {
        console.error('Erro ao registrar preferências:', error);
        res.status(500).json({ 
            error: 'Erro interno ao processar preferências de notificação',
            detalhes: error.message 
        });
    }
});

module.exports = router;