import 'package:property_help/constants/routesNames.dart';
import 'package:property_help/utils/navigation_utils.dart';
import 'package:flutter/material.dart';
import 'package:property_help/view/HomeWidgets/custom_tab_bar.dart';
import '../Utils/appTheme.dart';
import '../Utils/app_styles.dart';
import '../data/model/Clients.dart';
import 'HomeWidgets/custom_clients_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

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
                  Center(
                    child: Text("It's rainy here"),
                  ),
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
