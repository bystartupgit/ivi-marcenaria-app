import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/data/store/core_store.dart';
import 'package:marcenaria/modules/customer/home/conversations/presentation/components/conversation_empty_widget.dart';
import 'package:marcenaria/modules/customer/home/conversations/presentation/components/conversation_loading_widget.dart';
import 'package:marcenaria/modules/customer/home/conversations/presentation/components/conversation_suport_tile_widget.dart';
import 'package:marcenaria/modules/customer/home/conversations/presentation/components/conversation_tile_widget.dart';
import 'package:marcenaria/modules/customer/home/conversations/presentation/stores/conversation_store.dart';
import 'package:marcenaria/modules/login/domain/enums/user_type_enum.dart';

import '../../../../../core/data/router_global_mapper.dart';
import '../../../../../core/themes/color_theme.dart';
import 'components/conversation_filter_widget.dart';
import 'components/conversation_tile_proposal_widget.dart';

class ConversationPage extends StatefulWidget {
  const ConversationPage({super.key});

  @override
  State<ConversationPage> createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage>
    with AutomaticKeepAliveClientMixin {
  final CoreStore core = Modular.get<CoreStore>();
  final ConversationStore store = Modular.get<ConversationStore>();

  @override
  void initState() {
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
              ? ConversationLoadingWidget()
              : SingleChildScrollView(
                  child: Column(children: [
                    ConversationFilterWidget(
                        onChanged: store.setFilter,
                        name: core.profile?.name ?? "Olá, "),
                    const SizedBox(height: 20),
                    false
                        ? const ConversationEmptyWidget()
                        : Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ConversationSuportTileWidget(
                                colaborations: "Suporte e você",
                                onPressed: () => Modular.to.pushNamed(
                                    RouterGlobalMapper.chatPrivateSupport,
                                    arguments: [
                                      core.auth?.id,
                                      UserType.cliente,
                                      UserType.administrador,
                                      "Suporte"
                                    ]),
                                name: core.profile?.name ?? "",
                              ),
                              const SizedBox(height: 10),
                              ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) =>
                                      ConversationTileWidget(
                                        onPressed: () => Modular.to.pushNamed(
                                            RouterGlobalMapper.chatSupport,
                                            arguments: store
                                                .waitingOrdersFiltered[index]),
                                        name: core.profile?.name ?? "",
                                        order:
                                            store.waitingOrdersFiltered[index],
                                        colaborations: "Suporte e você",
                                      ),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(height: 10),
                                  itemCount:
                                      store.waitingOrdersFiltered.length),
                              const SizedBox(height: 10),
                              ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) =>
                                      ConversationTileProposalWidget(
                                        onPressed: () => Modular.to.pushNamed(
                                            RouterGlobalMapper.chatSupport,
                                            arguments: store
                                                .waitingOrdersFiltered[index]),
                                        name: core.profile?.name ?? "",
                                        proposal: store
                                            .waitingApprovalFiltered[index],
                                        colaborations: "Suporte e você",
                                      ),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(height: 10),
                                  itemCount:
                                      store.waitingApprovalFiltered.length),
                            ],
                          )
                  ]),
                ),
        ),
      ),
    );
  }
}
