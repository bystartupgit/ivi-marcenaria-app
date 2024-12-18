import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';
import 'package:marcenaria/modules/employee/orders/presentation/components/environment_text_widget.dart';

class OrderCardWidget extends StatelessWidget {
  const OrderCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: ColorTheme.gray, blurRadius: 4.0, offset: const Offset(0.0, 5.0))],
            color: const Color(0xFFECECEC),
            borderRadius: BorderRadius.circular(10.0)),
        child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/covers/cover_1.png"),fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0))),
                    child: Image.asset("assets/covers/cover_1.png")),
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0))
                      ),
                      child: Column(
                        spacing: 10.0,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Titulo da Serviço",
                              maxLines: 2, style: TextStyle(
                                  fontFamily: FamilyTheme.medium,
                                  color: Colors.black, fontSize: 16)),
                          const SizedBox(height: 5.0),
                          const EnvironmentTextWidget(environments: []),
                          Text("Orçamento nº", style: TextStyle(
                              fontFamily: FamilyTheme.regular, color: ColorTheme.pureBlack, fontSize: 10)),
                          Text("Status do Pedido",style: TextStyle(
                              fontFamily: FamilyTheme.medium, color: ColorTheme.orange, fontSize: 10))

                        ])
                  
                  ))
            ]));
  }
}
