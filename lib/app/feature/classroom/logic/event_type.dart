import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_type.freezed.dart';
part 'event_type.g.dart';

enum EType { question, difficult, easy, info }

@freezed
class EventType with _$EventType {
  factory EventType({required EType type, required String content}) =
      _EventType;

  factory EventType.fromJson(Map<String, dynamic> json) =>
      _$EventTypeFromJson(json);
}
