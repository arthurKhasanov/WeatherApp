import 'package:intl/intl.dart';

//Класс для получаения строки с отформатированной датой "Mon, Nov 22, 2021"
class Util {
  static String getFormattedDate(DateTime dateTime) {
    return DateFormat('EEE, MMM d, y').format(dateTime);
  }
}
