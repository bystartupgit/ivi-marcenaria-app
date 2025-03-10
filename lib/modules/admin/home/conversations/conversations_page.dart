import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/admin/home/conversations/conversations_store.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/entities/order_entity.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/enum/order_status_enum.dart';

import '../../../../core/data/router_global_mapper.dart';
import '../../../../core/data/store/core_store.dart';
import '../../../../core/themes/color_theme.dart';
import '../../../customer/home/conversations/presentation/components/conversation_empty_widget.dart';
import '../../../customer/home/conversations/presentation/components/conversation_filter_widget.dart';
import '../../../customer/home/conversations/presentation/components/conversation_loading_widget.dart';
import 'components/conversation_tile_widget.dart';

class ConversationPage extends StatefulWidget {
  const ConversationPage({super.key});

  @override
  State<ConversationPage> createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> with AutomaticKeepAliveClientMixin {

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
      builder: (context) =>
          Scaffold(
            backgroundColor: ColorTheme.background,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: store.loading
                  ? ConversationLoadingWidget()
                  : SingleChildScrollView(
                child: Column(
                    children: [
                      ConversationFilterWidget(onChanged: store.setFilter,
                          name: core.profile?.name ?? "Olá, "),
                      const SizedBox(height: 20),
                      false ? const ConversationEmptyWidget() :
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) =>
                                  ConversationTileWidget(
                                    onPressed: () =>
                                        Modular.to.pushNamed(
                                            RouterGlobalMapper.chatSupport,
                                            arguments: OrderEntity(id:  store.waitingOrdersFiltered[index].id,
                                                title: store.waitingOrdersFiltered[index].title,
                                                environments: store.waitingOrdersFiltered[index].environments,
                                                status: OrderStatus.values.byName(store.waitingOrdersFiltered[index].status.name))),
                                    name: core.profile?.name ?? "",
                                    order: store.waitingOrdersFiltered[index],
                                    colaborations: "Cliente e você",),
                              separatorBuilder: (context,
                                  index) => const SizedBox(height: 10),
                              itemCount: store.waitingOrdersFiltered.length),
                          const SizedBox(height: 10),
                          ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) =>
                                  ConversationTileWidget(
                                    onPressed: () =>
                                        Modular.to.pushNamed(
                                            RouterGlobalMapper.chatSupport,
                                            arguments: store
                                                .waitingOrdersFiltered[index]),
                                    name: core.profile?.name ?? "",
                                    colaborations: "Cliente e você",
                                    order: store.waitingApprovalFiltered[index]),
                              separatorBuilder: (context,
                                  index) => const SizedBox(height: 10),
                              itemCount: store.waitingApprovalFiltered.length),
                        ],
                      )
                    ]),
              ),
            ),
          ),
    );
  }
}