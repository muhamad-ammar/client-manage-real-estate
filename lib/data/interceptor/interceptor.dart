import 'dart:async';

import 'package:dio/dio.dart';

import '../../../constants/preferences.dart';
import '../../../utils/log_utils.dart';
import '../../constants/cache_helper.dart';

class AppInterceptors extends Interceptor {
  @override
  Future<dynamic> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // debugPrint('');
    // debugPrint('# REQUEST');
    // debugPrint('--> ${options.method.toUpperCase()} - ${options.uri}');
    // debugPrint('Headers: ${options.headers}');
    // debugPrint('Query Params: ${options.queryParameters}');
    // debugPrint('Body: ${options.data}');
    // debugPrint('--> END ${options.method.toUpperCase()}');

    if (options.headers.containsKey("requirestoken")) {
      //remove the auxiliary header
      options.headers.remove("requirestoken");
      var header = CacheHelper.getCacheData(key: Preferences.apiToken);
      options.headers.addAll({"token": "$header"});
    }

    final requestMap = {
      'URL': '${options.method.toUpperCase()} - ${options.uri}',
      'Headers': options.headers,
      'Query Params': options.queryParameters,
      'Body': options.data,
    };
    LogUtils.debug(requestMap);

    return handler.next(options);
  }

  @override
  void onResponse(
      Response response,
      ResponseInterceptorHandler handler,
      ) {
    // debugPrint('');
    // debugPrint('# RESPONSE');
    // debugPrint('<-- ${(response.requestOptions.uri)}');
    // debugPrint('Status Code : ${response.statusCode} ');
    // debugPrint('Headers: ${response.headers}');
    // debugPrint("Params  ${response.requestOptions.data.toString()}");
    // debugPrint('Response: ${response.data}');
    // debugPrint('<-- END HTTP');

    final responseMap = {
      'URL': response.requestOptions.uri,
      'Status': '${response.statusCode} - ${response.statusMessage}',
      'Response': response.data,
    };
    LogUtils.info(responseMap);

    return handler.next(response);
  }

  @override
  Future<void> onError(
      DioError err,
      ErrorInterceptorHandler handler,
      ) async {
    // debugPrint('');
    // debugPrint('# ERROR');
    // debugPrint('<-- ${err.response?.requestOptions.baseUrl}');
    // debugPrint('Status Code : ${err.response?.statusCode} ');
    // debugPrint('Error Message : ${err.error} ');
    // debugPrint('Error Message : ${err.message} ');
    // debugPrint('Error Response Message : ${err.response?.statusMessage} ');
    // if (err.response != null) {
    //   debugPrint("Body: ${err.response?.data["message"] ?? Strings.empty}");
    // }
    // debugPrint('Response Path : ${err.response?.requestOptions.uri}');
    // debugPrint('<-- End HTTP');

    final response = err.response;
    final errorMap = {
      'URL': response?.requestOptions.uri,
      'Status': '${response?.statusCode} - ${response?.statusMessage}',
      'Exception': err.error,
      'Error Response Body': err.response?.data["message"],
    };
    LogUtils.error(errorMap);

    if (err.response != null &&
        err.response?.statusCode != null &&
        err.response?.statusCode == 401) {
      //  (await CacheManager()).cleanCache();
      CacheHelper.removeCacheData(key: Preferences.apiToken);
      //?? navigatorKey.currentState?.pushNamed(SplashScreen.routeName);
    }
    return super.onError(err, handler);
  }
}
