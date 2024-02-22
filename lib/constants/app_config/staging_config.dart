import 'base_config.dart';

class StagingConfig implements BaseConfig {
  @override
  String get apiHost => "https://staging.10pearlsuniversity.org/";

  @override
  String get baseURL => "$apiHost/wp-json/ms_lms/v2/";
}
