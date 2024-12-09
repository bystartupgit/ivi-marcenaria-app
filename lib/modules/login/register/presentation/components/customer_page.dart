import 'package:flutter/material.dart';
import 'package:marcenaria/modules/login/register/presentation/components/register_button_widget.dart';
import 'package:marcenaria/modules/login/register/presentation/components/register_card_widget.dart';

class CustomerPage extends StatelessWidget {
  const CustomerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const RegisterCardWidget(),
          const SizedBox(height: 50.0),
          RegisterButtonWidget(onPress: () {})
        ]);
  }
}
