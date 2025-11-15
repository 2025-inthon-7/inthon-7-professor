// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventTypeImpl _$$EventTypeImplFromJson(Map<String, dynamic> json) =>
    _$EventTypeImpl(
      type: $enumDecode(_$ETypeEnumMap, json['type']),
      content: json['content'] as String,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$EventTypeImplToJson(_$EventTypeImpl instance) =>
    <String, dynamic>{
      'type': _$ETypeEnumMap[instance.type]!,
      'content': instance.content,
      'imageUrl': instance.imageUrl,
    };

const _$ETypeEnumMap = {
  EType.question: 'question',
  EType.difficult: 'difficult',
  EType.easy: 'easy',
  EType.info: 'info',
};
