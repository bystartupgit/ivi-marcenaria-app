import 'package:flutter/material.dart';

import '../../../../../core/themes/color_theme.dart';
import '../../../../../core/themes/family_theme.dart';

class OrderLoadingWidget extends StatelessWidget {

  final String title = "Carregando Orçamento...";

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            spacing: 10.0,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title,
                  overflow: TextOverflow.ellipsis, maxLines: 2,
                  style: TextStyle(
                      fontFamily: FamilyTheme.regular, color: ColorTheme.pureBlack, fontSize: 16)),
              const CircularProgressIndicator(color: Colors.orange)
            ]
        ));
  }
}
