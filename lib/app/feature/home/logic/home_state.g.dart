// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeStateImpl _$$HomeStateImplFromJson(Map<String, dynamic> json) =>
    _$HomeStateImpl(
      cources:
          (json['cources'] as List<dynamic>?)
              ?.map((e) => Course.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      selectedCourse: json['selectedCourse'] == null
          ? null
          : Course.fromJson(json['selectedCourse'] as Map<String, dynamic>),
      classSearchValue: json['classSearchValue'] as String? ?? '',
      isStartingClass: json['isStartingClass'] as bool? ?? false,
    );

Map<String, dynamic> _$$HomeStateImplToJson(_$HomeStateImpl instance) =>
    <String, dynamic>{
      'cources': instance.cources,
      'selectedCourse': instance.selectedCourse,
      'classSearchValue': instance.classSearchValue,
      'isStartingClass': instance.isStartingClass,
    };
