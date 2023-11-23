import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive_cares_edu/Networks/fetched_data.dart';
import 'package:interactive_cares_edu/Utils/functions/hexColor.dart';
import 'package:interactive_cares_edu/Utils/routes/routs.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Utils/constants/colors.dart';

class dashboard_page extends StatelessWidget {
  dashboard_page({Key? key}) : super(key: key);
  fetched_data fetchedData = new fetched_data();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "My courses",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          5.heightBox,
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: fetchedData.coursesList.length,
              itemBuilder: (context, index) {
                return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        width: 90,
                        height: 60,
                        fit: BoxFit.cover,
                          image: AssetImage(
                              fetchedData.coursesList[index].thumbnail)),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          fetchedData.coursesList[index].title,
                          overflow: TextOverflow.ellipsis,maxLines: 2,
                          style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500),
                        ),
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(50),
                        color: hexColor(interactive_color_1_hex),
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(routes.getCourseDetailsRoute());
                          },
                          borderRadius: BorderRadius.circular(50),
                          child: Ink(
                            height: 25,width: 120,
                            child: Text(
                              "Continue Course",
                              style: TextStyle(
                                  fontSize: 13.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ).paddingOnly(left: 5,right: 5).box.alignCenter.make(),
                          ),
                        ),
                      ).marginOnly(right: 5)
                    ],
                  ).box.height(60).margin(EdgeInsets.only(top: 2.5,bottom: 2.5)).color(Vx.gray100).customRounded(BorderRadius.all(Radius.circular(2))).make();
              })
        ],
      ).marginOnly(left: 15, right: 15)),
    ));
  }
}
