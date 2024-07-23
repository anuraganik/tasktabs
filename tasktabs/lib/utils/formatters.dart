
import 'package:intl/intl.dart';

class Formatters {
  static String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }

  static String formatCurrency(double amount) {
    final NumberFormat formatter = NumberFormat.simpleCurrency();
    return formatter.format(amount);
  }
}
