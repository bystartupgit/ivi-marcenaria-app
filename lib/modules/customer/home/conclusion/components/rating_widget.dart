import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';
import 'package:marcenaria/modules/customer/home/conclusion/components/rating_star_widget.dart';

class RatingWidget extends StatelessWidget {
  final String title;
  final String hint;
  final String label;

  final Function(double value) setRating;
  final double rating;
  final Function(String value) onChanged;

  const RatingWidget(
      {super.key,
      required this.setRating,
      required this.rating,
      required this.onChanged,
      required this.title,
      required this.hint,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(spacing: 20.0, children: [
      Text(title,
          style: TextStyle(
              color: ColorTheme.black3,
              fontFamily: FamilyTheme.regular,
              fontSize: 18)),
      StarRating(
        mainAxisAlignment: MainAxisAlignment.center,
        color: Colors.yellow,
        inactivated: const Color(0xFFD9D9D9),
        length: 5,
        rating: rating,
        between: 5,
        starSize: 30,
        onRaitingTap: setRating,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5.0,
        children: [
          Text(label,
              style: TextStyle(
                  color: ColorTheme.black3,
                  fontFamily: FamilyTheme.regular,
                  fontSize: 12)),
          Container(
              decoration: BoxDecoration(
                color: ColorTheme.background,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                TextField(
                    style: TextStyle(
                        color: ColorTheme.gray,
                        fontSize: 16,
                        fontFamily: FamilyTheme.regular),
                    onChanged: onChanged,
                    maxLines: 2,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: ColorTheme.search,
                        hintText: hint,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 5.0),
                        hintStyle: TextStyle(
                            fontFamily: FamilyTheme.regular,
                            color: ColorTheme.black,
                            fontSize: 10),
                        counter: const Text(""),
                        counterStyle: TextStyle(
                            fontFamily: FamilyTheme.regular,
                            color: ColorTheme.description,
                            fontSize: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: ColorTheme.search)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: ColorTheme.search)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: ColorTheme.search)))),
              ])),
        ],
      ),
    ]);
  }
}
