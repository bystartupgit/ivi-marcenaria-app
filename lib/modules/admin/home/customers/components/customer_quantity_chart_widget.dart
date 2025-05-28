import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';

import '../../../domain/entities/customer_quantity_entity.dart';
import 'customer_quantity_subtitle_widget.dart';

class CustomerQuantityChartWidget extends StatelessWidget {
  final CustomerQuantityEntity quantity;

  const CustomerQuantityChartWidget({super.key, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        spacing: 20.0,
        children: [
          Expanded(
            flex: 2,
            child: Stack(alignment: Alignment.center, children: [
              PieChart(PieChartData(sections: [
                PieChartSectionData(
                  color: const Color(0xFF3B3B3B),
                  value: quantity.waitingProposal.toDouble(),
                  title: "",
                  radius: 10,
                ),
                PieChartSectionData(
                    color: ColorTheme.orange,
                    value: quantity.waitingApproval.toDouble(),
                    title: "",
                    radius: 10),
                PieChartSectionData(
                    color: const Color(0xFF47A9FF),
                    value: quantity.accepted.toDouble(),
                    title: "",
                    radius: 10),
                PieChartSectionData(
                    color: const Color(0xFF03CB3B),
                    value: quantity.finished.toDouble(),
                    title: "",
                    radius: 10)
              ], borderData: FlBorderData(show: false), sectionsSpace: 2)),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 0,
                children: [
                  Text(
                      "${quantity.waitingProposal + quantity.waitingApproval + quantity.accepted + quantity.finished}",
                      style: TextStyle(
                          fontSize: 36,
                          fontFamily: FamilyTheme.medium,
                          color: ColorTheme.black3)),
                  Text("Projetos",
                      style: TextStyle(
                          fontSize: 10,
                          fontFamily: FamilyTheme.regular,
                          color: ColorTheme.black3)),
                ],
              ),
            ]),
          ),
          Expanded(
            flex: 3,
            child: Column(
                spacing: 10.0,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomerQuantitySubtitleWidget(
                      color: const Color(0xFF3B3B3B),
                      quantity: quantity.waitingProposal,
                      subtitle: "Aguardando Orçamento"),
                  CustomerQuantitySubtitleWidget(
                      color: ColorTheme.orange,
                      quantity: quantity.waitingApproval,
                      subtitle: "Aguardando Aprovação"),
                  CustomerQuantitySubtitleWidget(
                      color: const Color(0xFF47A9FF),
                      quantity: quantity.accepted,
                      subtitle: "Em produção"),
                  CustomerQuantitySubtitleWidget(
                      color: const Color(0xFF03CB3B),
                      quantity: quantity.finished,
                      subtitle: "Concluído"),
                ]),
          )
        ],
      ),
    );
  }
}
