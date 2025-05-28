import 'package:marcenaria/modules/customer/home/orders/domain/entities/proposal_entity.dart';
import 'package:flutter/material.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/enum/order_status_enum.dart';
import 'package:marcenaria/modules/employee/orders/presentation/components/environment_text_widget.dart';

import '../../../../../core/themes/color_theme.dart';
import '../../../../../core/themes/family_theme.dart';

class OrderProposalCardWidget extends StatelessWidget {
  final ProposalEntity order;
  final Function(ProposalEntity value) details;

  const OrderProposalCardWidget(
      {super.key, required this.order, required this.details});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => details(order),
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
                        vertical: 2.0, horizontal: 10),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0))),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(order.pedido.titulo,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  fontFamily: FamilyTheme.medium,
                                  color: Colors.black,
                                  fontSize: 16)),
                          const SizedBox(height: 3.0),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Proposta nº ${order.idProposta}",
                                  style: TextStyle(
                                      fontFamily: FamilyTheme.regular,
                                      color: ColorTheme.pureBlack,
                                      fontSize: 10)),
                              const SizedBox(height: 3.0),
                              Text(StatusExtension.fromTitle(order.status),
                                  style: TextStyle(
                                      fontFamily: FamilyTheme.medium,
                                      color: ColorTheme.orange,
                                      fontSize: 10))
                            ],
                          ),
                        ])))
          ])),
    );
  }
}
