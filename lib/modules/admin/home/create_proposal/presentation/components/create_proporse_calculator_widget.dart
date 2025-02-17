import 'package:flutter/material.dart';
import 'package:marcenaria/modules/admin/home/create_proposal/presentation/components/create_proporse_cust_value_widget.dart';
import 'package:marcenaria/modules/admin/home/create_proposal/presentation/components/create_proporse_discount_widget.dart';
import 'package:marcenaria/modules/admin/home/create_proposal/presentation/components/create_proporse_environment_widget.dart';
import 'package:marcenaria/modules/admin/home/create_proposal/presentation/components/create_proporse_number_parcels_widget.dart';

import '../../../../../../core/themes/color_theme.dart';
import 'create_proporse_temporal_widget.dart';
import 'create_proposal_days_widget.dart';

class CreateProporseCalculatorWidget extends StatelessWidget {
  const CreateProporseCalculatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: ColorTheme.gray,
                  blurRadius: 4.0,
                  offset: const Offset(0.0, 5.0))
            ],
            color: const Color(0xFFECECEC),
            borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
          child: Column(
              spacing: 10.0,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CreateProporseEnvironmentWidget(onChanged: (value) {}),
                Row(
                  spacing: 10.0,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(child: CreateProporseCustValueWidget(title: "Total:", onChanged: (value) {})),
                    Expanded(
                        flex: 2,
                        child: CreateProporseCustValueWidget(title: "Entrada mínima:", onChanged: (value) {})),
                  ],
                ),

                Row(
                  spacing: 10.0,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(child: CreateProporseNumberParcelsWidget(numberParcel: (value) {}, value: (value) {}))                  ],
                ),

                Row(
                  spacing: 10.0,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                        flex: 2,
                        child: CreateProporseCustValueWidget(title: "Valor via Pix:", onChanged: (value) {})),
                    Expanded(child: CreateProporseDiscountWidget(onChanged: (value) {})),
                  ],
                ),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(child: CreateProporseTemporalWidget(group: 'Sim',onChanged: (value) {})),
                    Expanded(child: CreateProposalDaysWidget()),
                  ],
                )
              ]),
        )

    );
  }
}
