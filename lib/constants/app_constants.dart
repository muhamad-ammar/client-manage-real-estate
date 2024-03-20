import 'package:flutter/foundation.dart';

@immutable
class AppConstants {
  const AppConstants._privateConstructor();

  static int bottomBarIndex = 0;



  static const String regexPassword =
      "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=\\S+\$).{8,}\$";


  // Dropd

}

@immutable
class Endpoints
{
  const Endpoints._privateConstructor();
  static const String auth = "user/";
  static const String login = "{$auth}login/";
  static const String register = "{$auth}register/";
}
