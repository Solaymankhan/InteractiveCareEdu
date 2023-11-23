
import 'dart:convert';
import 'package:interactive_cares_edu/Model/course_model.dart';
import 'package:interactive_cares_edu/Networks/courses.dart';

class fetched_data {

  List<course_model> coursesList = List<Map<String, dynamic>>.from(json.decode(coursesJson))
                                   .map((json) =>course_model.fromJson(json)).toList();


}