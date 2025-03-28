import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../domain/entities/message_entity.dart';
import 'message_suport_ballon_widget.dart';
import 'message_user_balloon_widget.dart';

class ChatGroupSpaceWidget extends StatelessWidget {

  final List<MessageEntity> messages;
  final ScrollController scroll;
  final int userID;

  const ChatGroupSpaceWidget({ super.key, required this.messages,
    required this.userID, required this.scroll });

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (context) {

          WidgetsBinding.instance.addPostFrameCallback((_) => scroll.animateTo(
            scroll.position.maxScrollExtent, duration: const Duration(milliseconds: 2),
            curve: Curves.easeOut,
          ));

          return Expanded(
            child: ListView.separated(
                controller: scroll,
                separatorBuilder: (context, index) => const SizedBox(height: 10.0),
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
                itemCount: messages.length,
                itemBuilder: (context,index) {

                  if(messages[index].senderID == userID) { return MessageUserBalloonWidget(message: messages[index]); }

                  else { return MessageSupportBalloonWidget(message: messages[index]); }

                }),
          );
        }
    );
  }
}