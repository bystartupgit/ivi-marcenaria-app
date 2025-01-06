import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/modules/employee/home/presentation/home_page.dart';
import 'package:marcenaria/modules/employee/navigation/components/navigation_icons.dart';
import 'package:marcenaria/modules/employee/navigation/stores/navigation_store.dart';
import 'package:marcenaria/modules/employee/orders/presentation/order_page.dart';

import 'components/navigation_button_widget.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {

  final NavigationStore store = Modular.get<NavigationStore>();


  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(backgroundColor: ColorTheme.background),
            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                      icon: NavigationButtonWidget(
                          icon: NavigationIcons.home, title: "Inicio",
                          selected: store.index == 0, onPress: () => store.setIndex(0)), label: ""),
                  BottomNavigationBarItem(
                      icon: NavigationButtonWidget(
                          icon: NavigationIcons.calculator, title: "Orçamentos",
                          selected: store.index == 1, onPress: () => store.setIndex(1)), label: ""),
                  BottomNavigationBarItem(
                      icon: NavigationButtonWidget(
                          icon: NavigationIcons.orders, title: "Em produção",
                          selected: store.index == 2, onPress: () => store.setIndex(2)), label: ""),
                  BottomNavigationBarItem(
                      icon: NavigationButtonWidget(
                          icon: NavigationIcons.messages, title: "Mensagens",
                          selected: store.index == 3, onPress: () => store.setIndex(3)), label: ""),
                ]),
            body: SizedBox(
              height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.bottom,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Expanded(
                    child: PageView(
                      controller: store.controller,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        const HomePage(),
                        Container(color: Colors.yellow),
                        const OrderPage(),
                        Container(color: Colors.blue)
                      ])),
                ],
              ))));
  }
}
