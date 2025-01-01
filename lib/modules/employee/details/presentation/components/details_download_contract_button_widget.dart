import 'package:flutter/material.dart';

import '../../../../../core/themes/color_theme.dart';
import '../../../../../core/themes/family_theme.dart';

class DetailsDownloadContractButtonWidget extends StatelessWidget {

  final String title = "Downloads Proposta";

  const DetailsDownloadContractButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {},
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            backgroundColor: ColorTheme.orange,elevation: 3),
        child: Row(
          children: [

            Text(title,style: TextStyle(fontSize: 14,fontFamily: FamilyTheme.regular, color: Colors.white )),
          ],
        ));
  }
}
