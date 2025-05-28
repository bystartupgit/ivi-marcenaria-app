import 'package:flutter/material.dart';
import 'package:marcenaria/core/utils/coin_util.dart';
import 'package:marcenaria/modules/admin/domain/entities/proposal_entity.dart';
import 'package:marcenaria/modules/admin/shared/proposal_payment_card/components/proposal_incomplete_card_widget.dart';

import '../../../../core/themes/color_theme.dart';
import '../../../../core/themes/family_theme.dart';
import '../../../../core/utils/date_utils.dart';

class ProposalPaymentCardWidget extends StatefulWidget {
  final ProposalEntity proposal;

  const ProposalPaymentCardWidget({super.key, required this.proposal});

  @override
  State<ProposalPaymentCardWidget> createState() =>
      _ProposalPaymentCardWidgetState();
}

class _ProposalPaymentCardWidgetState extends State<ProposalPaymentCardWidget> {
  late final ProposalEntity proposal = widget.proposal;
  bool moreDetails = true;

  final String subtitle = "Pagamento realizado";

  changeMoreDetails() {
    setState(() {
      moreDetails = !moreDetails;
    });
  }

  @override
  Widget build(BuildContext context) {
    return moreDetails
        ? ProposalIncompleteCardWidget(showMore: () => changeMoreDetails())
        : Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: ColorTheme.gray,
                      blurRadius: 4.0,
                      offset: const Offset(0.0, 5.0))
                ],
                color: const Color(0xFFECECEC),
                borderRadius: BorderRadius.circular(10.0)),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 5.0,
                children: [
                  Text(
                      "Entrada + Parcelado: ${"R\$ ${CoinUtil.formatValues(double.parse(proposal.entradaMinima))}"} + ${proposal.parcelas}x ${"R\$ ${CoinUtil.formatValues(double.parse(proposal.valorParc ?? "0"))}"}",
                      style: TextStyle(
                          color: ColorTheme.black3,
                          fontSize: 10,
                          fontFamily: FamilyTheme.regular)),
                  Text(
                      DateUtil.convertDateTimeToStringBrazilFormt(
                          proposal.dataCriacao),
                      style: TextStyle(
                          color: ColorTheme.black3,
                          fontSize: 10,
                          fontFamily: FamilyTheme.regular)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(subtitle,
                          style: TextStyle(
                              color: ColorTheme.green,
                              fontSize: 10,
                              fontFamily: FamilyTheme.medium)),
                      InkWell(
                        onTap: () => changeMoreDetails(),
                        child: Row(
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
                    ],
                  )
                ]));
  }
}
