import 'package:get/get.dart';
import 'package:interactive_cares_edu/View/courseDetails_page.dart';
import 'package:interactive_cares_edu/View/dashboard_page.dart';
import 'package:interactive_cares_edu/View/login_page.dart';
import 'package:interactive_cares_edu/View/signup_page.dart';

class routes{
  static String login="/";
  static String getLoginRoute()=>login;
  static String signUp="/signup";
  static String getSignUpRoute()=>signUp;
  static String dashBoard="/dashboard";
  static String getDashboardRoute()=>dashBoard;
  static String courseDetails="/cousedetails";
  static String getCourseDetailsRoute()=>courseDetails;

  static List<GetPage> routesList=[
    GetPage(name: login, page: ()=>login_page()),
    GetPage(name: signUp, page: ()=>signup_page()),
    GetPage(name: dashBoard, page: ()=>dashboard_page()),
    GetPage(name: courseDetails, page: ()=>courseDetails_page()),
  ];

}