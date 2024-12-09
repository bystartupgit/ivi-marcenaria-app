import 'package:flutter/material.dart';
import 'package:marcenaria/modules/login/register/presentation/components/register_button_widget.dart';
import 'package:marcenaria/modules/login/register/presentation/components/register_card_operation_widget.dart';
import 'package:marcenaria/modules/login/register/presentation/components/register_card_widget.dart';
import 'package:marcenaria/modules/login/register/presentation/stores/register_store.dart';

class EmployeePage extends StatelessWidget {

  final RegisterStore store;

  const EmployeePage({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: [
            const RegisterCardWidget(),
            const SizedBox(height: 15.0),
            RegisterCardOperationWidget(store: store),
            const SizedBox(height: 40.0),
            RegisterButtonWidget(onPress: () {}),
            const SizedBox(height: 40.0),
          ]),
    );
  }
}