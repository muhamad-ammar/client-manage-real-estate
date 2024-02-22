import 'package:property_help/Utils/app_styles.dart';
import 'package:property_help/Utils/uiUtils.dart';
import 'package:flutter/material.dart';

class Course extends StatefulWidget {
  const Course({super.key});

  @override
  State<Course> createState() => _CourseState();
}

class _CourseState extends State<Course> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: UiUtils.getScreenWidth(context),
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
                  Icon(Icons.science_outlined, size: 20,),
                  Insets.gapW10,
                  Text("Medical Lab Technologist", style: Textify.title1,),
                ],
              ),
              Insets.gapH20,
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: UiUtils.getScreenWidth(context) * 0.5,
                        child: Text(
                            "Welcome to a professional crash course where we'll accelerate your expertise and refine your skills", maxLines: 8,overflow: TextOverflow.ellipsis,)),
                    Icon(Icons.chevron_right, size:40,)
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
