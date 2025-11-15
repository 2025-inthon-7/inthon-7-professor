// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

EventType _$EventTypeFromJson(Map<String, dynamic> json) {
  return _EventType.fromJson(json);
}

/// @nodoc
mixin _$EventType {
  EType get type => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  /// Serializes this EventType to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventTypeCopyWith<EventType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventTypeCopyWith<$Res> {
  factory $EventTypeCopyWith(EventType value, $Res Function(EventType) then) =
      _$EventTypeCopyWithImpl<$Res, EventType>;
  @useResult
  $Res call({EType type, String content});
}

/// @nodoc
class _$EventTypeCopyWithImpl<$Res, $Val extends EventType>
    implements $EventTypeCopyWith<$Res> {
  _$EventTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? type = null, Object? content = null}) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as EType,
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EventTypeImplCopyWith<$Res>
    implements $EventTypeCopyWith<$Res> {
  factory _$$EventTypeImplCopyWith(
    _$EventTypeImpl value,
    $Res Function(_$EventTypeImpl) then,
  ) = __$$EventTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({EType type, String content});
}

/// @nodoc
class __$$EventTypeImplCopyWithImpl<$Res>
    extends _$EventTypeCopyWithImpl<$Res, _$EventTypeImpl>
    implements _$$EventTypeImplCopyWith<$Res> {
  __$$EventTypeImplCopyWithImpl(
    _$EventTypeImpl _value,
    $Res Function(_$EventTypeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EventType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? type = null, Object? content = null}) {
    return _then(
      _$EventTypeImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as EType,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EventTypeImpl implements _EventType {
  _$EventTypeImpl({required this.type, required this.content});

  factory _$EventTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventTypeImplFromJson(json);

  @override
  final EType type;
  @override
  final String content;

  @override
  String toString() {
    return 'EventType(type: $type, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventTypeImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, content);

  /// Create a copy of EventType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventTypeImplCopyWith<_$EventTypeImpl> get copyWith =>
      __$$EventTypeImplCopyWithImpl<_$EventTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventTypeImplToJson(this);
  }
}

abstract class _EventType implements EventType {
  factory _EventType({
    required final EType type,
    required final String content,
  }) = _$EventTypeImpl;

  factory _EventType.fromJson(Map<String, dynamic> json) =
      _$EventTypeImpl.fromJson;

  @override
  EType get type;
  @override
  String get content;

  /// Create a copy of EventType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventTypeImplCopyWith<_$EventTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
