import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive_cares_edu/Networks/modules.dart';
import 'package:interactive_cares_edu/Utils/AlertDialogs/bookMartAlertDialog.dart';
import 'package:interactive_cares_edu/Utils/constants/colors.dart';
import 'package:interactive_cares_edu/Utils/functions/hexColor.dart';
import 'package:interactive_cares_edu/Utils/widgets/appBarText.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../LocalData/sharedPreferencesData.dart';

class courseDetails_page extends StatefulWidget {
  courseDetails_page({Key? key}) : super(key: key);

  @override
  State<courseDetails_page> createState() => _courseDetails_pageState();
}

class _courseDetails_pageState extends State<courseDetails_page> {
  late YoutubePlayerController _controller;
  sharedPreferencesData sharedpreferencesdata = new sharedPreferencesData();
  int presentModuleIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: '81glyreIXPk',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    )..addListener(_videoListener);
    sharedpreferencesdata.loadBookmarks();
  }

  void _videoListener() {
    if (_controller.value.playerState == PlayerState.ended) {
      // Video playback is completed, show the message
      _showCompletionMessage();
    }
  }

  void _showCompletionMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Congratulations! You have completed the video.'),
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  void _playFromSpecificTime(int seconds) {
    _controller.seekTo(Duration(seconds: seconds));
    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Material(
                borderRadius: BorderRadius.circular(50),
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  borderRadius: BorderRadius.circular(50),
                  child: Ink(
                      height: 40, width: 40, child: Icon(CupertinoIcons.back)),
                ),
              ),
              SizedBox(width: 5),
              appBarText(txt: "Data Science Essentials")
            ],
          ),
        ),
        body: Column(
          children: [
            YoutubePlayer(
              controller: _controller,
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
                      "Bookmarks",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(50),
                      color: hexColor(interactive_color_1_hex),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return bookMartAlertDialog(
                                  time: _controller.value.position.inSeconds
                                      .toString());
                            },
                          );
                        },
                        borderRadius: BorderRadius.circular(50),
                        child: Ink(
                            height: 35,
                            width: 35,
                            child: Icon(
                              CupertinoIcons.plus,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ],
                ),
                10.heightBox,
                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: sharedpreferencesdata.bookmarksTime.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        SizedBox(width: 5),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${sharedpreferencesdata.bookmarksTime[index]} sec',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                sharedpreferencesdata
                                    .bookmarksDescription[index],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(CupertinoIcons.multiply, size: 18).onTap(() {
                          sharedpreferencesdata.deleteABookmark(index);
                          setState(() {});
                        })
                      ],
                    )
                        .centered()
                        .box
                        .width(250)
                        .color(Vx.gray200)
                        .rounded
                        .padding(EdgeInsets.only(left: 5, right: 5))
                        .margin(EdgeInsets.only(left: 2, right: 2))
                        .make();
                  },
                )
                    .box
                    .height(sharedpreferencesdata.bookmarksTime.length == 0
                        ? 0
                        : 50)
                    .make(),
                5.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Course Moduls",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        Material(
                          borderRadius: BorderRadius.circular(50),
                          child: InkWell(
                            onTap: () {
                              presentModuleIndex = 0 > presentModuleIndex - 1
                                  ? 0
                                  : presentModuleIndex - 1;
                              _playFromSpecificTime(int.parse(
                                  modules[presentModuleIndex]["time"]
                                      .toString()));
                              setState(() {});
                            },
                            borderRadius: BorderRadius.circular(50),
                            child: Ink(
                                height: 35,
                                width: 35,
                                child: Icon(CupertinoIcons.back)),
                          ),
                        ),
                        SizedBox(width: 10),
                        Material(
                          borderRadius: BorderRadius.circular(50),
                          child: InkWell(
                            onTap: () {
                              presentModuleIndex =
                                  modules.length - 1 < presentModuleIndex + 1
                                      ? presentModuleIndex
                                      : presentModuleIndex + 1;
                              _playFromSpecificTime(int.parse(
                                  modules[presentModuleIndex]["time"]
                                      .toString()));
                              setState(() {});
                            },
                            borderRadius: BorderRadius.circular(50),
                            child: Ink(
                                height: 35,
                                width: 35,
                                child: Icon(CupertinoIcons.forward)),
                          ),
                        ),
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
                    return ListTile(
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
                        .color(presentModuleIndex == index
                            ? Vx.gray300
                            : Vx.gray100)
                        .customRounded(BorderRadius.all(Radius.circular(2)))
                        .margin(EdgeInsets.only(top: 2, bottom: 2))
                        .make();
                  },
                )
              ]).marginOnly(left: 15, right: 15),
            ))
          ],
        ));
  }

  @override
  void dispose() {
    _controller.removeListener(_videoListener);
    _controller.dispose();
    super.dispose();
  }
}
