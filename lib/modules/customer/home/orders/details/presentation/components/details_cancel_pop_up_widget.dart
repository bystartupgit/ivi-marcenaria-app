import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/modules/customer/home/orders/details/presentation/components/details_cancel_button_widget.dart';
import 'package:marcenaria/modules/customer/home/orders/details/presentation/components/details_suport_button_widget.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/entities/order_entity.dart';

import '../../../../../../../core/data/router_global_mapper.dart';
import '../../../../../../../core/themes/family_theme.dart';

class DetailsCancelPopUpWidget extends StatelessWidget {

  final OrderEntity order;

  final Function() cancelOrder;

  final String title = "Deseja cancelar projeto?";

  final String description1 = "Se você tiver dúvidas ou precisar de ajuda, entre em contato com o nosso suporte.";
  final String description2 = "Caso deseje realmente cancelar o projeto, o orçamento será excluído imediatamente.";
  final String description3 = "Por favor, confirme sua decisão";

  const DetailsCancelPopUpWidget({super.key, required this.order, required this.cancelOrder});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: ColorTheme.background,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10.0,
            children: [
              Text(title,textAlign: TextAlign.start, style: TextStyle(fontSize: 18,fontFamily:
              FamilyTheme.medium, color: ColorTheme.black3)),
              Text(description1,textAlign: TextAlign.left, style: TextStyle(fontSize: 14,fontFamily:
              FamilyTheme.regular, color: ColorTheme.black3)),
              Text(description2,textAlign: TextAlign.left, style: TextStyle(fontSize: 14,fontFamily:
              FamilyTheme.regular, color: ColorTheme.black3)),
              Text(description3,textAlign: TextAlign.left, style: TextStyle(fontSize: 14,fontFamily:
              FamilyTheme.regular, color: ColorTheme.black3)),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DetailsCancelButtonWidget(onPressed: () {
                      Navigator.pop(context);
                      cancelOrder();
                    },size: 9,iconSize: 10,),
                    DetailsSuportButtonWidget(size: 8,onPressed: () {
                        Navigator.pop(context);
                        Modular.to.pushNamed(RouterGlobalMapper.chatSupport, arguments: order);
                    })
                  ])

            ],
          ),
        ));
  }
}
