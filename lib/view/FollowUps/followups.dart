import 'package:flutter/material.dart';
import 'package:property_help/Utils/app_styles.dart';
import 'package:property_help/Utils/uiUtils.dart';
import 'package:property_help/view/FollowUps/FollowUpWidgets/custom_follow_up_list.dart';
import 'package:property_help/view/FollowUps/FollowUpWidgets/custom_no_follow_up.dart';

import '../../Utils/appTheme.dart';
import '../../data/model/follow_up.dart';
import 'FollowUpWidgets/custom_follow_up_section_tile.dart';
import 'FollowUpWidgets/custom_follow_ups_list_screen.dart';

class FollowUpsScreen extends StatefulWidget {
  const FollowUpsScreen({super.key});

  @override
  State<FollowUpsScreen> createState() => _FollowUpsScreenState();
}

class _FollowUpsScreenState extends State<FollowUpsScreen> {
  List<FollowUps>? todayFollowUps;
  List<FollowUps>? upComingFollowUps;
  List<FollowUps>? overDueFollowUps;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todayFollowUps = [
      FollowUps(
          clientName: "Test Client",
          clientId: "cl00001",
          title: "Rizwan ARG 13 Jan",
          description: "ARG mai 5m chahiye. 15 Jan ko visit krey ga. Next FollowUp 14 Jan ko krna hai",
          teamMemberId: "tm0001",
          teamMemberName: "User1",
          timeStamp: "2024-03-25T15:00:00.000Z"),
      FollowUps(
          clientName: "Test Client",
          clientId: "cl00001",
          title: "Rizwan ARG 13 Jan",
          description: "ARG mai 5m chahiye. 15 Jan ko visit krey ga. Next FollowUp 14 Jan ko krna hai",
          teamMemberId: "tm0001",
          teamMemberName: "User1",
          timeStamp: "2024-04-25T15:00:00.000Z")
    ];
    upComingFollowUps = [
      FollowUps(
          clientName: "Test Client",
          clientId: "cl00001",
          title: "Rizwan ARG 13 Jan",
          description: "ARG mai 5m chahiye. 15 Jan ko visit krey ga. Next FollowUp 14 Jan ko krna hai",
          teamMemberId: "tm0001",
          teamMemberName: "User1",
          timeStamp: "2024-03-25T15:00:00.000Z"),
      FollowUps(
          clientName: "Test Client",
          clientId: "cl00001",
          title: "Rizwan ARG 13 Jan",
          description: "ARG mai 5m chahiye. 15 Jan ko visit krey ga. Next FollowUp 14 Jan ko krna hai",
          teamMemberId: "tm0001",
          teamMemberName: "User1",
          timeStamp: "2024-04-25T15:00:00.000Z")
    ];
    overDueFollowUps = [
      FollowUps(
          clientName: "Test Client",
          clientId: "cl00001",
          title: "Rizwan ARG 13 Jan",
          description: "ARG mai 5m chahiye. 15 Jan ko visit krey ga. Next FollowUp 14 Jan ko krna hai",
          teamMemberId: "tm0001",
          teamMemberName: "User1",
          timeStamp: "2024-03-25T15:00:00.000Z"),
      FollowUps(
          clientName: "Test Client",
          clientId: "cl00001",
          title: "Rizwan ARG 13 Jan",
          description: "ARG mai 5m chahiye. 15 Jan ko visit krey ga. Next FollowUp 14 Jan ko krna hai",
          teamMemberId: "tm0001",
          teamMemberName: "User1",
          timeStamp: "2024-04-25T15:00:00.000Z")
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        title: Center(
            child: Text(
          "Follow Ups",
          style: Textify.heading1,
        )),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: AppTheme.lightGrayColor),
          padding: EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Column(
            children: [
              CustomFollowUpTile(
                title: "Overdue",
                color: AppTheme.errorColor,
                splashColor: AppTheme.lightErrorColor,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FollowUpListScreen(
                                followups: overDueFollowUps,
                              )));
                },
              ),
              CustomFollowUpTile(
                title: "Upcoming",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FollowUpListScreen(
                                followups: upComingFollowUps,
                            title: "Upcoming",

                              )));
                },
              ),
              Insets.gapH5,
              SizedBox(
                height: UiUtils.getScreenHeight(context) * 0.55,
                child: Card(
                  child: Column(
                    children: [
                      ListTile(
                        splashColor: AppTheme.yellowColor,
                        title: Text(
                          "Today",
                          style: Textify.heading2
                              .copyWith(color: AppTheme.darkBlueColor),
                        ),
                        contentPadding: EdgeInsets.only(left: 20, top: 10),
                        onTap: () {},
                        enabled: false,
                        dense: true,
                        leading: Icon(
                          Icons.date_range,
                          color: AppTheme.darkBlueColor,
                        ),
                      ),
                      Divider(
                        thickness: 0.6,
                        color: AppTheme.grayColor,
                      ),
                      Expanded(
                          child: todayFollowUps != null &&
                                  todayFollowUps!.isNotEmpty
                              ? FollowUpList(followUps: todayFollowUps)
                              : CustomNoFollowUp())
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
