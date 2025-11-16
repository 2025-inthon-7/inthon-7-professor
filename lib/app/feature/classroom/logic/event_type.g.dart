// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventTypeImpl _$$EventTypeImplFromJson(Map<String, dynamic> json) =>
    _$EventTypeImpl(
      type: $enumDecode(_$ETypeEnumMap, json['type']),
      content: json['content'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      imageData:
          (json['imageData'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      count: (json['count'] as num?)?.toInt() ?? 1,
      question_id: (json['question_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$EventTypeImplToJson(_$EventTypeImpl instance) =>
    <String, dynamic>{
      'type': _$ETypeEnumMap[instance.type]!,
      'content': instance.content,
      'timestamp': instance.timestamp.toIso8601String(),
      'imageData': instance.imageData,
      'count': instance.count,
      'question_id': instance.question_id,
    };

const _$ETypeEnumMap = {
  EType.question: 'question',
  EType.difficult: 'difficult',
  EType.easy: 'easy',
  EType.info: 'info',
};
