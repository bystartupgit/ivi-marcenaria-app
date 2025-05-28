import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';

class OrderUtil {
  static IconData getIconContract(String? value) => switch (value) {
        "interessado" => Icons.check_circle,
        "recusado" => Icons.cancel,
        _ => Icons.error
      };

  static Color getColorContract(String? value) => switch (value) {
        "interessado" => ColorTheme.green,
        "recusado" => Colors.red,
        _ => ColorTheme.orange
      };
}
