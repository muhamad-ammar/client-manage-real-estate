
import 'package:flutter/material.dart';

import 'appTheme.dart';


class UiUtils {
  const UiUtils._internal();


  static PreferredSize getPrimaryAppBar(BuildContext context, {String? title, double height = 0,}) {
    return PreferredSize(
      preferredSize: Size.fromHeight(height),
      child: AppBar(
        iconTheme: const IconThemeData(color:  AppTheme.backgroundColor),
        title: Text(title ?? '',style: const TextStyle(color:AppTheme.backgroundColor),),
        backgroundColor:AppTheme.primaryColor,
        elevation: 0,

      ),
    );
  }



  // static Widget getAppBarWithMultipleActions(String title, {
  //   List<String> imagePaths = const [],
  //   List<Color> imageColors = const [],
  //   required VoidCallback callback}) {
  //   return AppBar(
  //       elevation: 0,
  //       title: Text(title),
  //       titleSpacing: Insets.homeHzPadding,
  //       iconTheme: const IconThemeData(color: AppTheme.blackColor),
  //       // automaticallyImplyLeading: false,
  //       actions: imagePaths.mapIndexed((index, image) => Container(
  //         margin: const EdgeInsets.only(right: 16),
  //         child: InkWell(
  //           onTap: () {
  //             callback();
  //           },
  //           child: Padding(
  //             padding: const EdgeInsets.only(right: 5),
  //             child: ImageUtils.getLocalSvgImage(image, color: imageColors[index]),
  //           ),
  //         ),
  //       )).toList()
  //   );
  // }
  //
  static Widget getLoader() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  static disableKeyboard(context) => FocusScope.of(context).requestFocus(FocusNode());

  static Divider getDivider({double height = 1}) => Divider(thickness: 1, height: height);

  static Size getScreenSize(context) => MediaQuery.of(context).size;

  static double getScreenWidth(context) => MediaQuery.of(context).size.width;

  static double getScreenHeight(context) => MediaQuery.of(context).size.height;
}
