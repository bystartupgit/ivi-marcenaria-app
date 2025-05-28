import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/admin/domain/mappers/order_empty_mapper.dart';
import 'package:marcenaria/modules/admin/domain/mappers/router_mapper.dart';
import 'package:marcenaria/modules/admin/home/presentation/components/order_loading_widget.dart';
import 'package:marcenaria/modules/admin/home/presentation/components/proposal_filter_widget.dart';
import 'package:marcenaria/modules/admin/home/presentation/components/proposal_list_widget.dart';
import 'package:marcenaria/modules/admin/home/presentation/components/proposal_slide_widget.dart';
import 'package:marcenaria/modules/admin/home/proposal/presentation/stores/proposal_store.dart';

import '../../../../../core/themes/color_theme.dart';

class ProposalPage extends StatefulWidget {
  const ProposalPage({super.key});

  @override
  State<ProposalPage> createState() => _ProposalPageState();
}

class _ProposalPageState extends State<ProposalPage>
    with AutomaticKeepAliveClientMixin {
  final ProposalStore store = Modular.get<ProposalStore>();

  @override
  void initState() {
    store.init();
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Observer(
      builder: (context) => Scaffold(
        backgroundColor: ColorTheme.background,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: store.loading
              ? OrderLoadingWidget()
              : Column(children: [
                  ProposalFilterWidget(onChanged: store.setFilter),
                  const SizedBox(height: 20),
                  ProposalSlideWidget(store: store),
                  const SizedBox(height: 20),
                  Expanded(
                      child: PageView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: store.controller,
                          children: [
                        ProposalListWidget(
                            orders: store.waitingProposalFiltered,
                            scroll: store.scrollWaiting,
                            message: OrderEmptyMapper.waitingProposal,
                            onPressed: (value) => Modular.to
                                    .pushNamed(
                                        RouterMapper.createProposalIntern,
                                        arguments: value)
                                    .then((value) {
                                  if (value == true) {
                                    store.getAprovals();
                                  }
                                })),
                        ProposalListWidget(
                            scroll: store.scrollAppoval,
                            orders: store.waitingAprovalFiltered,
                            message: OrderEmptyMapper.waitAproval,
                            onPressed: (value) => Modular.to.pushNamed(
                                RouterMapper.paymentProposalIntern,
                                arguments: value))
                      ]))
                ]),
        ),
      ),
    );
  }
}
