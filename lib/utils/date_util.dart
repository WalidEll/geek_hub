import 'package:intl/intl.dart';

class DateUtil {
  static String getEarlierDate(Duration duration) {
    DateTime now = DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String date30DaysEarlier = formatter.format(now.subtract(duration));
    return date30DaysEarlier;
  }
}
