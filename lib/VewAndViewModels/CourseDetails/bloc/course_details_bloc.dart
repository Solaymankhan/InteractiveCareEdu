import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'course_details_event.dart';
part 'course_details_state.dart';

class CourseDetailsBloc extends Bloc<CourseDetailsEvent, CourseDetailsState> {
  CourseDetailsBloc() : super(CourseDetailsInitial()) {
    on<CourseDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
