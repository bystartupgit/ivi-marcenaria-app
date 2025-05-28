import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/modules/login/register/presentation/components/contract/presentation/store/contract_store.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../shared/components/login_title_with_description_widget.dart';
import 'components/contract_view_widget.dart';

class ContractPage extends StatefulWidget {
  const ContractPage({super.key});

  @override
  State<ContractPage> createState() => _ContractPageState();
}

class _ContractPageState extends State<ContractPage> {
  final ContractStore store = Modular.get<ContractStore>();

  final String title = "Contrato de prestação de serviços";
  final String subtitle = "Contrato Jurídico para aceitar os termos da "
      "Marcenaria para prestação de serviços.";

  @override
  void initState() {
    store.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => ModalProgressHUD(
        inAsyncCall: store.loadingDownload,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: ColorTheme.background,
          appBar: AppBar(backgroundColor: ColorTheme.background),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: store.loading
                ? Center(
                    child: CircularProgressIndicator(color: ColorTheme.orange))
                : Column(mainAxisSize: MainAxisSize.max, children: [
                    LoginTitleWithDescriptionWidget(
                        title: title, subtitle: subtitle),
                    const SizedBox(height: 20.0),
                    ContractViewWidget(
                        contract: store.contract,
                        download: store.download,
                        onPressed: store.setCheck,
                        check: store.check),
                    SizedBox(height: MediaQuery.of(context).padding.bottom),
                  ]),
          ),
        ),
      ),
    );
  }
}
