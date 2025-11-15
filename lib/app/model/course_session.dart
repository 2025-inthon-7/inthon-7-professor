import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inthon_7_professor/app/model/course.dart';

part 'course_session.freezed.dart';
part 'course_session.g.dart';

@freezed
class CourseSession with _$CourseSession {
  factory CourseSession({
    required String id,
    required Course course,
    required String date,
    required bool is_active,
  }) = _CourseSession;

  factory CourseSession.fromJson(Map<String, dynamic> json) =>
      _$CourseSessionFromJson(json);
}
