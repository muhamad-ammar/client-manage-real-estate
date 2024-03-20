import 'package:flutter/material.dart';
import 'package:property_help/Utils/app_styles.dart';
import 'package:property_help/Utils/uiUtils.dart';

import '../../Utils/appTheme.dart';
import '../../data/model/Clients.dart';

class ClientsList extends StatefulWidget {
  const ClientsList({super.key});

  @override
  State<ClientsList> createState() => _ClientsListState();
}

class _ClientsListState extends State<ClientsList> {
  List<Client>? clients;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    clients = [
      Client(
          name: "Test 1 Client",
          id: "cl0002",
          mobile1: "00000000001",
          mobile2: null,
          email: "test@yopmail.com",
          status: "D",
          assignedTo: "tm000001"),
      Client(
          name: "Test 2 Client",
          id: "cl0002",
          mobile1: "00000000001",
          mobile2: null,
          email: "test@yopmail.com",
          status: "P3",
          assignedTo: "tm000001"),
      Client(
          name: "Test 3 Client",
          id: "cl0001",
          mobile1: "00000000000",
          mobile2: null,
          email: "test@yopmail.com",
          status: "P1",
          assignedTo: "tm000001"),
      Client(
          name: "Test 4 Client",
          id: "cl0002",
          mobile1: "00000000001",
          mobile2: null,
          email: "test@yopmail.com",
          status: "P2",
          assignedTo: "tm000001")
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
            return getClientTile(clients![index], context: context);
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
          itemCount: clients?.length ?? 0,
        ),
      ),
    );
  }
}

ListTile getClientTile(Client client, {required BuildContext context}) {
  return ListTile(
    dense: true,
    leading: Icon(Icons.person_outline),
    title: Text(
      client.name ?? "",
      style: Textify.title2.copyWith(fontSize: 15),
    ),
    isThreeLine: true,
    subtitle: Row(
      children: [
        Icon(
          Icons.subdirectory_arrow_right_sharp,
          size: 14,
          color: AppTheme.darkGrayColor,
        ),
        Insets.gapW10,
        SizedBox(
            width: UiUtils.getScreenWidth(context) * 0.5,
            child: Text(
              "Assigned To ${client.assignedTo}" ?? "",
              overflow: TextOverflow.ellipsis,
              style: Textify.paragraph4.copyWith(color: AppTheme.darkGrayColor),
            )),
      ],
    ),
  );
}
