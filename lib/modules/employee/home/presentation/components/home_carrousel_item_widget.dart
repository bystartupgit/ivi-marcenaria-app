import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';

class HomeCarrouselItemWidget extends StatelessWidget {

  final String image;
  final String title = "Conquiste novos clientes e expanda suas oportunidades.";
  final String description = "Junte-se à nossa plataforma, conecte-se com clientes que valorizam qualidade e ganhe visibilidade para impulsionar seu negócio.";

  const HomeCarrouselItemWidget({super.key, required this.image });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                  decoration: BoxDecoration(
                      color: ColorTheme.lightGray,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0))),
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: Column(
                      spacing: 5.0,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,style: TextStyle(fontFamily: FamilyTheme.medium, color: Colors.black, fontSize: 14)),
                        Text(description,style: TextStyle(fontFamily: FamilyTheme.regular, color: Colors.black, fontSize: 9)),
                      ])),
            ),
            Expanded(
              flex: 2,
              child: Container(
                  height: 140,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(bottomRight: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                      image: DecorationImage(image: AssetImage(image),fit: BoxFit.cover)))),

          ]),
    );
  }
}
