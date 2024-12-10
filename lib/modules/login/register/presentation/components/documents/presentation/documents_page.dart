import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/modules/login/shared/components/login_title_widget.dart';
import 'package:marcenaria/modules/login/shared/components/login_title_with_description_widget.dart';

class DocumentsPage extends StatefulWidget {
  const DocumentsPage({super.key});

  @override
  State<DocumentsPage> createState() => _DocumentsPageState();
}

class _DocumentsPageState extends State<DocumentsPage> {

  final String title = "Envio de documentos";
  final String subtitle = "Precisamos validar alguns dados antes de liberar "
      "seu cadastro como prestador na nossa plataforma.";

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
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoginTitleWithDescriptionWidget(title: title, subtitle: subtitle)
              ]),
        ),
      ),
    );
  }
}
