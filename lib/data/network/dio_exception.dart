import 'package:dio/dio.dart';

import '../../constants/error_messages.dart';


class DioException implements Exception {
  late String errorMessage;

  DioException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        errorMessage = ErrorMessages.requestCancelled;
        break;
      case DioErrorType.connectTimeout:
        errorMessage = ErrorMessages.connectionTimeout;
        break;
      case DioErrorType.receiveTimeout:
        errorMessage = ErrorMessages.receiveTimeout;
        break;
      case DioErrorType.sendTimeout:
        errorMessage = ErrorMessages.sendTimeout;
        break;
      case DioErrorType.response:
        errorMessage = _handleStatusCode(dioError.response);
        break;
      case DioErrorType.other:
        if (dioError.message.contains('SocketException')) {
          errorMessage = ErrorMessages.noInternet;
          break;
        }
        errorMessage = ErrorMessages.unexpected;
        break;
      default:
        errorMessage = ErrorMessages.somethingWentWrong;
        break;
    }
  }

  String _handleStatusCode(response) {
    switch (response.statusCode) {
      case 400:
        return '${response.data["message"]}'; //Bad request.';
      case 401:
        return ErrorMessages.authenticationFailed;
      case 403:
        return ErrorMessages.userNotAllowedToAccessSpecificEndPoint;
      case 404:
        return ErrorMessages.notExist;
      case 405:
        return ErrorMessages.httpMethodError;
      case 415:
        return ErrorMessages.unsupportedMedia;
      case 422:
        return ErrorMessages.dataValidationFailed;
      case 429:
        return ErrorMessages.tooManyRequests;
      case 500:
        return ErrorMessages.serverError;
      default:
        return ErrorMessages.somethingWentWrong;
    }
  }

  @override
  String toString() => errorMessage;
}
