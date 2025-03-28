import 'package:flutter/material.dart';

import '../../../../../core/themes/family_theme.dart';

class ChatTextFieldWidget extends StatelessWidget {

  final TextEditingController controller;
  final ScrollController scroll;
  final FocusNode focus;
  final Function(String value) sendMessage;

  const ChatTextFieldWidget({super.key,
    required this.focus, required this.scroll,
    required this.controller, required this.sendMessage});

  @override
  Widget build(BuildContext context) {
    return TextField(
        onTapOutside: (value) => FocusManager.instance.primaryFocus?.unfocus(),
        textInputAction: TextInputAction.done,
        focusNode: focus,
        onSubmitted: sendMessage,
        controller: controller,
        style: TextStyle(color: Colors.black,fontFamily: FamilyTheme.regular,fontSize: 12),
        decoration: const InputDecoration(
            filled: true,
            fillColor: Color(0xFFF5F5F5),
            enabledBorder: InputBorder.none,
            border: InputBorder.none,
            focusedBorder: InputBorder.none));
  }
}