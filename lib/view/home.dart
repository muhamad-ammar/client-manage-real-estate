import 'package:property_help/constants/routesNames.dart';
import 'package:property_help/utils/navigation_utils.dart';
import 'package:property_help/view/CourseTest.dart';
import 'package:flutter/material.dart';

import '../Utils/appTheme.dart';
import '../Utils/app_styles.dart';
import 'Course.dart';
import 'CourseTest2.dart';

class Home extends StatefulWidget {
  final String title;

  const Home({super.key, required this.title});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(0, 80),
          child: AppBar(
            centerTitle: true,
            title: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  widget.title,
                  style: const TextStyle(color: AppTheme.backgroundColor),
                )),
            backgroundColor: AppTheme.primaryColor,
          )),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            InkWell(
                splashColor: AppTheme.lightGrayColor,
                onTap: () {
                  NavigationUtils.push(context, RoutesName.courseContent);
                },
                child: Course()),
            Insets.gapH20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      NavigationUtils.push(context, RoutesName.testContent);
                    },
                    splashColor: AppTheme.lightGrayColor,
                    child: CourseTest()),
                InkWell(
                    onTap: () {
                      NavigationUtils.push(context, RoutesName.contactUs);
                    },
                    splashColor: AppTheme.lightGrayColor,
                    child: CourseTest2())
              ],
            )
          ],
        ),
      ),
    ));
  }
}
