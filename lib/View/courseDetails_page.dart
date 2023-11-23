import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive_cares_edu/Networks/modules.dart';
import 'package:interactive_cares_edu/Utils/AlertDialogs/bookMartAlertDialog.dart';
import 'package:interactive_cares_edu/Utils/buttons/circleIconButton.dart';
import 'package:interactive_cares_edu/Utils/constants/colors.dart';
import 'package:interactive_cares_edu/Utils/constants/strings.dart';
import 'package:interactive_cares_edu/Utils/functions/hexColor.dart';
import 'package:interactive_cares_edu/Utils/widgets/appBarText.dart';
import 'package:interactive_cares_edu/Utils/widgets/bookmarkTile.dart';
import 'package:interactive_cares_edu/ViewModels/controllers/courseDetailsController.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class courseDetails_page extends StatelessWidget {
  final coursedetailscontroller = Get.put(courseDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              circleIconButton(
                  icon: CupertinoIcons.back,
                  bgColor: Colors.transparent,
                  onTap: () {
                    Get.back();
                  }),
              SizedBox(width: 5),
              appBarText(txt: datascience_essentianls_txt)
            ],
          ),
        ),
        body: Column(
            children: [
              YoutubePlayer(
                controller: coursedetailscontroller.yutubeController,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.blueAccent,
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(children: [
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        bookmarks_txt,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      circleIconButton(
                          icon: CupertinoIcons.plus,
                          iconColor: Colors.white,
                          bgColor: hexColor(interactive_color_1_hex),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return bookMartAlertDialog(
                                    time: coursedetailscontroller
                                        .yutubeController
                                        .value
                                        .position
                                        .inSeconds
                                        .toString());
                              },
                            );
                          })
                    ],
                  ),
                  10.heightBox,
                  Obx(()=> ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: coursedetailscontroller
                          .sharedpreferencesdata.bookmarksTime.length,
                      itemBuilder: (context, index) {
                        return bookmarkTile(
                            time: coursedetailscontroller
                                .sharedpreferencesdata.bookmarksTime[index],
                            description: coursedetailscontroller
                                .sharedpreferencesdata
                                .bookmarksDescription[index],
                            onTap: (() {
                              coursedetailscontroller.sharedpreferencesdata
                                  .deleteABookmark(index);
                            }));
                      },
                    )
                        .box
                        .height(coursedetailscontroller
                                    .sharedpreferencesdata.bookmarkLength.value ==
                                0
                            ? 0
                            : 50)
                        .make(),
                  ),
                  5.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        course_moduls_txt,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: [
                          circleIconButton(
                              icon: CupertinoIcons.back,
                              bgColor: Colors.transparent,
                              onTap: () {
                                coursedetailscontroller
                                    .presentModuleIndex.value = 0 >
                                        coursedetailscontroller
                                                .presentModuleIndex.value -
                                            1
                                    ? 0
                                    : coursedetailscontroller
                                            .presentModuleIndex.value -
                                        1;
                                coursedetailscontroller.playFromSpecificTime(
                                    int.parse(modules[coursedetailscontroller
                                            .presentModuleIndex.value]["time"]
                                        .toString()));
                              }),
                          SizedBox(width: 10),
                          circleIconButton(
                              icon: CupertinoIcons.forward,
                              bgColor: Colors.transparent,
                              onTap: () {
                                coursedetailscontroller.presentModuleIndex
                                    .value = modules.length - 1 <
                                        coursedetailscontroller
                                                .presentModuleIndex.value +
                                            1
                                    ? coursedetailscontroller
                                        .presentModuleIndex.value
                                    : coursedetailscontroller
                                            .presentModuleIndex.value +
                                        1;
                                coursedetailscontroller.playFromSpecificTime(
                                    int.parse(modules[coursedetailscontroller
                                            .presentModuleIndex.value]["time"]
                                        .toString()));
                              })
                        ],
                      )
                    ],
                  ),
                  5.heightBox,
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: modules.length,
                    itemBuilder: (context, index) {
                      return Obx(
                          ()=> ListTile(
                          leading: Text((index + 1).toString()),
                          title: Text(
                            modules[index]["time"].toString() +
                                " sec : " +
                                modules[index]["title"].toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          subtitle: Text(
                            modules[index]["description"].toString(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 12),
                          ),
                        )
                            .box
                            .color(coursedetailscontroller
                                        .presentModuleIndex.value ==
                                    index
                                ? Vx.gray300
                                : Vx.gray100)
                            .customRounded(BorderRadius.all(Radius.circular(2)))
                            .margin(EdgeInsets.only(top: 2, bottom: 2))
                            .make(),
                      );
                    },
                  )
                ]).marginOnly(left: 15, right: 15),
              ))
            ],
          ),
        );
  }
}
