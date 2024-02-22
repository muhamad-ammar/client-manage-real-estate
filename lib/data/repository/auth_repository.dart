import 'package:dio/dio.dart';
import '../../constants/cache_helper.dart';
import '../../constants/preferences.dart';
import '../model/auth.dart';
import '../network/api_provider.dart';
import '../network/dio_exception.dart';


abstract class AuthRepository {
  Future authUser(String? login, String? password);


  bool isSignedIn();
  void logout();
  String? getToken();
  void saveToken(String? token);
}

class AuthRepositoryImpl extends AuthRepository {
  final ApiProvider provider;

  AuthRepositoryImpl(this.provider);

  @override
  Future<AuthResponse> authUser(String? login, String? password ) async {
    try {
      final response = await provider.authUser(login, password);
      saveToken(response.token.toString());
      return response;
    } on DioError catch (e) {
      final errorMessage = DioException.fromDioError(e);
      throw errorMessage;
    }
  }


  @override
  bool isSignedIn() {
    return getToken()?.isNotEmpty == true;
  }

  @override
  void logout() {
    CacheHelper.removeCacheData(key: Preferences.apiToken);

  }

  @override
  String? getToken() {
    // print(CacheHelper.getCacheData(key: Preferences.apiToken) as String?);
    return CacheHelper.getCacheData(key: Preferences.apiToken) as String?;
  }

  @override
  void saveToken(String? token) {
    CacheHelper.saveCacheData(key: Preferences.apiToken, value: token);
  }
}
