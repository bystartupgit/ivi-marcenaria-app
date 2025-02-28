import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/data/store/core_store.dart';
import 'package:marcenaria/modules/customer/home/conversations/presentation/components/conversation_empty_widget.dart';
import 'package:marcenaria/modules/customer/home/conversations/presentation/components/conversation_loading_widget.dart';
import 'package:marcenaria/modules/customer/home/conversations/presentation/stores/conversation_store.dart';

import '../../../../../core/themes/color_theme.dart';
import 'components/conversation_filter_widget.dart';

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
      builder: (context) => Scaffold(
        backgroundColor: ColorTheme.background,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: store.loading ? ConversationLoadingWidget() : Column(
              children: [
                ConversationFilterWidget(onChanged: store.setFilter,name: core.profile?.name ?? "Olá, "),
                const SizedBox(height: 20),
                store.conversations.isEmpty ? const ConversationEmptyWidget() : Container()
              ]),
        ),
      ),
    );
  }
}