import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inthon_7_professor/app/feature/classroom/logic/summary_feedback.dart';
import 'package:inthon_7_professor/app/feature/classroom/logic/summary_important.dart';
import 'package:inthon_7_professor/app/model/course.dart';

part 'summary.freezed.dart';
part 'summary.g.dart';

@freezed
class Summary with _$Summary {
  factory Summary({
    required DateTime date,
    required Course course,
    required SummaryFeedback feedback,
    required int question_count,
    @Default([]) List<SummaryImportant> important_moments,
  }) = _Summary;

  factory Summary.fromJson(Map<String, dynamic> json) =>
      _$SummaryFromJson(json);
}
