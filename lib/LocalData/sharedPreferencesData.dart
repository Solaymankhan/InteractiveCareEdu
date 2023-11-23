import 'package:shared_preferences/shared_preferences.dart';



class sharedPreferencesData {
  List<String> bookmarksTime = [];
  List<String> bookmarksDescription = [];

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
  }
}