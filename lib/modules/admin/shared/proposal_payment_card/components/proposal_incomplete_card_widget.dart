import 'package:flutter/material.dart';

import '../../../../../core/themes/color_theme.dart';
import '../../../../../core/themes/family_theme.dart';

class ProposalIncompleteCardWidget extends StatelessWidget {

  final Function() showMore;
  final String subtitle = "Pagamento realizado";

  const ProposalIncompleteCardWidget({super.key, required this.showMore});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10.0),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: ColorTheme.gray,
                  blurRadius: 4.0, offset: const Offset(0.0, 5.0))
            ],
            color: const Color(0xFFECECEC),
            borderRadius: BorderRadius.circular(10.0)),
        child: Row(
            spacing: 5.0,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(subtitle, style: TextStyle(color: ColorTheme.green,fontSize: 10, fontFamily: FamilyTheme.medium )),
              InkWell(
                onTap: showMore,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Mostrar detalhes",style: TextStyle(
                        color: ColorTheme.description,
                        fontSize: 10,
                        fontFamily:FamilyTheme.medium)),
                    Icon(Icons.keyboard_arrow_down_rounded,color: ColorTheme.description)
                  ],
                ),
              ),
            ])

    );
  }
}
