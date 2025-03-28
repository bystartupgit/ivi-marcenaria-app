import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';

import '../../../../../core/themes/family_theme.dart';
import '../../domain/entities/message_entity.dart';

class MessageSupportBalloonWidget extends StatelessWidget {

  final String title = "Suporte";
  final MessageEntity message;

  const MessageSupportBalloonWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 8, fontFamily: FamilyTheme.regular,color: Colors.black)),
          Container(
              padding: const EdgeInsets.all(8.0),
              decoration:  BoxDecoration(
                  color: ColorTheme.orange,
                  borderRadius: const BorderRadius.all(Radius.circular(5.0))),
              child: Text(message.message,style: TextStyle(fontSize: 12,
                  fontFamily: FamilyTheme.regular,color: Colors.black))),
        ],
      ),
    );
  }
}