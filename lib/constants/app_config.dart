import 'app_config/base_config.dart';
import 'app_config/prod_config.dart';
import 'app_config/staging_config.dart';

class Environment {
  static final Environment _singleton = Environment._internal();
  static const String staging = 'STAGING';
  static const String prod = 'PROD';

  BaseConfig? config;

  factory Environment() {
    return _singleton;
  }

  Environment._internal();

  initConfig(String environment) {
    config = _getConfig(environment);
  }

  BaseConfig _getConfig(String environment) {
    switch (environment) {
      case Environment.prod:
        return ProdConfig();
      case Environment.staging:
        return StagingConfig();
      default:
        return StagingConfig(); // we can have development;
    }
  }
}
