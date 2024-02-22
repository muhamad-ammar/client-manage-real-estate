import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_styles.dart';

@immutable
class AppTheme {
  const AppTheme._privateConstructor();
  static const Color primaryColor = Color(0xFF0045a6);
  static const Color secondaryColor = Color(0xFFc5d6f4);
  static const Color accentColor = Color(0xFF0936c3);
  static const Color darkBlueColor = Color(0xFF022150);
  static const Color secondaryBlueColor = Color(0xFF156cf7);
  static const Color linkColor = Color(0xFF0092ff);
  static const Color lightBlueColor = Color(0xff70b3f4);
  static const Color messageColor = Color(0xb8d7e5fb);
  static const Color disabledColor = Color(0xFFadadad);
  static const Color successColor = Color(0xFF049f55);
  static const Color lightSuccessColor = Color(0xffc2ffe2);
  static const Color errorColor = Color(0xFFe63950);
  static const Color lightErrorColor = Color(0xfffce9eb);
  static const Color headingColor = Color(0xFF15224f);
  static const Color descriptionColor = Color(0xFF969aa8);
  static const Color primaryTextColor = Color(0xFF151624);
  static const Color secondaryTextColor = Color(0xFF636363);
  static const Color sectionHeadingColor = Color(0xFF1E1E1E);
  static const Color grayColor = Color(0xFFadadad);
  static const Color lightGrayColor = Color(0xFFececec);
  static const Color darkGrayColor = Color(0xFF6f6f6f);
  static const Color yellowColor = Color(0xFFf9bc60);
  static const Color purpleColor = Color(0xFF8758ff);
  static const Color ratingBarActiveColor = Color(0xFFfaae4b);
  static const Color ratingBarInactiveColor = Color(0xFFdddbd8);
  static const Color shadowColor = Color(0x1e000000);
  static const Color dividerColor = Color(0xFFf4f4f4);
  static const Color backgroundColor = Colors.white;
  static const Color blackColor = Colors.black;

  static final ThemeData appTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      centerTitle: false,
      backgroundColor: backgroundColor,
      titleTextStyle: Textify.heading1.copyWith(color: primaryColor),
    ),
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      height: 54,
      shape: RoundedRectangleBorder(borderRadius: Corners.rounded15),
      buttonColor: primaryColor,
    ),
    iconTheme: const IconThemeData(color: primaryColor),
    snackBarTheme: const SnackBarThemeData(behavior: SnackBarBehavior.floating),
    disabledColor: disabledColor,
    scaffoldBackgroundColor: backgroundColor, colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      error: errorColor,
    ).copyWith(background: backgroundColor),
  );
}
