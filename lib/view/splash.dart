import 'dart:io';

import 'package:property_help/Utils/appTheme.dart';
import 'package:property_help/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';

import '../Utils/app_styles.dart';
import '../Utils/uiUtils.dart';
import '../components/helper_methods.dart';
import '../constants/cache_helper.dart';
import '../constants/preferences.dart';
import '../constants/routesNames.dart';
import '../utils/navigation_utils.dart';
import 'auth/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isRootedDevice = true;
  bool isJailBroken = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (Platform.isAndroid) {
        _checkRoot();
      } else if (Platform.isIOS) {
        _checkJailBreak();
      } else {
        _init();
      }
    });
  }

  _checkRoot() async {
    isRootedDevice = await Utils.checkRoot();
    if (!isRootedDevice) {
      _init();
    } else {
      Utils.flushBarErrorMessage(
          "You can not run app on rooted device", context);
    }
  }

  _checkJailBreak() async {
    isJailBroken = await FlutterJailbreakDetection.jailbroken;
    if (!isJailBroken) {
      _init();
    } else {
      Utils.flushBarErrorMessage(
          "You can not run app on JailBreak device", context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UiUtils.getPrimaryAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildContent(),
          Insets.gapH20,
          Insets.gapH20,
          Insets.gapH20,
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      height: UiUtils.getScreenHeight(context) * 0.8,
      padding: const EdgeInsets.only(
        left: 32,
        right: 32,
        top: 70,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Property Help - CMS",
                    style: Textify.heading1,
                  ),
                  Insets.gapH10,
                  SizedBox(
                      width: UiUtils.getScreenWidth(context) * 0.8,
                      child: Text(
                          "Streamline your client world. Organize leads, projects,"
                              " invoices, & communication in one powerful platform. Cloud-based. Easy. Secure. ", style: Textify.hint.copyWith(color: AppTheme.secondaryTextColor, fontSize: 14),))
                ],
              )
            ],
          ),
          Insets.gapH10,
          Expanded(
              child: Container(
            child: Image.asset(AppAssets.splash),
          ))
        ],
      ),
    );
  }

  Future<void> _init() async {
    await Future.delayed(Duration(seconds: 3));
    if(CacheHelper.getCacheData(key: Preferences.apiToken) != null ) {
      // Duration(seconds: 5);
    NavigationUtils.replace(context, RoutesName.home);
    }
    else{
      _initNavigation();
      // NavigationUtils.replace(context, RoutesName.signIn);
    }
  }

  Future<void> _initNavigation() async {
    if (!mounted) {
      return;
    }
    _navigateNext();
  }

  void _navigateNext() {
    // Duration(seconds: 5);
    NavigationUtils.replace(context, RoutesName.mainScreen);
  }
}
