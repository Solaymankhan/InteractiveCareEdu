import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive_cares_edu/Networks/fetched_data.dart';
import 'package:interactive_cares_edu/Networks/services/firebaseEmailAuth.dart';
import 'package:interactive_cares_edu/Utils/constants/image_paths.dart';
import 'package:interactive_cares_edu/Utils/constants/strings.dart';
import 'package:interactive_cares_edu/Utils/functions/hexColor.dart';
import 'package:interactive_cares_edu/Utils/routes/routs.dart';
import 'package:interactive_cares_edu/Utils/widgets/appBarText.dart';
import 'package:interactive_cares_edu/Utils/widgets/circleIconButton.dart';
import 'package:interactive_cares_edu/Utils/widgets/colorButton.dart';
import 'package:interactive_cares_edu/Utils/widgets/coursesTile.dart';
import 'package:interactive_cares_edu/Utils/widgets/expandedText.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../Utils/constants/colors.dart';

class dashboard_page extends StatelessWidget {
  dashboard_page({Key? key}) : super(key: key);
  fetched_data fetchedData = new fetched_data();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              circleIconButton(icon: CupertinoIcons.bars, bgColor: Colors.transparent, onTap: () {}),
              SizedBox(width: 5),
              Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                          image: AssetImage(profile_avatar_img)))),
              SizedBox(width: 5),
              appBarText(txt: FirebaseAuth.instance.currentUser!.displayName!)
                  .expand(),
              circleIconButton(icon: CupertinoIcons.bell, bgColor: Colors.transparent, onTap: () {}),
              circleIconButton(
                  icon: CupertinoIcons.square_arrow_left, bgColor: Colors.transparent,
                  onTap: () async {
                    if (await firebaseEmailAuth.signoutUser()) {
                      Get.offNamed(routes.getLoginRoute());
                    }
                  })
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              5.heightBox,
              Image.asset(daily_activity_img),
              10.heightBox,
              Text(
                recommended_txt,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              5.heightBox,
              Image.asset(recommended_img),
              20.heightBox,
              Text(
                my_courses_txt,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              5.heightBox,
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: fetchedData.coursesList.length,
                  itemBuilder: (context, index) {
                    return coursesTile(
                        image: fetchedData.coursesList[index].thumbnail,
                        text: fetchedData.coursesList[index].title,
                        buttonText: continue_courses_txt,
                        buttonTap: () async {
                          Get.toNamed(routes.getCourseDetailsRoute());
                        });
                  })
            ],
          ).marginOnly(left: 15, right: 15)),
        ));
  }
}
