import 'package:freezed_annotation/freezed_annotation.dart';

part 'course.freezed.dart';
part 'course.g.dart';

extension CourseX on Course {
  String get displayName => '[$code] $name - $professor';
}

@freezed
class Course with _$Course {
  factory Course({
    @Default(-1) int id,
    required String code,
    required String name,
    required String professor,
    @Default("") String time,
  }) = _Course;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
}
