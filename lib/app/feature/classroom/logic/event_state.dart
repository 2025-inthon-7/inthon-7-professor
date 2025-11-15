import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inthon_7_professor/app/feature/classroom/logic/event_type.dart';

part 'event_state.freezed.dart';
part 'event_state.g.dart';

@freezed
class EventState with _$EventState {
  factory EventState({required List<EventType> events}) = _EventState;

  factory EventState.fromJson(Map<String, dynamic> json) =>
      _$EventStateFromJson(json);
}
