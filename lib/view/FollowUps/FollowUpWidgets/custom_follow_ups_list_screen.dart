import 'package:flutter/material.dart';
import 'package:property_help/Utils/app_styles.dart';
import 'package:property_help/Utils/uiUtils.dart';

import '../../../Utils/appTheme.dart';
import '../../../data/model/follow_up.dart';
import 'custom_follow_up_list.dart';
import 'custom_no_follow_up.dart';

class FollowUpListScreen extends StatefulWidget {
  List<FollowUps>? followups;
  String? title;

  FollowUpListScreen({super.key, required this.followups, this.title = "Overdue"});

  @override
  State<FollowUpListScreen> createState() => _FollowUpListScreenState();
}

class _FollowUpListScreenState extends State<FollowUpListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        leading: IconButton(
          icon: Icon(Icons.chevron_left, size: 35,),
          color: AppTheme.primaryTextColor,
          onPressed: () => Navigator.pop(context),
        ),
        title:Text("${widget.title} Follow Ups", style: Textify.title1,),
      ),
      body: widget.followups != null && widget.followups!.isNotEmpty ? Padding(
        padding: const EdgeInsets.all(10.0),
        child: FollowUpList(followUps: widget.followups),
      ) : CustomNoFollowUp(),

    );
  }
}

