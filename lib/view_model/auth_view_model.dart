
import '../data/repository/auth_repository.dart';
import '../data/response/api_response.dart';
import '../di/service_locator.dart';
import 'base_view_model.dart';


class AuthViewModel extends BaseViewModel {
  final _authRepository = getIt.get<AuthRepositoryImpl>();

  // Login
  Future<ApiResponse> loginApi(String? login, String? password) async {
    setLoading(true);
    try {
      final response = await _authRepository.authUser(
        login,
        password
      );
      setLoading(false);
      return ApiResponse.completed(true);
    } catch (e) {
      setLoading(false);
      return ApiResponse.error(e.toString());
    }
  }

  bool isSignedIn() {
    return _authRepository.isSignedIn();
  }

  void logout() {
    _authRepository.logout();
  }

  String? getToken() {
    return _authRepository.getToken();
  }

  void saveToken(String? token) {
    return _authRepository.saveToken(token);
  }
}
