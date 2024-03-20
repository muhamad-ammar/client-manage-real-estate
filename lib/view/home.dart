import 'package:property_help/constants/routesNames.dart';
import 'package:property_help/utils/navigation_utils.dart';
import 'package:flutter/material.dart';
import 'package:property_help/view/HomeWidgets/custom_tab_bar.dart';
import 'package:property_help/view/HomeWidgets/custom_team_list.dart';
import '../Utils/appTheme.dart';
import '../Utils/app_styles.dart';
import '../data/model/Clients.dart';
import '../data/model/User.dart';
import 'HomeWidgets/custom_clients_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User>? team;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    team = [
      // User objects with data
      User(
          name: "John Doe",
          id: "user_123",
          mobile1: "+1234567890",
          role: "admin",
          assignees: [Assignee(clientName: "ARG Client", clientId: "cl0001")]),
      User(
          name: "Jane Smith",
          id: "user_456",
          mobile1: "+9876543210",
          email: "jane.smith@example.com",
          role: "developer",
          assignees: [
            Assignee(clientName: "ARG2 Client", clientId: "cl0004"),
            Assignee(clientName: "ARG Client", clientId: "cl0002")
          ]),
      User(
        name: "Michael Chen",
        id: "user_789",
        mobile1: "+5678901234",
        mobile2: "",
        // Example of leaving a field empty
        role: "designer",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
            initialIndex: 0,
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: AppTheme.primaryColor,
                bottom: getTabBar(),
              ),
              body: TabBarView(
                children: <Widget>[
                  ClientsList(),
                  TeamList(team: team ?? []),
                  Center(
                    child: Text("It's sunny here"),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
