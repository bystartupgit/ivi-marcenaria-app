import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/modules/employee/home/presentation/components/home_carrousel_widget.dart';
import 'package:marcenaria/modules/employee/home/presentation/components/home_header_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.background,
      body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: const Column(
              spacing: 20.0,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeHeaderWidget(name: "[Nome prestador]"),
                HomeCarrouselWidget()
              ],
            ),
          )),
    );
  }
}
