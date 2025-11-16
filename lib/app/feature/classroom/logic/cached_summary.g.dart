// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cached_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CachedSummaryImpl _$$CachedSummaryImplFromJson(Map<String, dynamic> json) =>
    _$CachedSummaryImpl(
      sessionId: json['sessionId'] as String,
      summary: Summary.fromJson(json['summary'] as Map<String, dynamic>),
      cachedAt: DateTime.parse(json['cachedAt'] as String),
    );

Map<String, dynamic> _$$CachedSummaryImplToJson(_$CachedSummaryImpl instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'summary': instance.summary,
      'cachedAt': instance.cachedAt.toIso8601String(),
    };
