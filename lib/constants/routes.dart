import 'package:property_help/constants/routesNames.dart';
import 'package:property_help/view/contact.dart';

import 'package:property_help/view/splash.dart';
import 'package:flutter/material.dart';
import '../view/home.dart';
import '../view/login.dart';
import '../view/testContent.dart';




class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.testContent:
        return _getRoute(TestContent());
      case RoutesName.index:
        return _getRoute( SplashScreen());
      case RoutesName.signIn:
        return _getRoute(SignInScreen());
        case RoutesName.contactUs:
        return _getRoute(ContactUs());


    // case RoutesName.courseDetail:
    //   return _getRoute(CourseDetailsScreen(id: 0));
    // case RoutesName.events:
    //   return _getRoute(const EventsListScreen());
    //   case RoutesName.notifications:
    //     return _getRoute(const NotificationsListScreen());
      case RoutesName.home:
        return _getRoute(const Home(title: "Crash Course"));
      default:
        return _getRoute( SignInScreen());
    }
  }

  static MaterialPageRoute _getRoute(
      Widget page, {
        RouteSettings? settings,
      }) {
    return MaterialPageRoute(
      builder: (ctx) => page,
      settings: settings,
    );
  }
}
