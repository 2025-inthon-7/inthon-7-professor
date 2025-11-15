import 'package:freezed_annotation/freezed_annotation.dart';

part 'pip_state.freezed.dart';
part 'pip_state.g.dart';

@freezed
class PipState with _$PipState {
  factory PipState({required bool isInPipMode}) = _PipState;

  factory PipState.fromJson(Map<String, dynamic> json) =>
      _$PipStateFromJson(json);
}
