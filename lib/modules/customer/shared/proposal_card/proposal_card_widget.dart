import 'dart:io';

import 'package:flutter/material.dart';
import 'package:marcenaria/core/utils/coin_util.dart';

import '../../../../core/themes/color_theme.dart';
import '../../../../core/themes/family_theme.dart';
import '../../../admin/domain/entities/proposal_entity.dart';

class ProporsalCardWidget extends StatelessWidget {
  final ProposalEntity order;
  final File? proposal;

  final String title = "Valores da proposta:";

  const ProporsalCardWidget({super.key, required this.order, this.proposal});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: ColorTheme.gray,
                  blurRadius: 2.0,
                  offset: const Offset(0.0, 5.0))
            ],
            color: ColorTheme.lightGray,
            borderRadius: const BorderRadius.all(Radius.circular(10.0))),
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title,
              style: TextStyle(
                  color: ColorTheme.black3,
                  fontFamily: FamilyTheme.light,
                  fontSize: 10)),
          Row(
            spacing: 5.0,
            children: [
              Text(
                  "R\$${CoinUtil.formatValues(double.parse(order.valorTotal))}",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontFamily: FamilyTheme.bold,
                      color: Colors.black,
                      fontSize: 30)),
            ],
          ),
          if (order.valorPix.isNotEmpty)
            Text(
                "Entrada + Parcelado: 1x ${"R\$ ${CoinUtil.formatValues(double.parse(order.entradaMinima))}"} + ${order.parcelas}x ${"R\$ ${CoinUtil.formatValues(double.parse(order.valorParc ?? "0"))}"}",
                style: TextStyle(
                    fontFamily: FamilyTheme.regular,
                    color: Colors.black,
                    fontSize: 10)),
          const SizedBox(height: 10.0),
        ]));
  }
}
