import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';
import 'package:marcenaria/modules/login/register/presentation/components/customer_page.dart';
import 'package:marcenaria/modules/login/register/presentation/components/employee_page.dart';
import 'package:marcenaria/modules/login/register/presentation/stores/register_store.dart';
import 'package:marcenaria/modules/login/shared/components/login_title_widget.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final RegisterStore store = Modular.get<RegisterStore>();
  final String title = "Criar conta";

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: ColorTheme.background,
        appBar: AppBar(backgroundColor: ColorTheme.background),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: LoginTitleWidget(title: title)),
                const SizedBox(height: 20.0),
                SizedBox(
                  height: 22,
                  child: CustomSlidingSegmentedControl<int>(customSegmentSettings: CustomSegmentSettings(),
                    fixedWidth: MediaQuery.of(context).size.width * 0.3,
                    thumbDecoration: BoxDecoration(
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(.3), blurRadius: 4.0, offset: const Offset(0.0, 4.0))],
                        borderRadius: BorderRadius.circular(30.0),color: const Color(0xFFFFFFFF)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),color: const Color(0xFFBEBEBE)),
                    onValueChanged: store.setIndex,
                    children: {
                      1 : Text("Cliente",style: TextStyle(color: store.index ==  1 ? ColorTheme.orange : Colors.white,
                          fontSize: 12, fontFamily: store.index ==  1 ? FamilyTheme.bold : FamilyTheme.regular)),
                      2 : Text("Prestador", style: TextStyle(
                          color: store.index ==  2 ? ColorTheme.orange : Colors.white,fontSize: 12,
                          fontFamily: store.index ==  2 ? FamilyTheme.bold : FamilyTheme.regular)) },
                  ),
                ),
                const SizedBox(height: 20.0),
                Expanded(
                  child: PageView(
                      controller: store.controller,
                      children: [
                        CustomerPage(),
                        EmployeePage(store: store)
                      ]
                  ),
                )


              ]),
        ),
      ),
    );
  }
}
