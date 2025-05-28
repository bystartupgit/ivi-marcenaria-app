import 'package:flutter/material.dart';
import 'package:marcenaria/modules/admin/domain/entities/order_entity.dart';
import 'package:marcenaria/modules/admin/domain/enum/order_status_enum.dart';
import 'package:marcenaria/modules/admin/home/create_proposal/presentation/components/details_download_button_widget.dart';
import 'package:marcenaria/modules/admin/home/create_proposal/presentation/components/order_details_rich_widget.dart';

import '../../../../../core/themes/color_theme.dart';
import '../../../../../core/themes/family_theme.dart';

class DetailsCompleteWidget extends StatelessWidget {
  final OrderEntity order;
  final Function() lessDetails;

  final String? status;
  final Color? statusColor;

  const DetailsCompleteWidget(
      {super.key,
      required this.order,
      this.status,
      this.statusColor,
      required this.lessDetails});

  @override
  Widget build(BuildContext context) {
    return Column(
        spacing: 5.0,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(order.title,
              style: TextStyle(
                  fontFamily: FamilyTheme.mediumItalic,
                  color: Colors.black,
                  fontSize: 20)),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            OrderDetailsRichWidget(
                title: "Orçamento nº", description: order.id.toString()),
            Text(status ?? StatusExtension.fromTitle(order.status),
                style: TextStyle(
                    color: statusColor ?? ColorTheme.orange,
                    fontSize: 10,
                    fontFamily: FamilyTheme.medium))
          ]),
          OrderDetailsRichWidget(
              title: "Ambientes:", description: order.environments),
          OrderDetailsRichWidget(title: "Anexos:", description: ""),
          const SizedBox(height: 2.0),
          DetailsDownloadButtonWidget(download: () {}),
          const SizedBox(height: 2.0),
          OrderDetailsRichWidget(
              title: "Observações:", description: order.description ?? ""),
          const SizedBox(height: 15.0),
          Center(
            child: InkWell(
              onTap: lessDetails,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Ocultar detalhes",
                      style: TextStyle(
                          color: ColorTheme.description,
                          fontSize: 10,
                          fontFamily: FamilyTheme.medium)),
                  Icon(Icons.keyboard_arrow_up_rounded,
                      color: ColorTheme.description)
                ],
              ),
            ),
          )
        ]);
  }
}
