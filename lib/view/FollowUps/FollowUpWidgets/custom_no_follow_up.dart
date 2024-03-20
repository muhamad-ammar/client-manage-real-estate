import 'package:flutter/material.dart';

import '../../../Utils/appTheme.dart';
import '../../../Utils/app_styles.dart';
import '../../../Utils/uiUtils.dart';
class CustomNoFollowUp extends StatelessWidget {
  const CustomNoFollowUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      // padding: EdgeInsets.only(left: UiUtils.getScreenWidth(context)*0.27, top: UiUtils.getScreenHeight(context)*0.35),
      child: Column( mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.calendar_today_rounded,
            size: 40,
            color: AppTheme.grayColor,
          ),
          Insets.gapH10,
          Text(
            "No Client to FollowUp",
            style: Textify.title1,
          ),

          Insets.gapH10,
          SizedBox( width: UiUtils.getScreenWidth(context)*0.4,
            child: Text(
              "Follow up is useful to plan out what's next for a particular client.",
              style: Textify.hint,
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }
}
