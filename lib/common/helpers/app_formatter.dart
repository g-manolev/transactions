import 'package:intl/intl.dart';

abstract class AppFormatter {
  static final DateFormat _dateFormat = DateFormat("HH:mm:ss, dd MMMM yyyy");
  static final NumberFormat _currencyFormat = NumberFormat('\$#,##0', 'en_US');

  static String dateFormat(DateTime date) {
    return _dateFormat.format(date);
  }

  static String currencyFormat(dynamic num) {
    return _currencyFormat.format(num);
  }
}