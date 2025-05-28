import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/data/store/core_store.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/modules/admin/domain/entities/employee_user_entity.dart';
import 'package:marcenaria/modules/chat_support/presentation/components/chat_group_space_widget.dart';
import 'package:marcenaria/modules/chat_support/presentation/components/chat_icons.dart';
import 'package:marcenaria/modules/chat_support/presentation/components/chat_textfield_widget.dart';
import 'package:marcenaria/modules/chat_support/presentation/components/chat_tile_widget.dart';
import 'package:marcenaria/modules/chat_support/presentation/stores/chat_store.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/entities/order_entity.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../login/domain/enums/user_type_enum.dart';

class ChatPage extends StatefulWidget {
  final OrderEntity order;

  const ChatPage({super.key, required this.order});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late final OrderEntity order = widget.order;
  final CoreStore core = Modular.get<CoreStore>();
  final ChatStore store = Modular.get<ChatStore>();

  @override
  void initState() {
    store.init(orderID: order.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return ModalProgressHUD(
        inAsyncCall: store.loading,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: ColorTheme.background,
          appBar: AppBar(
              backgroundColor: ColorTheme.background,
              leading: IconButton(
                  onPressed: () => Modular.to.pop(),
                  icon: Icon(Icons.arrow_back_ios_new_rounded,
                      color: ColorTheme.black2))),
          body: Column(children: [
            ChatTileWidget(order: order, name: core.profile?.name ?? ""),
            const SizedBox(height: 10.0),
            ChatGroupSpaceWidget(
                scroll: store.scroll,
                messages: store.messages,
                userID: store.userID),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ChatTextFieldWidget(
                        scroll: store.scroll,
                        focus: store.focus,
                        controller: store.controller,
                        sendMessage: (String value) {
                          FocusScope.of(context).requestFocus(store.focus);

                          store.sendMessage(value, order.id);

                          setState(() {});
                        },
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    IconButton(
                        onPressed: () =>
                            store.sendMessage(store.controller.text, order.id),
                        icon: const Icon(ChatIcons.send, color: Colors.orange)),
                    const SizedBox(
                      width: 5.0,
                    )
                  ],
                )),
            SizedBox(height: MediaQuery.of(context).padding.bottom + 5.0)
          ]),
        ),
      );
    });
  }
}
