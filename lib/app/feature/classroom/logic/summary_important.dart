import 'package:freezed_annotation/freezed_annotation.dart';

part 'summary_important.freezed.dart';
part 'summary_important.g.dart';

@freezed
class SummaryImportant with _$SummaryImportant {
  factory SummaryImportant({
    required int id,
    required String trigger,
    @Default("") String note,
    String? capture_url,
    required DateTime created_at,
    int? question_id,
    @Default(false) bool is_hardest,
  }) = _SummaryImportant;

  factory SummaryImportant.fromJson(Map<String, dynamic> json) =>
      _$SummaryImportantFromJson(json);
}
