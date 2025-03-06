import 'package:flutter/material.dart';
import 'package:marcenaria/modules/login/presentation/components/pop_success_widget.dart';

class ShowSuccessMessageUsecase {

  final BuildContext context;

  ShowSuccessMessageUsecase ({ required this.context });

  Future<void> call({ required String message }) async =>
      await showDialog(
          context: context,
          builder: (context) => PopUpSuccessWidget(content: message));

}