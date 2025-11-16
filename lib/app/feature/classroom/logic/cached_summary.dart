import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inthon_7_professor/app/feature/classroom/logic/summary.dart';

part 'cached_summary.freezed.dart';
part 'cached_summary.g.dart';

@freezed
class CachedSummary with _$CachedSummary {
  factory CachedSummary({
    required String sessionId,
    required Summary summary,
    required DateTime cachedAt,
  }) = _CachedSummary;

  factory CachedSummary.fromJson(Map<String, dynamic> json) =>
      _$CachedSummaryFromJson(json);
}
