import 'package:flutter/material.dart';

import '../../Utils/appTheme.dart';

PreferredSizeWidget getTabBar(){
  return TabBar(
    indicatorColor: AppTheme.primaryTextColor,
    unselectedLabelColor: AppTheme.primaryTextColor,
    labelColor: AppTheme.accentColor,
    tabs: <Widget>[
      Tab(
        text: "All Clients",
        icon: Icon(Icons.group),
      ),
      Tab(
        text: "Teams",
        icon: Icon(Icons.accessibility),
      ),
      Tab(
        text: "Groups",
        icon: Icon(Icons.account_tree_sharp),
      )
    ],
  );
}