import 'package:flutter/material.dart';
import 'package:property_help/Utils/app_styles.dart';
import 'package:property_help/Utils/uiUtils.dart';
import 'package:property_help/view/HomeWidgets/add_a_client_team.dart';

import '../../Utils/appTheme.dart';
import '../../data/model/Clients.dart';
import '../../data/model/User.dart';

class TeamList extends StatefulWidget {
  List<User> team;

  TeamList({super.key, required this.team});

  @override
  State<TeamList> createState() => _TeamListState();
}

class _TeamListState extends State<TeamList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,  MaterialPageRoute(builder: (context)=> AddAClientOrTeam(type: "Team Member",)));
        },
        child: Icon(
          Icons.add,
          size: 25,
          color: AppTheme.primaryTextColor,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20, left: 5),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return getTeamTile(widget.team[index], context: context);
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 15.0,
              // Adjusts the height of the divider (thickness)
              thickness: 1.0,
              // Adjusts the width of the line (optional)
              color: Colors.grey,
              // Change the color of the divider
              indent: 20.0,
              // Adds padding on the left side (optional)
              endIndent: 20.0, // Adds padding on the right side (optional)
            );
          },
          itemCount: widget.team.length ?? 0,
        ),
      ),
    );
  }
}

ListTile getTeamTile(User team, {required BuildContext context}) {
  return ListTile(
    dense: true,
    leading: Icon(Icons.person_outline),
    title: Text(
      team.name ?? "",
      style: Textify.title2.copyWith(fontSize: 15),
    ),
    isThreeLine: true,
    subtitle: team.assignees == null || team.assignees!.isEmpty
        ? Text(
            "No Client Assigned",
            style: Textify.paragraph4.copyWith(color: AppTheme.errorColor),
          )
        : Row(
            children: [
              Icon(
                Icons.subdirectory_arrow_right_sharp,
                size: 14,
                color: AppTheme.darkGrayColor,
              ),
              Insets.gapW10,
              SizedBox(
                width: UiUtils.getScreenWidth(context) * 0.7,
                height: UiUtils.getScreenHeight(context) * 0.02,
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Insets.gapW5;
                  },
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Text(
                      team.assignees![index].clientName!,
                      style: Textify.paragraph4
                          .copyWith(color: AppTheme.darkGrayColor),
                    );
                  },
                  itemCount: team.assignees!.length,
                ),
              )
            ],
          ),
  );
}
