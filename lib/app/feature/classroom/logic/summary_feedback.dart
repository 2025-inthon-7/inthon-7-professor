import 'package:freezed_annotation/freezed_annotation.dart';

part 'summary_feedback.freezed.dart';
part 'summary_feedback.g.dart';

@freezed
class SummaryFeedback with _$SummaryFeedback {
  factory SummaryFeedback({required int ok, required int hard}) =
      _SummaryFeedback;

  factory SummaryFeedback.fromJson(Map<String, dynamic> json) =>
      _$SummaryFeedbackFromJson(json);
}
