// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_important.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SummaryImportantImpl _$$SummaryImportantImplFromJson(
  Map<String, dynamic> json,
) => _$SummaryImportantImpl(
  id: (json['id'] as num).toInt(),
  trigger: json['trigger'] as String,
  note: json['note'] as String? ?? "",
  capture_url: json['capture_url'] as String?,
  created_at: DateTime.parse(json['created_at'] as String),
  question_id: (json['question_id'] as num?)?.toInt(),
  is_hardest: json['is_hardest'] as bool? ?? false,
);

Map<String, dynamic> _$$SummaryImportantImplToJson(
  _$SummaryImportantImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'trigger': instance.trigger,
  'note': instance.note,
  'capture_url': instance.capture_url,
  'created_at': instance.created_at.toIso8601String(),
  'question_id': instance.question_id,
  'is_hardest': instance.is_hardest,
};
