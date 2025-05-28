import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcenaria/modules/customer/home/conclusion/components/rating_widget.dart';

import '../../../../admin/shared/chat_order_button/confirmation_button_widget.dart';
import '../conclusion_store.dart';

class RatingModelWidget extends StatelessWidget {
  final ConclusionStore store;

  const RatingModelWidget({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (context) => Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                  spacing: 20.0,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    RatingWidget(
                        rating: store.ratingEmployee,
                        setRating: store.setRatingEmployee,
                        onChanged: store.setemployeeComment,
                        title: "Avalie Marcenaria Parceira",
                        hint: "Como foi sua experiencia com esta marcenaria",
                        label: "Conte mais sobre sua experiencia"),
                    RatingWidget(
                        rating: store.ratingApp,
                        setRating: store.setRatingApp,
                        onChanged: store.setappComment,
                        title: "Avalie nosso app",
                        hint: "Conte mais sobre sua experiencia ",
                        label: "Como foi sua experiencia dentro do nosso app"),
                    ConfirmationButtonWidget(
                        title: "Enviar Avaliação",
                        size: 14,
                        onPressed: () => store.rating(context: context)),
                    const SizedBox(height: 30)
                  ]),
            ));
  }
}
