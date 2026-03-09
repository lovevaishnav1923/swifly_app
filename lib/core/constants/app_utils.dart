import 'package:intl/intl.dart';

class AppUtils {
  AppUtils._();

  static String formatPrice(double price, {String symbol = "\$"}) {
    final formatted = NumberFormat.currency(symbol: symbol, decimalDigits: 2)
        .format(price);
    return formatted;
  }

  static String formatDate(String dateStr, {String pattern = 'dd MMM yyyy'}) {
    try {
      final date = DateTime.parse(dateStr);
      return DateFormat(pattern).format(date);
    } catch (e) {
      return dateStr;
    }
  }

  /// Check if a string is null or empty
  static bool isNullOrEmpty(String? value) {
    return value == null || value.trim().isEmpty;
  }
}
