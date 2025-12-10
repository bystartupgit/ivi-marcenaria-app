import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';
import 'package:marcenaria/modules/admin/home/create_order_from_customer/stores/create_order_from_customer_store.dart';

class EnvironmentCardWidget extends StatefulWidget {
  final CreateOrderFromCustomerStore store;

  const EnvironmentCardWidget({super.key, required this.store});

  @override
  State<EnvironmentCardWidget> createState() => _EnvironmentCardWidgetState();
}

class _EnvironmentCardWidgetState extends State<EnvironmentCardWidget> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _addEnvironment() {
    _focusNode.unfocus();
    Future.delayed(const Duration(milliseconds: 100), () {
      final value = _controller.text.trim();
      if (value.isNotEmpty) {
        widget.store.addEnvironment(value);
        _controller.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Ambientes",
            style: TextStyle(
              fontSize: 10,
              fontFamily: FamilyTheme.regular,
              color: ColorTheme.title,
            ),
          ),
          const SizedBox(height: 10.0),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: ColorTheme.gray,
                  blurRadius: 4.0,
                  offset: const Offset(0.0, 5.0),
                )
              ],
              color: const Color(0xFFECECEC),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Quais ambientes você deseja incluir?",
                  style: TextStyle(
                    color: ColorTheme.black,
                    fontFamily: FamilyTheme.bold,
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                  ),
                ),
                Text(
                  "Adicione um ou mais ambientes para o orçamento.",
                  style: TextStyle(
                    color: ColorTheme.black,
                    fontFamily: FamilyTheme.regular,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 15.0),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        focusNode: _focusNode,
                        style: TextStyle(
                          color: ColorTheme.gray,
                          fontSize: 16,
                          fontFamily: FamilyTheme.regular,
                        ),
                        decoration: InputDecoration(
                          hintText: "Ex: Sala, Cozinha, Quarto...",
                          hintStyle: TextStyle(
                            fontFamily: FamilyTheme.regular,
                            fontSize: 16,
                            color: ColorTheme.description,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: ColorTheme.background,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15.0,
                            vertical: 10.0,
                          ),
                        ),
                        onSubmitted: (_) => _addEnvironment(),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    InkWell(
                      onTap: _addEnvironment,
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: ColorTheme.orange,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                if (widget.store.environments.isNotEmpty) ...[
                  const SizedBox(height: 15.0),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.store.environments
                        .map((env) => InkWell(
                              onTap: () => widget.store.removeEnvironment(env),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                  vertical: 8.0,
                                ),
                                decoration: BoxDecoration(
                                  color: ColorTheme.orange,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      env,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: FamilyTheme.bold,
                                        fontSize: MediaQuery.of(context)
                                                .size
                                                .width *
                                            0.035,
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ],
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ],
                const SizedBox(height: 10.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

