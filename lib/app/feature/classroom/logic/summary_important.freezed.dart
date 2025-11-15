// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summary_important.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SummaryImportant _$SummaryImportantFromJson(Map<String, dynamic> json) {
  return _SummaryImportant.fromJson(json);
}

/// @nodoc
mixin _$SummaryImportant {
  int get id => throw _privateConstructorUsedError;
  String get trigger => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;
  String? get capture_url => throw _privateConstructorUsedError;
  DateTime get created_at => throw _privateConstructorUsedError;
  int? get question_id => throw _privateConstructorUsedError;
  bool get is_hardest => throw _privateConstructorUsedError;

  /// Serializes this SummaryImportant to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SummaryImportant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SummaryImportantCopyWith<SummaryImportant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SummaryImportantCopyWith<$Res> {
  factory $SummaryImportantCopyWith(
    SummaryImportant value,
    $Res Function(SummaryImportant) then,
  ) = _$SummaryImportantCopyWithImpl<$Res, SummaryImportant>;
  @useResult
  $Res call({
    int id,
    String trigger,
    String note,
    String? capture_url,
    DateTime created_at,
    int? question_id,
    bool is_hardest,
  });
}

/// @nodoc
class _$SummaryImportantCopyWithImpl<$Res, $Val extends SummaryImportant>
    implements $SummaryImportantCopyWith<$Res> {
  _$SummaryImportantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SummaryImportant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? trigger = null,
    Object? note = null,
    Object? capture_url = freezed,
    Object? created_at = null,
    Object? question_id = freezed,
    Object? is_hardest = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            trigger: null == trigger
                ? _value.trigger
                : trigger // ignore: cast_nullable_to_non_nullable
                      as String,
            note: null == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as String,
            capture_url: freezed == capture_url
                ? _value.capture_url
                : capture_url // ignore: cast_nullable_to_non_nullable
                      as String?,
            created_at: null == created_at
                ? _value.created_at
                : created_at // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            question_id: freezed == question_id
                ? _value.question_id
                : question_id // ignore: cast_nullable_to_non_nullable
                      as int?,
            is_hardest: null == is_hardest
                ? _value.is_hardest
                : is_hardest // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SummaryImportantImplCopyWith<$Res>
    implements $SummaryImportantCopyWith<$Res> {
  factory _$$SummaryImportantImplCopyWith(
    _$SummaryImportantImpl value,
    $Res Function(_$SummaryImportantImpl) then,
  ) = __$$SummaryImportantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String trigger,
    String note,
    String? capture_url,
    DateTime created_at,
    int? question_id,
    bool is_hardest,
  });
}

/// @nodoc
class __$$SummaryImportantImplCopyWithImpl<$Res>
    extends _$SummaryImportantCopyWithImpl<$Res, _$SummaryImportantImpl>
    implements _$$SummaryImportantImplCopyWith<$Res> {
  __$$SummaryImportantImplCopyWithImpl(
    _$SummaryImportantImpl _value,
    $Res Function(_$SummaryImportantImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SummaryImportant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? trigger = null,
    Object? note = null,
    Object? capture_url = freezed,
    Object? created_at = null,
    Object? question_id = freezed,
    Object? is_hardest = null,
  }) {
    return _then(
      _$SummaryImportantImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        trigger: null == trigger
            ? _value.trigger
            : trigger // ignore: cast_nullable_to_non_nullable
                  as String,
        note: null == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String,
        capture_url: freezed == capture_url
            ? _value.capture_url
            : capture_url // ignore: cast_nullable_to_non_nullable
                  as String?,
        created_at: null == created_at
            ? _value.created_at
            : created_at // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        question_id: freezed == question_id
            ? _value.question_id
            : question_id // ignore: cast_nullable_to_non_nullable
                  as int?,
        is_hardest: null == is_hardest
            ? _value.is_hardest
            : is_hardest // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SummaryImportantImpl implements _SummaryImportant {
  _$SummaryImportantImpl({
    required this.id,
    required this.trigger,
    this.note = "",
    this.capture_url,
    required this.created_at,
    this.question_id,
    this.is_hardest = false,
  });

  factory _$SummaryImportantImpl.fromJson(Map<String, dynamic> json) =>
      _$$SummaryImportantImplFromJson(json);

  @override
  final int id;
  @override
  final String trigger;
  @override
  @JsonKey()
  final String note;
  @override
  final String? capture_url;
  @override
  final DateTime created_at;
  @override
  final int? question_id;
  @override
  @JsonKey()
  final bool is_hardest;

  @override
  String toString() {
    return 'SummaryImportant(id: $id, trigger: $trigger, note: $note, capture_url: $capture_url, created_at: $created_at, question_id: $question_id, is_hardest: $is_hardest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SummaryImportantImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.trigger, trigger) || other.trigger == trigger) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.capture_url, capture_url) ||
                other.capture_url == capture_url) &&
            (identical(other.created_at, created_at) ||
                other.created_at == created_at) &&
            (identical(other.question_id, question_id) ||
                other.question_id == question_id) &&
            (identical(other.is_hardest, is_hardest) ||
                other.is_hardest == is_hardest));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    trigger,
    note,
    capture_url,
    created_at,
    question_id,
    is_hardest,
  );

  /// Create a copy of SummaryImportant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SummaryImportantImplCopyWith<_$SummaryImportantImpl> get copyWith =>
      __$$SummaryImportantImplCopyWithImpl<_$SummaryImportantImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SummaryImportantImplToJson(this);
  }
}

abstract class _SummaryImportant implements SummaryImportant {
  factory _SummaryImportant({
    required final int id,
    required final String trigger,
    final String note,
    final String? capture_url,
    required final DateTime created_at,
    final int? question_id,
    final bool is_hardest,
  }) = _$SummaryImportantImpl;

  factory _SummaryImportant.fromJson(Map<String, dynamic> json) =
      _$SummaryImportantImpl.fromJson;

  @override
  int get id;
  @override
  String get trigger;
  @override
  String get note;
  @override
  String? get capture_url;
  @override
  DateTime get created_at;
  @override
  int? get question_id;
  @override
  bool get is_hardest;

  /// Create a copy of SummaryImportant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SummaryImportantImplCopyWith<_$SummaryImportantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
