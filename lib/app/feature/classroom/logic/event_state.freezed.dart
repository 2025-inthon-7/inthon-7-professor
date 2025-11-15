// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

EventState _$EventStateFromJson(Map<String, dynamic> json) {
  return _EventState.fromJson(json);
}

/// @nodoc
mixin _$EventState {
  List<EventType> get events => throw _privateConstructorUsedError;

  /// Serializes this EventState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventStateCopyWith<EventState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventStateCopyWith<$Res> {
  factory $EventStateCopyWith(
    EventState value,
    $Res Function(EventState) then,
  ) = _$EventStateCopyWithImpl<$Res, EventState>;
  @useResult
  $Res call({List<EventType> events});
}

/// @nodoc
class _$EventStateCopyWithImpl<$Res, $Val extends EventState>
    implements $EventStateCopyWith<$Res> {
  _$EventStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? events = null}) {
    return _then(
      _value.copyWith(
            events: null == events
                ? _value.events
                : events // ignore: cast_nullable_to_non_nullable
                      as List<EventType>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EventStateImplCopyWith<$Res>
    implements $EventStateCopyWith<$Res> {
  factory _$$EventStateImplCopyWith(
    _$EventStateImpl value,
    $Res Function(_$EventStateImpl) then,
  ) = __$$EventStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<EventType> events});
}

/// @nodoc
class __$$EventStateImplCopyWithImpl<$Res>
    extends _$EventStateCopyWithImpl<$Res, _$EventStateImpl>
    implements _$$EventStateImplCopyWith<$Res> {
  __$$EventStateImplCopyWithImpl(
    _$EventStateImpl _value,
    $Res Function(_$EventStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EventState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? events = null}) {
    return _then(
      _$EventStateImpl(
        events: null == events
            ? _value._events
            : events // ignore: cast_nullable_to_non_nullable
                  as List<EventType>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EventStateImpl implements _EventState {
  _$EventStateImpl({required final List<EventType> events}) : _events = events;

  factory _$EventStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventStateImplFromJson(json);

  final List<EventType> _events;
  @override
  List<EventType> get events {
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  @override
  String toString() {
    return 'EventState(events: $events)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventStateImpl &&
            const DeepCollectionEquality().equals(other._events, _events));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_events));

  /// Create a copy of EventState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventStateImplCopyWith<_$EventStateImpl> get copyWith =>
      __$$EventStateImplCopyWithImpl<_$EventStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventStateImplToJson(this);
  }
}

abstract class _EventState implements EventState {
  factory _EventState({required final List<EventType> events}) =
      _$EventStateImpl;

  factory _EventState.fromJson(Map<String, dynamic> json) =
      _$EventStateImpl.fromJson;

  @override
  List<EventType> get events;

  /// Create a copy of EventState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventStateImplCopyWith<_$EventStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
