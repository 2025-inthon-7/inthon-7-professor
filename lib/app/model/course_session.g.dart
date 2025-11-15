// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseSessionImpl _$$CourseSessionImplFromJson(Map<String, dynamic> json) =>
    _$CourseSessionImpl(
      id: json['id'] as String,
      course: Course.fromJson(json['course'] as Map<String, dynamic>),
      date: json['date'] as String,
      is_active: json['is_active'] as bool,
    );

Map<String, dynamic> _$$CourseSessionImplToJson(_$CourseSessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'course': instance.course,
      'date': instance.date,
      'is_active': instance.is_active,
    };
