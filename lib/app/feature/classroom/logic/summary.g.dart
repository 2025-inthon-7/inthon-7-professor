// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SummaryImpl _$$SummaryImplFromJson(Map<String, dynamic> json) =>
    _$SummaryImpl(
      date: DateTime.parse(json['date'] as String),
      course: Course.fromJson(json['course'] as Map<String, dynamic>),
      feedback: SummaryFeedback.fromJson(
        json['feedback'] as Map<String, dynamic>,
      ),
      question_count: (json['question_count'] as num).toInt(),
      important_moments:
          (json['important_moments'] as List<dynamic>?)
              ?.map((e) => SummaryImportant.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$SummaryImplToJson(_$SummaryImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'course': instance.course,
      'feedback': instance.feedback,
      'question_count': instance.question_count,
      'important_moments': instance.important_moments,
    };
