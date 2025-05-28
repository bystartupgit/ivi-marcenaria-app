import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcenaria/modules/admin/home/create_proposal/presentation/components/create_proporse_cust_value_widget.dart';
import 'package:marcenaria/modules/admin/home/create_proposal/presentation/components/create_proporse_discount_widget.dart';
import 'package:marcenaria/modules/admin/home/create_proposal/presentation/components/create_proporse_environment_widget.dart';
import 'package:marcenaria/modules/admin/home/create_proposal/presentation/components/create_proporse_number_parcels_widget.dart';
import 'package:marcenaria/modules/admin/home/create_proposal/presentation/stores/create_proposal_store.dart';

import '../../../../../../core/themes/color_theme.dart';
import '../proporsal/proporsal_upload_button_widget.dart';
import 'create_proporse_from_to_widget.dart';
import 'create_proporse_temporal_widget.dart';
import 'create_proposal_days_widget.dart';

class CreateProporseCalculatorWidget extends StatelessWidget {
  final CreateProposalStore store;

  const CreateProporseCalculatorWidget({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: ColorTheme.gray,
                    blurRadius: 4.0,
                    offset: const Offset(0.0, 5.0))
              ],
              color: const Color(0xFFECECEC),
              borderRadius: BorderRadius.circular(10.0)),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
                spacing: 10.0,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CreateProporseEnvironmentWidget(
                      onChanged: store.setEnvironments),
                  Row(
                    spacing: 10.0,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                          child: CreateProporseCustValueWidget(
                              title: "Total:", onChanged: store.setTotal)),
                      Expanded(
                          child: CreateProporseCustValueWidget(
                              title: "Entrada mínima:",
                              onChanged: store.setOpening)),
                    ],
                  ),
                  Row(
                    spacing: 10.0,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                          child: CreateProporseNumberParcelsWidget(
                              numberParcel: store.setNumberParcels,
                              value: store.setValueParcel)),
                      Expanded(
                          child: CreateProporseFromToWidget(
                              onChanged: store.setForToValue,
                              check: store.setForTo,
                              isCheck: store.forTo))
                    ],
                  ),
                  Row(
                    spacing: 10.0,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                          flex: 2,
                          child: CreateProporseCustValueWidget(
                              title: "Valor via Pix:",
                              onChanged: store.setValuePix)),
                      Expanded(
                          child: CreateProporseDiscountWidget(
                              onChanged: store.setDiscount)),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                          child: CreateProporseTemporalWidget(
                              group: store.temporal,
                              onChanged: store.setTemporal)),
                      if (store.temporal == "Sim")
                        Expanded(
                            child: CreateProposalDaysWidget(
                                onChanged: store.setDateLimit,
                                value: store.dateLimit)),
                    ],
                  ),
                  Align(
                      alignment: AlignmentDirectional.topStart,
                      child: SizedBox(
                          width: 200,
                          child: ProporsalUploadButtonWidget(
                              onPressed: () => store.getFile())))
                ]),
          )),
    );
  }
}
