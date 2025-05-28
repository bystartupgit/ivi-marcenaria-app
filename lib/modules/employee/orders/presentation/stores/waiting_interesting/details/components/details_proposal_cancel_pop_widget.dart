import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../../../core/data/router_global_mapper.dart';
import '../../../../../../../../core/themes/color_theme.dart';
import '../../../../../../../../core/themes/family_theme.dart';
import '../../../../../../../admin/shared/chat_order_button/cancel_button_widget.dart';
import '../../../../../../../admin/shared/chat_order_button/chat_order_button_widget.dart';
import '../../../../../../../customer/home/orders/domain/entities/order_entity.dart';

class DetailsProposalCancelPopWidget extends StatelessWidget {
  final OrderEntity order;

  final Function() cancelOrder;

  final String title = "Deseja recusar proposta??";

  final String description1 =
      "Se você tiver dúvidas ou precisar de ajuda, entre em contato com o nosso suporte. ";
  final String description2 =
      "Caso deseje realmente recusar o proposta, ela será redirecionada a outro prestador.";
  final String description3 = "Por favor, confirme sua decisão";

  const DetailsProposalCancelPopWidget(
      {super.key, required this.order, required this.cancelOrder});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.0,
        children: [
          Text(title,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: FamilyTheme.medium,
                  color: ColorTheme.black3)),
          Text(description1,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: FamilyTheme.regular,
                  color: ColorTheme.black3)),
          Text(description2,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: FamilyTheme.regular,
                  color: ColorTheme.black3)),
          Text(description3,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: FamilyTheme.regular,
                  color: ColorTheme.black3)),
          const SizedBox(height: 10),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: CancelButtonWidget(
                      title: "Recusar Proposta",
                      onPressed: () {
                        Navigator.pop(context);
                        cancelOrder();
                      },
                      size: 12),
                ),
                Expanded(
                    flex: 3,
                    child: ChatOrderButtonWidget(
                        title: "Conversar com suporte",
                        size: 12,
                        onPressed: () {
                          Navigator.pop(context);
                          Modular.to.pushNamed(RouterGlobalMapper.chatSupport,
                              arguments: order);
                        }))
              ]),
          const SizedBox(height: 40)
        ],
      ),
    );
  }
}
