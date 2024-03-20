import 'package:flutter/material.dart';
import 'package:property_help/Utils/app_styles.dart';
import 'package:property_help/Utils/uiUtils.dart';
import 'package:property_help/data/model/User.dart';

import '../../Utils/appTheme.dart';

class ViewProfileScreen extends StatefulWidget {
  @override
  _ViewProfileScreenState createState() => _ViewProfileScreenState();
}

class _ViewProfileScreenState extends State<ViewProfileScreen> {
  // Replace with your initial user data
  User? userData;

  // Simulate fetching data (replace with actual data fetching logic)

  @override
  void initState() {
    super.initState();
    userData = User(
        name: "Muhammad Ammar",
        id: "tm0001",
        mobile1: "03226258404",
        email: "ammar@gmail.com",
        role: "Manager",
        assignees: [Assignee(clientName:"ARG Client", clientId: "cl0001" )]); // Fetch data on initialization
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container( width: UiUtils.getScreenWidth(context)*0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage(""),
              ),
              Insets.gapH20,

              Text(
                userData?.name ?? "",
                style: Textify.heading1,
              ),
              Insets.gapH5,
              // Email
              Text(userData?.role ?? "", style: Textify.heading2.copyWith(color: AppTheme.darkGrayColor)),
              Insets.gapH5,
              Text(userData?.mobile1 ?? "", style: Textify.heading2.copyWith(color: AppTheme.darkGrayColor)),
              Insets.gapH5
              // Username

              // Add more profile details here (e.g., bio, location)
              // ...
            ],
          ),
        ),
      ),
    );
  }
}
