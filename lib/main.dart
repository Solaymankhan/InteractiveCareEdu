import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interactive_cares_edu/Utils/constants/colors.dart';
import 'package:interactive_cares_edu/Utils/functions/hexColor.dart';
import 'package:interactive_cares_edu/Utils/routes/routs.dart';
import 'package:interactive_cares_edu/VewAndViewModels/CourseDetails/courseDetails_page.dart';
import 'package:interactive_cares_edu/firebase_options.dart';

import 'VewAndViewModels/Dashboard/dashboard_page.dart';
import 'VewAndViewModels/Login/login_page.dart';
import 'VewAndViewModels/Signup/signup_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Interactive Cares Edu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: hexColor(interactive_color_1_hex)),
        useMaterial3: true,
      ),
      initialRoute: routes.getLoginRoute(),
      getPages: routes.routesList,
    );
  }
}
