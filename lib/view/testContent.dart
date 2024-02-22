import 'package:flutter/material.dart';

import '../Utils/appTheme.dart';
import '../Utils/app_styles.dart';

class TestContent extends StatefulWidget {
  const TestContent({super.key});

  @override
  State<TestContent> createState() => _TestContentState();
}

class _TestContentState extends State<TestContent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(backgroundColor: AppTheme.primaryColor,
        title: Text("Assessments", style: Textify.title1.copyWith(color: AppTheme.backgroundColor),),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.chevron_left, color: AppTheme.backgroundColor,)),
      ),
      body: Container(
        child: Column(
          children: [],
        ),
      ),
    ));
  }
}
