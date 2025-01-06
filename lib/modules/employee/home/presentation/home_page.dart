import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/modules/employee/home/presentation/components/home_carrousel_widget.dart';
import 'package:marcenaria/modules/employee/home/presentation/components/home_header_widget.dart';
import 'package:marcenaria/modules/employee/home/presentation/stores/home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final HomeStore store = Modular.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        backgroundColor: ColorTheme.background,
        body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                spacing: 20.0,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeHeaderWidget(name: "[Nome prestador]"),
                  HomeCarrouselWidget(onChanged: store.setIndex, index: store.index)
                ],
              ),
            )),
      ),
    );
  }
}
