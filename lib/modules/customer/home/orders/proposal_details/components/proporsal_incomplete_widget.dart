import 'dart:io';

import 'package:flutter/material.dart';
import 'package:marcenaria/modules/admin/home/create_proposal/presentation/proporsal/proporsal_download_button_widget.dart';

import '../../../../../../core/themes/color_theme.dart';
import '../../../../../../core/themes/family_theme.dart';
import '../../domain/entities/proposal_entity.dart';
import '../stores/order_proposal_details_store.dart';

class ProporsalIncompleteWidget extends StatelessWidget {
  final Function() moreDetails;

  final OrderProposalDetailsStore store;

  final ProposalEntity order;
  final File? proposal;

  final String title = "Detalhes do orçamento";

  const ProporsalIncompleteWidget({
    super.key,
    required this.store,
    required this.moreDetails,
    required this.proposal,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
          decoration: BoxDecoration(
              color: ColorTheme.lightGray,
              borderRadius: const BorderRadius.all(Radius.circular(10.0))),
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title,
                style: TextStyle(
                    color: ColorTheme.black3,
                    fontFamily: FamilyTheme.light,
                    fontSize: 15)),
            const SizedBox(height: 10.0),
            if (proposal != null)
              ProporsalDownloadButtonWidget(
                  onPressed: () {}, title: "Download do Orçamento"),
            Row(
              spacing: 5.0,
              children: [
                Text("R\$${store.formatValues(double.parse(order.valorTotal))}",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: FamilyTheme.bold,
                        color: Colors.black,
                        fontSize: 30)),
                if (order.dePor != null)
                  Text(
                      "R\$${store.formatValues(double.parse(order.valorTotal))}",
                      style: TextStyle(
                          fontFamily: FamilyTheme.regular,
                          color: Colors.black,
                          fontSize: 10,
                          decoration: TextDecoration.lineThrough)),
              ],
            ),
            Row(
              spacing: 10.0,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    "${double.parse(order.valorDesconto).toStringAsFixed(0)}% de desconto",
                    style: TextStyle(
                        fontFamily: FamilyTheme.bold,
                        color: Colors.black,
                        fontSize: 16)),
                Text("A vista - PIX",
                    style: TextStyle(
                        fontFamily: FamilyTheme.regular,
                        color: Colors.black,
                        fontSize: 10)),
              ],
            ),
            if (order.escassezTemporal == true)
              Text("Preço por tempo Limitado!",
                  style: TextStyle(
                      fontFamily: FamilyTheme.medium,
                      color: Colors.red,
                      fontSize: 12)),
            Center(
              child: InkWell(
                onTap: moreDetails,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Mais Details",
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
          ])),
    );
  }
}
