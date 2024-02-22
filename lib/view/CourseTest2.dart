import 'package:property_help/Utils/app_styles.dart';
import 'package:property_help/Utils/uiUtils.dart';
import 'package:flutter/material.dart';

class CourseTest2 extends StatefulWidget {
  const CourseTest2({super.key});

  @override
  State<CourseTest2> createState() => _CourseTest2State();
}

class _CourseTest2State extends State<CourseTest2> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: UiUtils.getScreenWidth(context)*0.42,
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
                  Icon(Icons.contact_support_outlined, size: 20,),
                  Insets.gapW10,
                  Text("Contact", style: Textify.title1,),
                ],
              ),
              Insets.gapH20,
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: UiUtils.getScreenWidth(context) * 0.2,
                        child: Text(
                            "Contact Us", maxLines: 8,overflow: TextOverflow.ellipsis,)),
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
