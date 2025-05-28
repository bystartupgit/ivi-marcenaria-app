import 'package:intl/intl.dart';

class CoinUtil {
  static String formatValues(double value) =>
      NumberFormat.currency(locale: "pt_BR", symbol: "", decimalDigits: 2)
          .format(value)
          .trim();
}
