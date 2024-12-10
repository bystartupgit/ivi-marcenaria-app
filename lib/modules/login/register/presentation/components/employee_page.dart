import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/login/domain/mappers/router_mapper.dart';
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
            RegisterButtonWidget(onPress: () => Modular.to.pushNamed(RouterMapper.documentIntern)),
            const SizedBox(height: 40.0),
          ]),
    );
  }
}