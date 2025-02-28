import 'package:flutter/material.dart';

import '../../../../core/themes/family_theme.dart';
import '../../domain/entities/message_entity.dart';

class MessageUserBalloonWidget extends StatelessWidget {

  final String title = "Suporte";
  final MessageEntity message;

  const MessageUserBalloonWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                  color: Color(0xFFECECEC),
                  borderRadius: const BorderRadius.all(Radius.circular(5.0))),
              child: Text(message.message,style: TextStyle(fontSize: 12,
                  fontFamily: FamilyTheme.regular,color: Colors.black))),
        ],
      ));
  }
}