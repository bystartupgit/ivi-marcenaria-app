import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/entities/order_entity.dart';

import '../../../../../core/themes/color_theme.dart';
import '../../../../../core/themes/family_theme.dart';
import '../../../../employee/domain/mappers/router_mapper.dart';
import '../../../../employee/orders/presentation/components/environment_text_widget.dart';
import '../../orders/domain/enum/order_status_enum.dart';

class ProposalCardWidget extends StatelessWidget {
  final Function() navigation;
  final OrderEntity order;

  const ProposalCardWidget(
      {super.key, required this.order, required this.navigation});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: navigation,
      child: Container(
          height: MediaQuery.of(context).size.height * 0.12,
          width: MediaQuery.of(context).size.width * 0.2,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: ColorTheme.gray,
                    blurRadius: 4.0,
                    offset: const Offset(0.0, 5.0))
              ],
              color: const Color(0xFFECECEC),
              borderRadius: BorderRadius.circular(10.0)),
          child: Row(children: [
            Expanded(
                flex: 1,
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/covers/cover_1.png"),
                            fit: BoxFit.cover),
                        borderRadius:
                            BorderRadius.all(Radius.circular(10.0))))),
            Expanded(
                flex: 2,
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0))),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(order.title,
                              maxLines: 2,
                              style: TextStyle(
                                  fontFamily: FamilyTheme.medium,
                                  color: Colors.black,
                                  fontSize: 16)),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              EnvironmentTextWidget(
                                  environments: order.listEnviroment),
                              const SizedBox(height: 5.0),
                              Text("Orçamento nº ${order.id}",
                                  style: TextStyle(
                                      fontFamily: FamilyTheme.regular,
                                      color: ColorTheme.pureBlack,
                                      fontSize: 10)),
                              const SizedBox(height: 3.0),
                              Text(StatusExtension.fromTitle(order.status),
                                  style: TextStyle(
                                      fontFamily: FamilyTheme.medium,
                                      color:
                                          order.status == OrderStatus.production
                                              ? ColorTheme.lightBlue
                                              : ColorTheme.lightGreen,
                                      fontSize: 10))
                            ],
                          ),
                        ])))
          ])),
    );
  }
}
