import 'package:intl/intl.dart';

class Utils {
  static String getFormattedTime(DateTime? dateTime) {
    if (dateTime == null) return "-";
    return DateFormat('h a').format(dateTime);
  }

  static String getFormattedDate(DateTime? dateTime) {
    if (dateTime == null) return "-";
    return DateFormat('dd/MM - EEEE').format(dateTime);
  }

  static bool isDayTime() {
    DateTime now = DateTime.now();
    return DateFormat('h a').format(now).contains("PM") ? true : false;
  }
}
