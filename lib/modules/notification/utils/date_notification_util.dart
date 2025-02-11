


import 'package:intl/intl.dart';

class DateNotificationUtil {



  static String convertStringFormatfromDate(DateTime date) {

    DateTime today = DateTime.now();

    if (date.year == today.year && date.month == today.month && date.day == today.day) {
      return "Hoje"; // Retorna a data de hoje
    } else {
      return DateFormat('dd/MM/yyyy').format(date); // Retorna a data no formato dd/MM/yyyy
    }
  }

}