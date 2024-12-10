import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/modules/login/register/presentation/components/register_button_widget.dart';
import 'package:marcenaria/modules/login/shared/components/login_title_widget.dart';
import 'package:marcenaria/modules/login/shared/components/login_title_with_description_widget.dart';

import '../../../../../domain/mappers/router_mapper.dart';
import 'components/document_card_widget.dart';

class DocumentsPage extends StatefulWidget {
  const DocumentsPage({super.key});

  @override
  State<DocumentsPage> createState() => _DocumentsPageState();
}

class _DocumentsPageState extends State<DocumentsPage> {

  final String title = "Envio de documentos";
  final String subtitle = "Precisamos validar alguns dados antes de liberar "
      "seu cadastro como prestador na nossa plataforma.";

  final String titleDocument = "Caso possua carteira de trabalho";
  final String subtitleDocument = "Faça o anexo da sua carteira neste campo.";

  final String titleOffice = "Mostre sua Oficina para os clientes";
  final String subtitleOffice = "Faça o anexo de imagens da sua oficina abaixo. ";

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
                DocumentCardWidget(
                    onPressed: () {},
                    image: "assets/login/svgs/documents.svg",
                    title: titleDocument, subtitle: subtitleDocument),
                const SizedBox(height: 20.0),
                DocumentCardWidget(
                    onPressed: () {},
                    image: "assets/login/svgs/imagens.svg",
                    title: titleOffice, subtitle: subtitleOffice),
                const Expanded(child: SizedBox()),
                RegisterButtonWidget(onPress: () => Modular.to.pushNamed(RouterMapper.contract)),
                SizedBox(height: MediaQuery.of(context).padding.bottom + 40.0)
              ]),
        ),
      ),
    );
  }
}
