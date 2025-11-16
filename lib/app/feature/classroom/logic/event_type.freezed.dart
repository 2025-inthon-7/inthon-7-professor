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
  DateTime get timestamp => throw _privateConstructorUsedError;
  List<int> get imageData => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  int? get question_id => throw _privateConstructorUsedError;

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
  $Res call({
    EType type,
    String content,
    DateTime timestamp,
    List<int> imageData,
    int count,
    int? question_id,
  });
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
  $Res call({
    Object? type = null,
    Object? content = null,
    Object? timestamp = null,
    Object? imageData = null,
    Object? count = null,
    Object? question_id = freezed,
  }) {
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
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            imageData: null == imageData
                ? _value.imageData
                : imageData // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            count: null == count
                ? _value.count
                : count // ignore: cast_nullable_to_non_nullable
                      as int,
            question_id: freezed == question_id
                ? _value.question_id
                : question_id // ignore: cast_nullable_to_non_nullable
                      as int?,
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
  $Res call({
    EType type,
    String content,
    DateTime timestamp,
    List<int> imageData,
    int count,
    int? question_id,
  });
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
  $Res call({
    Object? type = null,
    Object? content = null,
    Object? timestamp = null,
    Object? imageData = null,
    Object? count = null,
    Object? question_id = freezed,
  }) {
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
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        imageData: null == imageData
            ? _value._imageData
            : imageData // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        count: null == count
            ? _value.count
            : count // ignore: cast_nullable_to_non_nullable
                  as int,
        question_id: freezed == question_id
            ? _value.question_id
            : question_id // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EventTypeImpl implements _EventType {
  _$EventTypeImpl({
    required this.type,
    required this.content,
    required this.timestamp,
    final List<int> imageData = const [],
    this.count = 1,
    this.question_id,
  }) : _imageData = imageData;

  factory _$EventTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventTypeImplFromJson(json);

  @override
  final EType type;
  @override
  final String content;
  @override
  final DateTime timestamp;
  final List<int> _imageData;
  @override
  @JsonKey()
  List<int> get imageData {
    if (_imageData is EqualUnmodifiableListView) return _imageData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageData);
  }

  @override
  @JsonKey()
  final int count;
  @override
  final int? question_id;

  @override
  String toString() {
    return 'EventType(type: $type, content: $content, timestamp: $timestamp, imageData: $imageData, count: $count, question_id: $question_id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventTypeImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality().equals(
              other._imageData,
              _imageData,
            ) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.question_id, question_id) ||
                other.question_id == question_id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    type,
    content,
    timestamp,
    const DeepCollectionEquality().hash(_imageData),
    count,
    question_id,
  );

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
    required final DateTime timestamp,
    final List<int> imageData,
    final int count,
    final int? question_id,
  }) = _$EventTypeImpl;

  factory _EventType.fromJson(Map<String, dynamic> json) =
      _$EventTypeImpl.fromJson;

  @override
  EType get type;
  @override
  String get content;
  @override
  DateTime get timestamp;
  @override
  List<int> get imageData;
  @override
  int get count;
  @override
  int? get question_id;

  /// Create a copy of EventType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventTypeImplCopyWith<_$EventTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
