import 'base_config.dart';

class ProdConfig implements BaseConfig {
  @override
  String get apiHost => "https://property-help.vercel.app/";

  @override
  String get baseURL => apiHost;
}
