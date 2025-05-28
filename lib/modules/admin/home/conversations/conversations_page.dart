import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/admin/home/conversations/conversations_store.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/data/store/core_store.dart';
import '../../../../core/themes/color_theme.dart';
import '../../../customer/home/conversations/presentation/components/conversation_empty_widget.dart';
import '../../../customer/home/conversations/presentation/components/conversation_filter_widget.dart';
import 'components/conversation_tile_widget.dart';

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
    store.init();
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Observer(
      builder: (context) => ModalProgressHUD(
        inAsyncCall: store.loading,
        child: Scaffold(
          backgroundColor: ColorTheme.background,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: store.conversations.isEmpty
                ? const ConversationEmptyWidget()
                : SingleChildScrollView(
                    child: Column(children: [
                      ConversationFilterWidget(
                          onChanged: store.setFilter,
                          name: core.profile?.name ?? "Olá, "),
                      const SizedBox(height: 20),
                      store.conversations.isEmpty
                          ? const ConversationEmptyWidget()
                          : Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListView.separated(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) =>
                                        ConversationTileWidget(
                                            onPressed: () => Modular.to.pushNamed(
                                                "admin-suport/",
                                                arguments: store
                                                    .conversations[index]
                                                    .order),
                                            name: core.profile?.name ?? "",
                                            order: store
                                                .conversations[index].order,
                                            colaborations: store
                                                        .conversations[index]
                                                        .users
                                                        .length >
                                                    2
                                                ? "Cliente, Marcenaria e você"
                                                : "Cliente e você"),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(height: 10),
                                    itemCount: store.name.isNotEmpty
                                        ? store.conversationFiltered.length
                                        : store.conversations.length),
                                const SizedBox(height: 10),
                              ],
                            )
                    ]),
                  ),
          ),
        ),
      ),
    );
  }
}
