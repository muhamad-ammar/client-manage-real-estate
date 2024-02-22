import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/network/api_provider.dart';
import '../data/network/dio_client.dart';
import '../data/repository/auth_repository.dart';
// import '../data/data.dart';

final getIt = GetIt.instance;

Future<void> setupDI() async {
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerSingleton(ApiProvider(dioClient: getIt<DioClient>()));
  // getIt.registerSingleton(SplashRepositoryImpl());
  getIt.registerSingleton(AuthRepositoryImpl(getIt.get<ApiProvider>()));
  // getIt.registerSingleton(UserRepositoryImpl(getIt.get<ApiProvider>()));
  // //
  // getIt.registerSingleton(CoursesRepositoryImpl(getIt.get<ApiProvider>()));
  // getIt.registerSingleton(InstructorsRepositoryImpl(getIt.get<ApiProvider>()));
  // getIt.registerSingleton(HomeRepositoryImpl(getIt.get<ApiProvider>()));
  // getIt.registerSingleton(ReviewRepositoryImpl(getIt.get<ApiProvider>()));
  // getIt.registerSingleton(LessonRepositoryImpl(getIt.get<ApiProvider>()));
  // getIt.registerSingleton(EventsRepositoryImpl(getIt.get<ApiProvider>()));
  // getIt.registerSingleton(WebinarsRepositoryImpl(getIt.get<ApiProvider>()));
  // getIt.registerSingleton(ChatRepositoryImpl(getIt.get<ApiProvider>()));
}
