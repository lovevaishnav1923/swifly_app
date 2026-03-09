import 'package:intl/intl.dart';

class CommonDateTimeFormatter {

  /// 🔹 Current date-time → "yyyy-MM-dd HH:mm:ss"
  static String now() {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
  }

  /// 🔹 Current UTC date-time → "yyyy-MM-dd HH:mm:ss"
  static String nowUtc() {
    return DateFormat('yyyy-MM-dd HH:mm:ss')
        .format(DateTime.now().toUtc());
  }

  /// 🔹 Custom DateTime → "yyyy-MM-dd HH:mm:ss"
  static String format(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
  }

  /// 🔹 Custom DateTime → custom format
  static String formatWithPattern(
      DateTime dateTime,
      String pattern,
      ) {
    return DateFormat(pattern).format(dateTime);
  }

  /// 🔹 Firebase-friendly ISO format
  static String toIso(DateTime dateTime) {
    return dateTime.toIso8601String();
  }

  /// 🔹 Epoch milliseconds (for sorting & queries)
  static int nowMillis() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  /// 🔹 Date only → "yyyy-MM-dd"
  static String formatDate(DateTime dateTime) {
    return DateFormat('dd-MM-yyyy').format(dateTime);
  }

  /// 🔹 Time only → "HH:mm:ss"
  static String currentTime() {
    return DateFormat('HH:mm:ss').format(DateTime.now());
  }

  /// 🔹 Convert string → DateTime
  static DateTime parse(String date) {
    return DateTime.parse(date);
  }

  /// 🔹 Convert string with pattern → DateTime
  static DateTime parseWithPattern(
      String date,
      String pattern,
      ) {
    return DateFormat(pattern).parse(date);
  }
}
