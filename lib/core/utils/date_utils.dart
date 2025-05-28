import 'package:intl/intl.dart';

class DateUtil {
  static DateTime convertStringToDatatime(String value) =>
      DateTime.parse(value);

  static String convertDateTimeToStringBrazilFormt(DateTime date) {
    var formatter = DateFormat("d 'de' MMMM", 'pt_BR');
    return formatter.format(date);
  }
}
