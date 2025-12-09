import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';
import 'package:marcenaria/modules/admin/home/create_order_from_customer/stores/create_order_from_customer_store.dart';

class OrderFormWidget extends StatelessWidget {
  final CreateOrderFromCustomerStore store;

  const OrderFormWidget({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Dados do Orçamento",
              style: TextStyle(
                fontSize: 20,
                fontFamily: FamilyTheme.medium,
                color: ColorTheme.black3,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              onChanged: store.setOrderTitle,
              decoration: InputDecoration(
                labelText: "Título do Orçamento *",
                hintText: "Ex: Móveis para sala",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              onChanged: store.setOrderDescription,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: "Descrição *",
                hintText: "Descreva o orçamento...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "Ambientes",
              style: TextStyle(
                fontSize: 14,
                fontFamily: FamilyTheme.medium,
                color: ColorTheme.black3,
              ),
            ),
            const SizedBox(height: 10),
            _EnvironmentInput(store: store),
            const SizedBox(height: 10),
            if (store.environments.isNotEmpty)
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: store.environments
                    .map((env) => Chip(
                          label: Text(env),
                          onDeleted: () => store.removeEnvironment(env),
                          deleteIcon: const Icon(Icons.close, size: 18),
                        ))
                    .toList(),
              ),
            const SizedBox(height: 15),
            CheckboxListTile(
              title: Text(
                "Contato via WhatsApp",
                style: TextStyle(
                  fontFamily: FamilyTheme.regular,
                ),
              ),
              value: store.whatsapp,
              onChanged: store.setWhatsapp,
              activeColor: ColorTheme.orange,
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: store.loading ||
                        store.orderTitle.isEmpty ||
                        store.orderDescription.isEmpty
                    ? null
                    : () => store.createOrder(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorTheme.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: store.loading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : Text(
                        "Criar Orçamento e Continuar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: FamilyTheme.medium,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EnvironmentInput extends StatefulWidget {
  final CreateOrderFromCustomerStore store;

  const _EnvironmentInput({required this.store});

  @override
  State<_EnvironmentInput> createState() => _EnvironmentInputState();
}

class _EnvironmentInputState extends State<_EnvironmentInput> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Adiciona listener para debug
    _controller.addListener(() {
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _addEnvironment() {
    // Força o foco a sair primeiro para garantir que o valor seja salvo
    _focusNode.unfocus();
    
    // Usa um pequeno delay para garantir que o valor foi atualizado
    Future.delayed(const Duration(milliseconds: 100), () {
      // Captura o valor ANTES de qualquer outra operação
      final value = _controller.text.trim();
     
      
      if (value.isNotEmpty) {
        widget.store.addEnvironment(value);
        // Limpa o campo apenas após adicionar com sucesso
        _controller.clear();
      } else {
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            focusNode: _focusNode,
            decoration: InputDecoration(
              hintText: "Ex: Sala, Cozinha, Quarto...",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
            onSubmitted: (_) => _addEnvironment(),
            onChanged: (value) {
            },
          ),
        ),
        const SizedBox(width: 10),
        IconButton(
          icon: Icon(Icons.add_circle, color: ColorTheme.orange),
          onPressed: _addEnvironment,
        ),
      ],
    );
  }
}

