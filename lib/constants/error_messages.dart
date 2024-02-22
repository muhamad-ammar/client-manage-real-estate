import 'package:flutter/foundation.dart';

@immutable
class ErrorMessages {
  const ErrorMessages._privateConstructor();
// dio Errors
  static const requestCancelled = 'Request to the server was cancelled.';
  static const unexpected = 'Unexpected error occurred.';
  static const connectionTimeout = 'Connection timed out.';
  static const receiveTimeout = 'Receiving timeout occurred.';
  static const sendTimeout = 'Request send timeout.';

  // response errors
  static const authenticationFailed = 'Authentication Failed';
  static const unauthorized = 'You are not authorized';
  static const noInternet = 'Please check your internet connection';
  static const networkGeneral = 'Something went wrong. Please try again later.';
  static const notExist = 'The requested resource does not exist.';
  static const tooManyRequests = 'Too many requests.';
  static const serverError = 'Internal server error.';
  static const somethingWentWrong = 'Oops something went wrong!';
  static const dataValidationFailed = 'Data validation failed.';
  static const unsupportedMedia =
      'Unsupported media type. The requested content type or version number is invalid.';
  static const httpMethodError =
      'Method not allowed. Please check the Allow header for the allowed HTTP methods.';
  static const userNotAllowedToAccessSpecificEndPoint =
      'The authenticated user is not allowed to access the specified API endpoint.';

  static String required(String label) {
    return '$label is required.';
  }

  static String email() {
    return 'Please enter a valid email address.';
  }

  static String password() {
    return 'Password should be of at least 8 characters with at least 1 digit, 1 uppercase letter & 1 lowercase letter.';
  }

  static String confirmPassword() {
    return 'Password does not match.';
  }
}
