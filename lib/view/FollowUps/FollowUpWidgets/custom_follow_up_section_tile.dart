import 'package:flutter/material.dart';

import '../../../Utils/appTheme.dart';
import '../../../Utils/app_styles.dart';

class CustomFollowUpTile extends StatelessWidget {
  String title;
  Color? color;
  Color? splashColor;
  void Function()? onTap;

  CustomFollowUpTile(
      {super.key,
      required this.title,
      this.color = AppTheme.primaryTextColor,
      this.splashColor = AppTheme.yellowColor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(

      child: ListTile(
        splashColor: splashColor,
        title: Text(
          title,
          style: Textify.heading2.copyWith(color: color),
        ),
        onTap: onTap,
        contentPadding: EdgeInsets.all(15),
        dense: true,
        trailing: Icon(
          Icons.chevron_right_outlined,
          size: 30,
          color: color,
        ),
        leading: Icon(
          Icons.date_range,
          color: color,
        ),
      ),
      color: AppTheme.backgroundColor,
    );
  }
}
