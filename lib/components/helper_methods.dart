import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:root/root.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Utils/appTheme.dart';
import '../constants/cache_helper.dart';
import '../constants/preferences.dart';
// import '../constants/constants.dart';
// import '../data/data.dart';
// import '../data/send_notification_api.dart';
// import '../routes/routes_name.dart';
// import 'navigation_utils.dart';

class Utils {
  String twoDigits(int n) {
    if (n >= 10) return '$n';
    return '0$n';
  }

  String formatBySeconds(Duration duration) =>
      twoDigits(duration.inSeconds.remainder(60));

  String formatByMinutes(Duration duration) {
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    return '$twoDigitMinutes:${formatBySeconds(duration)}';
  }

  String formatByHours(Duration duration) {
    return '${twoDigits(duration.inHours)}:${formatByMinutes(duration)}';
  }

  static double averageRating(List<int> rating) {
    var avgRating = 0;
    for (int i = 0; i < rating.length; i++) {
      avgRating = avgRating + rating[i];
    }
    return double.parse((avgRating / rating.length).toStringAsFixed(1));
  }
  static logout(BuildContext context) {
    CacheHelper.removeCacheData(key: Preferences.apiToken);
    // AppConstants.bottomBarIndex = 0;
    // NavigationUtils.replace(context, RoutesName.mainScreen);
  }






  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

  static searchMessage(count, section, subSection) =>
      'Showing $count results for $section in $subSection';

  static filterMessage(count, subSection) =>
      'Showing $count results in $subSection';

  static Future<bool> checkInternetConnection() async {
    return InternetConnectionChecker().hasConnection;
  }

  static Future<bool> checkRoot() async {
    return await Root.isRooted() ?? false;
  }

  static bool signInCheck() {
    String? token =
    CacheHelper.getCacheData(key: Preferences.apiToken) as String?;
    return token?.isNotEmpty == true;
  }



  static String getImageUrl(String url) {
    return url.contains('www') ? 'https://${url.substring(2)}' : url;
  }

  static void removeCurrentFocus(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static void flushBarErrorMessage(String? message, BuildContext context) {
    _flushBarMessage(message, context, Theme.of(context).colorScheme.error);
  }

  static void flushBarWarningMessage(String? message, BuildContext context) {
    _flushBarMessage(message, context, Theme.of(context).colorScheme.error);
  }

  static void flushBarSuccessMessage(String? message, BuildContext context) {
    _flushBarMessage(message, context, AppTheme.successColor);
  }

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  static snackBarWithButton(
      {required String message,
        required BuildContext context,
        required VoidCallback onPressed,
        required String buttonText}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(message),
              TextButton(
                  onPressed: onPressed,
                  child: Text(
                    buttonText,
                    style: const TextStyle(color: AppTheme.lightBlueColor),
                  ))
            ],
          )),
    );
  }

  static launchWebUrl(String url) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication
    )) {
      throw Exception('Could not launch $url');
    }
  }




  static bool isNetworkImage(String path) {
    return path.contains('http') ||
        path.contains('https') ||
        path.contains('www');
  }

  static void _flushBarMessage(
      String? message, BuildContext context, Color color) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        padding: const EdgeInsets.all(15),
        message: message,
        duration: const Duration(seconds: 3),
        borderRadius: BorderRadius.circular(8),
        flushbarPosition: FlushbarPosition.BOTTOM,
        backgroundColor: color,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
      )..show(context),
    );
  }

  static Future<bool> onBackPressed(
      BuildContext context,
      bool? isLoading, {
        Object? result,
      }) async {
    if (isLoading == true) {
      return false;
    }
    // NavigationUtils.pop(context, result: result);
    return true;
  }
}

//

extension QueryParameterAdd on Map {
  addParam(key, value) {
    if (value != null) {
      this[key] = value;
    }
  }
}

List<dynamic> record = [];
List<Map<String, int>> recordMap = [];

var dio = Dio();

///Timer
late Timer timer;

///SharedPreferences
//??late SharedPreferences? preferences;

///Platforms
// AndroidDeviceInfo? androidInfo;
// IosDeviceInfo? iosDeviceInfo;

///App Settings
String? appLogoUrl;
Directory? appDocDir;

///URL
// const BASE_URL = "https://10pearlsuniversity.org/";
// const String apiEndpoint = BASE_URL + "/wp-json/ms_lms/v2/";
