import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_type.freezed.dart';
part 'event_type.g.dart';

enum EType { question, difficult, easy, info }

@freezed
class EventType with _$EventType {
  factory EventType({
    required EType type,
    required String content,
    required DateTime timestamp,
    @Default([]) List<int> imageData,
    @Default(1) int count,
    int? question_id,
  }) = _EventType;

  factory EventType.fromJson(Map<String, dynamic> json) =>
      _$EventTypeFromJson(json);
}
