import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';



class sharedPreferencesData extends GetxController{
  List<String> bookmarksTime = [];
  List<String> bookmarksDescription = [];
  RxInt bookmarkLength=0.obs;

  void saveBookmark(time,description) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bookmarksTime.add(time);
    bookmarksDescription.add(description);
    prefs.setStringList('bookmarksTime', bookmarksTime);
    prefs.setStringList('bookmarksDescription', bookmarksDescription);
    loadBookmarks();
  }
  void deleteABookmark(index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bookmarksTime.removeAt(index);
    bookmarksDescription.removeAt(index);
    prefs.setStringList('bookmarksTime', bookmarksTime);
    prefs.setStringList('bookmarksDescription', bookmarksDescription);
    loadBookmarks();
  }

  void loadBookmarks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bookmarksTime = prefs.getStringList('bookmarksTime') ?? [];
    bookmarksDescription = prefs.getStringList('bookmarksDescription') ?? [];
    bookmarkLength.value=bookmarksTime.length;
    print(bookmarkLength.value.toString());
  }
}