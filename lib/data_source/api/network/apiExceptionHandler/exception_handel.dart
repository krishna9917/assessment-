import 'package:assesment/utils/utilities_functions/util_functions.dart';

class AppException implements Exception {
  final message;
  final prefix;

  AppException([this.message, this.prefix]) {
    UtilFunctions.showSnackBar(message, isError: true);
  }

  String toString() {
    return "$prefix$message";
  }
}

class InternetException extends AppException {
  InternetException([String? message]) : super(message, "No Internet");
}

class RequestTimeOut extends AppException {
  RequestTimeOut([String? message]) : super(message, "Request time out");
}

class BadRequest extends AppException {
  BadRequest([String? message]) : super(message, "Bad Request");
}

class ErrorCommunicationException extends AppException {
  ErrorCommunicationException([String? message])
    : super(message, "Error while communication");
}
