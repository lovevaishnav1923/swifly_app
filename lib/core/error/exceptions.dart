import '../constants/app_strings.dart';

/// Base class for all custom exceptions
class AppException implements Exception {
  final String message;
  final String? prefix;
  final dynamic details;

  AppException(this.message, {this.prefix, this.details});

  @override
  String toString() {
    if (prefix != null) {
      return message;
    }
    return message;
  }
}

///  Internet / No Connection Error
class NetworkException extends AppException {
  NetworkException([super.message = AppStrings.noInternetConnection])
      : super();
}

///  Server side error (500, 502 etc.)
class ServerException extends AppException {
  ServerException([super.message = AppStrings.serverError])
      : super();
}

///  Bad request, wrong parameters, invalid payload etc.
class BadRequestException extends AppException {
  BadRequestException([super.message = AppStrings.badRequest])
      : super();
}

///  Unauthorized (401) or session expired error
class UnauthorizedException extends AppException {
  UnauthorizedException([super.message = AppStrings.unauthorized])
      : super();
}

///  Resource not found (404)
class NotFoundException extends AppException {
  NotFoundException([super.message = AppStrings.resourceNotFound])
    : super();
}

///  Timeout error (connection or response delay)
class TimeoutException extends AppException {
  TimeoutException([super.message = AppStrings.connectionTimedOut])
      : super();
}

///  Unknown or unexpected error
class UnknownException extends AppException {
  UnknownException([super.message = AppStrings.unknownError])
      : super();
}
