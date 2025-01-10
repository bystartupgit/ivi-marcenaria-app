import 'package:flutter/material.dart';

import '../../../../../core/themes/family_theme.dart';
import 'home_card_widget.dart';

class HomeListCardWidget extends StatelessWidget {

  final String title;
  final String button = "Ver todos";

  const HomeListCardWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,style: TextStyle(fontSize: 14,fontFamily: FamilyTheme.regular,color: Colors.black)),
            TextButton(onPressed: () {}, child: Text(button,style: TextStyle(fontSize: 14,fontFamily: FamilyTheme.regular,color: Colors.black))),
          ]),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 20.0,
              children: [
                HomeCardWidget(),
                HomeCardWidget(),
              ],

            ),
        )
      ]);
  }
}
