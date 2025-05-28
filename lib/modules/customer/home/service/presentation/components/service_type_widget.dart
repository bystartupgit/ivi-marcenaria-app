import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcenaria/modules/customer/home/service/presentation/components/service_type_slider_widget.dart';
import 'package:marcenaria/modules/customer/home/service/presentation/stores/service_store.dart';

import '../../../../../../core/themes/color_theme.dart';
import '../../../../../../core/themes/family_theme.dart';

class ServiceTypeWidget extends StatelessWidget {
  final String title = "Mostre-nos sua ideia ou referência para o projeto?";
  final String description =
      "Anexe imagens ou PDF do projeto fornecendo o máximo de informações para que elaboremos o seu orçamento.";

  final String title2 = "Sua ideia ou referencia é?";
  final String description2 =
      "Esta informação nos ajuda entender as imagens anexadas.";

  final String image = "assets/home/service/icons.png";

  final ServiceStore store;

  const ServiceTypeWidget({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: ColorTheme.lightGray,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title,
              style: TextStyle(
                  fontSize: 18,
                  color: ColorTheme.title,
                  fontFamily: FamilyTheme.bold)),
          const SizedBox(height: 2.0),
          Text(description,
              style: TextStyle(
                  fontSize: 12,
                  color: ColorTheme.title,
                  fontFamily: FamilyTheme.regular)),
          const SizedBox(height: 15.0),
          Center(
              child: InkWell(
                  onTap: () => store.addServiceFile(context: context),
                  child: Image.asset(image,
                      width: MediaQuery.of(context).size.width * 0.4))),
          if (store.serviceFile != null)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    "Anexado: ${store.serviceFile?.path.split("/").last}",
                    style: TextStyle(
                        fontSize: 14,
                        color: ColorTheme.title,
                        fontFamily: FamilyTheme.regular)),
              ),
            ),
          const SizedBox(height: 15.0),
          Text(title2,
              style: TextStyle(
                  fontSize: 18,
                  color: ColorTheme.title,
                  fontFamily: FamilyTheme.bold)),
          const SizedBox(height: 2.0),
          Text(description2,
              style: TextStyle(
                  fontSize: 12,
                  color: ColorTheme.title,
                  fontFamily: FamilyTheme.regular)),
          const SizedBox(height: 5.0),
          ServiceTypeSliderWidget(store: store)
        ]),
      ),
    );
  }
}
