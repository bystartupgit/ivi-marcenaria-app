import 'package:flutter/material.dart';
import 'package:marcenaria/modules/admin/home/customers/register/components/register_card_widget.dart';
import 'package:marcenaria/modules/admin/home/customers/register/stores/customer_register_store.dart';
import 'package:marcenaria/modules/login/domain/mappers/router_mapper.dart';
import 'package:marcenaria/modules/login/register/presentation/components/register_button_widget.dart';
import 'package:marcenaria/modules/login/register/presentation/stores/register_store.dart';

class CustomerCardPage extends StatelessWidget {
  final CustomerRegisterStore store;

  const CustomerCardPage({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      RegisterCardWidget(store: store),
      const SizedBox(height: 50.0),
      RegisterButtonWidget(onPress: () => store.register(context: context))
    ]);
  }
}
