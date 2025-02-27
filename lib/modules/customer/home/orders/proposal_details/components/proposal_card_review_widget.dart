
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/entities/proposal_entity.dart';
import 'package:marcenaria/modules/customer/home/orders/proposal_details/components/proporsal_complete_widget.dart';
import 'package:marcenaria/modules/customer/home/orders/proposal_details/stores/order_proposal_details_store.dart';

import 'proporsal_incomplete_widget.dart';




class ProporsalCardReviewWidget extends StatelessWidget {

  final OrderProposalDetailsStore store;
  final ProposalEntity order;

  final Function() showMore;
  final bool showMoreEnable;

  final File? proposal;

  final String title = "Detalhes do orçamento";


  const ProporsalCardReviewWidget({super.key,
    required this.store, required this.order,
    this.proposal, required this.showMoreEnable, required this.showMore});

  @override
  Widget build(BuildContext context) {
    return Column(
        spacing: 20.0,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AnimatedContainer(
              duration: const Duration(milliseconds: 300), // Duração da animação
              curve: Curves.easeInOut,
              height: showMoreEnable ? null : null,
              child: showMoreEnable ?
              ProporsalCompleteWidget(lessDetails: () => showMore(), proposal: proposal, store: store, order: order) :
              ProporsalIncompleteWidget(store: store, moreDetails: () => showMore(), proposal: proposal,order: order,)),
        ]);
  }
}
