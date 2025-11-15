// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventStateImpl _$$EventStateImplFromJson(Map<String, dynamic> json) =>
    _$EventStateImpl(
      events: (json['events'] as List<dynamic>)
          .map((e) => EventType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$EventStateImplToJson(_$EventStateImpl instance) =>
    <String, dynamic>{'events': instance.events};
