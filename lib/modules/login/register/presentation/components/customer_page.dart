import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/login/domain/mappers/router_mapper.dart';
import 'package:marcenaria/modules/login/register/presentation/components/register_button_widget.dart';
import 'package:marcenaria/modules/login/register/presentation/components/register_card_widget.dart';
import 'package:marcenaria/modules/login/register/presentation/stores/register_store.dart';

class CustomerPage extends StatelessWidget {
  final RegisterStore store;

  const CustomerPage({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      RegisterCardWidget(store: store),
      const SizedBox(height: 50.0),
      RegisterButtonWidget(onPress: () => store.register(context: context))
    ]);
  }
}
