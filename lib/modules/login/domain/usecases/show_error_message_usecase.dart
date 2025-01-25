

import 'package:flutter/material.dart';
import 'package:marcenaria/modules/login/presentation/components/pop_error_widget.dart';

class ShowErrorMessageUsecase {

  final BuildContext context;

  ShowErrorMessageUsecase({ required this.context });

  void call({ required String message }) async =>
      await showDialog(
          context: context,
          builder: (context) => PopUpErrorWidget(content: message));

}