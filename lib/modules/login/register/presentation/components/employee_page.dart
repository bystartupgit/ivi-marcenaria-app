import 'package:flutter/material.dart';
import 'package:marcenaria/modules/login/register/presentation/components/register_card_operation_widget.dart';
import 'package:marcenaria/modules/login/register/presentation/components/register_card_widget.dart';

class EmployeePage extends StatelessWidget {


  const EmployeePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const RegisterCardWidget(),
          const SizedBox(height: 15.0),
          RegisterCardOperationWidget()
        ]);
  }
}