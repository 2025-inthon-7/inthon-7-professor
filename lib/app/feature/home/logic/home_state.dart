import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inthon_7_professor/app/model/course.dart';
import 'package:inthon_7_professor/app/model/course_session.dart';

part 'home_state.freezed.dart';
part 'home_state.g.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    @Default([]) List<Course> cources,
    Course? selectedCourse,
    @Default('') String classSearchValue,
    @Default(false) bool isStartingClass,
    CourseSession? currentCourseSession,
  }) = _HomeState;

  factory HomeState.fromJson(Map<String, dynamic> json) =>
      _$HomeStateFromJson(json);
}
