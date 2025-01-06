import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';

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
      body: const SingleChildScrollView(
          child: Column(
            children: [

            ],
          )),
    );
  }
}
