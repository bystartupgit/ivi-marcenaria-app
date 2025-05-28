import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcenaria/modules/admin/home/presentation/components/home/home_order_widget.dart';
import 'package:marcenaria/modules/admin/home/presentation/components/home/home_proposal_widget.dart';

import '../../../../core/themes/color_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.background,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: HomeProposalWidget()),
                Expanded(child: HomeOrderWidget())
              ],
            ),
          ],
        ),
      ),
    );
  }
}
