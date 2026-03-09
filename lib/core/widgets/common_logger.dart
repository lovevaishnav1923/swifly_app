import 'dart:developer' as developer;

class CommonLogger {

  static void info(String message) {
    developer.log(
      "ℹ️  $message",
      name: "INFO",
    );
  }

  static void success(String message) {
    developer.log(
      "✅  $message",
      name: "SUCCESS",
    );
  }

  static void warning(String message) {
    developer.log(
      "⚠️  $message",
      name: "WARNING",
    );
  }

  static void error(String message, StackTrace? stacktrace,Object? errorObject) {
    developer.log(
      stackTrace: stacktrace,
      "❌  $message",
      name: "ERROR",
      error: errorObject
    );
  }
}
