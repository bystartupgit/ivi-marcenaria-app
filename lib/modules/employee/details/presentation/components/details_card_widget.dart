import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';
import 'package:marcenaria/modules/employee/details/presentation/components/details_rich_widget.dart';

class DetailsCardWidget extends StatefulWidget {
  const DetailsCardWidget({super.key});

  @override
  State<DetailsCardWidget> createState() => _DetailsCardWidgetState();
}

class _DetailsCardWidgetState extends State<DetailsCardWidget> {
  final String title = "Orçamento Nº";
  final String environment = "Ambientes:";
  final String image = "assets/covers/cover_3.png";

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title,
          style: TextStyle(
            fontFamily: FamilyTheme.medium,
            color: ColorTheme.black3,
            fontSize: 20,
          )),
      Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: ColorTheme.gray,
                    blurRadius: 4.0,
                    offset: const Offset(0.0, 5.0))
              ],
              color: const Color(0xFFECECEC),
              borderRadius: BorderRadius.circular(10.0)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0)),
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.cover))),
            Container(
                decoration: BoxDecoration(
                    color: ColorTheme.lightGray,
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0))),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Column(
                    spacing: 5.0,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Titulo do Serviço",
                          style: TextStyle(
                              fontFamily: FamilyTheme.mediumItalic,
                              color: Colors.black,
                              fontSize: 20)),
                      DetailsRichWidget(
                          title: title, description: "Numero do Serviço"),
                      DetailsRichWidget(
                          title: environment,
                          description: "Ambientes do Serviço"),
                    ]))
          ]))
    ]);
  }
}
