import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inthon_7_professor/app/feature/classroom/logic/cached_summary.dart';

part 'history_state.freezed.dart';

@freezed
class HistoryState with _$HistoryState {
  factory HistoryState({
    @Default([]) List<CachedSummary> summaries,
    @Default(false) bool isLoading,
  }) = _HistoryState;
}
