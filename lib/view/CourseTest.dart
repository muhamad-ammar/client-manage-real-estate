import 'package:property_help/Utils/app_styles.dart';
import 'package:property_help/Utils/uiUtils.dart';
import 'package:flutter/material.dart';

class CourseTest extends StatefulWidget {
  const CourseTest({super.key});

  @override
  State<CourseTest> createState() => _CourseTestState();
}

class _CourseTestState extends State<CourseTest> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: UiUtils.getScreenWidth(context)*0.5,
      child: Card(

        elevation: 4,
        child: Container(
          padding: EdgeInsets.all(15),
          width: UiUtils.getScreenWidth(context)*0.5,
          child: Column(
            children: [
              Insets.gapH10,
              Row(
                children: [
                  Icon(Icons.check_box, size: 20,),
                  Insets.gapW10,
                  Text("Test", style: Textify.title1,),
                ],
              ),
              Insets.gapH20,
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: UiUtils.getScreenWidth(context) * 0.35,
                        child: Text(
                            "Assessment Tests", maxLines: 8,overflow: TextOverflow.ellipsis,)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
