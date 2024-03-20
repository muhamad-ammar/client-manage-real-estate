import 'package:flutter/material.dart';
import 'package:property_help/Utils/app_styles.dart';
import 'package:intl/intl.dart';

import '../../../Utils/appTheme.dart';
import '../../../data/model/follow_up.dart';

class FollowUpList extends StatefulWidget {
  List<FollowUps>? followUps;

  FollowUpList({super.key, required this.followUps});

  @override
  State<FollowUpList> createState() => _FollowUpListState();
}

class _FollowUpListState extends State<FollowUpList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          DateTime timestamp =
              DateTime.parse(widget.followUps![index].timeStamp!);
          String formattedDate = DateFormat('yyyy-MM-dd').format(timestamp);
          String formattedTime = DateFormat.jm('en_US')
              .format(timestamp); // 12-hour format with AM/PMme

          print("$formattedDate - $formattedTime");
          return Card(
            elevation: 4,
              child: ListTile(
                contentPadding: EdgeInsets.only(left: 20, bottom: 10),
            trailing: IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
            dense: true,
            isThreeLine: true,
            title: Text(
              widget.followUps?[index].title ?? "",
              style: Textify.title1,
            ),
            subtitle: Column(
              children: [
                Text(
                  widget.followUps?[index].description ?? "",
                  style: Textify.hint,
                ),
                Insets.gapH5,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Due $formattedDate",
                      style: Textify.paragraph2.copyWith(
                          color: AppTheme.errorColor,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      formattedTime,
                      style: Textify.paragraph2.copyWith(
                          color: AppTheme.errorColor,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                )
              ],
            ),
          ));
        },
        separatorBuilder: (context, index) {
          return Insets.gapH10;
        },
        itemCount: widget.followUps?.length ?? 0);
  }
}
