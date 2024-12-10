import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcenaria/core/themes/color_theme.dart';

import '../../../../../shared/components/login_title_with_description_widget.dart';
import 'components/contract_view_widget.dart';

class ContractPage extends StatefulWidget {
  const ContractPage({super.key});

  @override
  State<ContractPage> createState() => _ContractPageState();
}

class _ContractPageState extends State<ContractPage> {

  final String title = "Contrato de prestação de serviços";
  final String subtitle = "Contrato Jurídico para aceitar os termos da "
      "Marcenaria para prestação de serviços.";

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: ColorTheme.background,
        appBar: AppBar(backgroundColor: ColorTheme.background),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                LoginTitleWithDescriptionWidget(title: title, subtitle: subtitle),
                const SizedBox(height: 20.0),
                const ContractViewWidget(),
                SizedBox(height: MediaQuery.of(context).padding.bottom),
              ]),
        ),
      ),
    );
  }
}
