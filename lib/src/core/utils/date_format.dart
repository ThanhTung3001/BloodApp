import 'package:intl/intl.dart';

class DateFormatExtenstion {
  static String format(dateString) {
    // var inputFormat = DateFormat('dd/MM/yyyyTHH:mm');
    // String dateString = '2023-04-22T00:00:00';
    DateTime dateTime = DateTime.parse(dateString);
    String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
    return (formattedDate); // prints '4/22/2023'
  }
}
