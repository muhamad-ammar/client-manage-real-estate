import 'package:flutter/material.dart';

import 'log_utils.dart';

class NavigationUtils {
  const NavigationUtils._internal();

  static Future<Object?> push(
    BuildContext context,
    String routeName, {
    Object? args,
    bool? awaitsResult,
  }) async {
    try {
      if (awaitsResult ?? false) {
        final result = await Navigator.of(context).pushNamed(
          routeName,
          arguments: args,
        );
        return result;
      } else {
        Navigator.of(context).pushNamed(routeName, arguments: args);
        return true;
      }
    } on Exception catch (e) {
      LogUtils.error(e);
      return false;
    }
  }

  static bool pop(BuildContext context, {Object? result}) {
    try {
      final navigator = Navigator.of(context);
      if (navigator.canPop()) {
        navigator.pop(result);
      }
      return true;
    } on Exception catch (e) {
      LogUtils.error(e);
      return false;
    }
  }

  static Future<Object?> replace(
    BuildContext context,
    String routeName, {
    Object? args,
    bool? awaitsResult,
  }) async {
    try {
      if (awaitsResult ?? false) {
        final result = await Navigator.of(context).pushReplacementNamed(
          routeName,
          arguments: args,
        );
        return result;
      } else {
        Navigator.of(context).pushReplacementNamed(routeName, arguments: args);
        return true;
      }
    } on Exception catch (e) {
      LogUtils.error(e);
      return false;
    }
  }

  // static bool clearStack(
  //   BuildContext context, {
  //   String newRouteName = RoutesName.mainScreen,
  // }) {
  //   try {
  //     Navigator.of(context).pushNamedAndRemoveUntil(
  //       newRouteName,
  //       (route) => false,
  //     );
  //     return true;
  //   } on Exception catch (e) {
  //     LogUtils.error(e);
  //     return false;
  //   }
  // }
}
