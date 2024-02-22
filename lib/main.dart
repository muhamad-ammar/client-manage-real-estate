import 'dart:async';
import 'package:clock/clock.dart';
import 'package:property_help/utils/log_utils.dart';
import 'package:property_help/view_model/auth_view_model.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'Utils/appTheme.dart';
import 'constants/app_config.dart';
import 'constants/cache_helper.dart';
import 'constants/routes.dart';
import 'constants/routesNames.dart';
import 'di/service_locator.dart';



void main() async {


    WidgetsFlutterBinding.ensureInitialized();


    debugInstrumentationEnabled = false;
    await _initialize();

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppTheme.primaryColor));
    runApp(const MyApp());


}

Future<void> _initialize() async {
  // FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  environmentSetup();
  setupDI();
  LogUtils.init();
  await CacheHelper.init();

  debugPrint = _prettifyDebugPrint;

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),

      ],
      child: Builder(builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Crash Course",
          theme: AppTheme.appTheme,
          initialRoute: RoutesName.index,
          onGenerateRoute: Routes.generateRoute,
        );
      }),
    );
  }
}

// For setting up environment variables
void environmentSetup() {
  const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: // by default the app runs in staging environment
    Environment.prod, // by default the app runs in staging environment
  );
  Environment().initConfig(environment);
}

// For prettifying console debug messages
void _prettifyDebugPrint(String? message, {int? wrapWidth}) {
  final date = clock.now();
  var msg = '${date.year}/${date.month}/${date.day}';
  msg += ' ${date.hour}:${date.minute}:${date.second}';
  msg += ' $message';
  debugPrintSynchronously(msg, wrapWidth: wrapWidth);
}
