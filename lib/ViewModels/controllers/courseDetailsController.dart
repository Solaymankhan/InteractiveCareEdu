import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive_cares_edu/LocalData/sharedPreferencesData.dart';
import 'package:interactive_cares_edu/Utils/constants/strings.dart';
import 'package:interactive_cares_edu/Utils/routes/routs.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class courseDetailsController extends GetxController{
  late YoutubePlayerController yutubeController;
  sharedPreferencesData sharedpreferencesdata = new sharedPreferencesData();
  RxInt presentModuleIndex = 0.obs;

  @override
  void onInit() {
    yutubeController = YoutubePlayerController(
      initialVideoId: yutube_videoId_txt,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    )..addListener(videoListener);
    sharedpreferencesdata.loadBookmarks();
    super.onInit();
  }
  @override
  void dispose() {
    yutubeController.removeListener(videoListener);
    yutubeController.dispose();
    super.dispose();
  }

  void videoListener() {
    if (yutubeController.value.playerState == PlayerState.ended) {
      showCompletionMessage();
    }
  }
  void showCompletionMessage() {
    Get.snackbar(
      video_complete_msg_txt,
      claim_txt,
      colorText: Colors.white,
      backgroundColor: Colors.black,
      isDismissible: true,
      onTap: (snackbar) {
        Get.offNamed(routes.getDashboardRoute());
      },
    );
  }

  void playFromSpecificTime(int seconds) {
    yutubeController.seekTo(Duration(seconds: seconds));
    yutubeController.play();
  }

}