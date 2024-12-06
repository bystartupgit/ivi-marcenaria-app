// routes/pedidos.js

const express = require('express');
const router = express.Router();
const Pedido = require('../models/pedido'); // Importando o modelo Pedido

// Endpoint para criar um novo pedido
router.post('/pedidos', async (req, res) => {
    try {
        // Extraindo dados do corpo da requisição
        const { id_cliente, descricao, status } = req.body;

        // Criação do novo pedido
        const novoPedido = await Pedido.create({
            id_cliente,
            descricao,
            status,
            data_pedido: new Date(), // Define a data atual para data_pedido
        });

        // Resposta com o pedido criado
        res.status(201).json({
            message: 'Pedido criado com sucesso!',
            pedido: novoPedido
        });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Erro ao criar pedido.' });
    }
});

module.exports = router;