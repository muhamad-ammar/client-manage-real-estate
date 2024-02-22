import 'base_config.dart';

class ProdConfig implements BaseConfig {
  @override
  String get apiHost => "https://crash-course.cyclic.app/";

  @override
  String get baseURL => apiHost;
}
