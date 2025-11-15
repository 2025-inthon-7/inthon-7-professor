// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summary_feedback.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SummaryFeedback _$SummaryFeedbackFromJson(Map<String, dynamic> json) {
  return _SummaryFeedback.fromJson(json);
}

/// @nodoc
mixin _$SummaryFeedback {
  int get ok => throw _privateConstructorUsedError;
  int get hard => throw _privateConstructorUsedError;

  /// Serializes this SummaryFeedback to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SummaryFeedback
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SummaryFeedbackCopyWith<SummaryFeedback> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SummaryFeedbackCopyWith<$Res> {
  factory $SummaryFeedbackCopyWith(
    SummaryFeedback value,
    $Res Function(SummaryFeedback) then,
  ) = _$SummaryFeedbackCopyWithImpl<$Res, SummaryFeedback>;
  @useResult
  $Res call({int ok, int hard});
}

/// @nodoc
class _$SummaryFeedbackCopyWithImpl<$Res, $Val extends SummaryFeedback>
    implements $SummaryFeedbackCopyWith<$Res> {
  _$SummaryFeedbackCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SummaryFeedback
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? ok = null, Object? hard = null}) {
    return _then(
      _value.copyWith(
            ok: null == ok
                ? _value.ok
                : ok // ignore: cast_nullable_to_non_nullable
                      as int,
            hard: null == hard
                ? _value.hard
                : hard // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SummaryFeedbackImplCopyWith<$Res>
    implements $SummaryFeedbackCopyWith<$Res> {
  factory _$$SummaryFeedbackImplCopyWith(
    _$SummaryFeedbackImpl value,
    $Res Function(_$SummaryFeedbackImpl) then,
  ) = __$$SummaryFeedbackImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int ok, int hard});
}

/// @nodoc
class __$$SummaryFeedbackImplCopyWithImpl<$Res>
    extends _$SummaryFeedbackCopyWithImpl<$Res, _$SummaryFeedbackImpl>
    implements _$$SummaryFeedbackImplCopyWith<$Res> {
  __$$SummaryFeedbackImplCopyWithImpl(
    _$SummaryFeedbackImpl _value,
    $Res Function(_$SummaryFeedbackImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SummaryFeedback
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? ok = null, Object? hard = null}) {
    return _then(
      _$SummaryFeedbackImpl(
        ok: null == ok
            ? _value.ok
            : ok // ignore: cast_nullable_to_non_nullable
                  as int,
        hard: null == hard
            ? _value.hard
            : hard // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SummaryFeedbackImpl implements _SummaryFeedback {
  _$SummaryFeedbackImpl({required this.ok, required this.hard});

  factory _$SummaryFeedbackImpl.fromJson(Map<String, dynamic> json) =>
      _$$SummaryFeedbackImplFromJson(json);

  @override
  final int ok;
  @override
  final int hard;

  @override
  String toString() {
    return 'SummaryFeedback(ok: $ok, hard: $hard)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SummaryFeedbackImpl &&
            (identical(other.ok, ok) || other.ok == ok) &&
            (identical(other.hard, hard) || other.hard == hard));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ok, hard);

  /// Create a copy of SummaryFeedback
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SummaryFeedbackImplCopyWith<_$SummaryFeedbackImpl> get copyWith =>
      __$$SummaryFeedbackImplCopyWithImpl<_$SummaryFeedbackImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SummaryFeedbackImplToJson(this);
  }
}

abstract class _SummaryFeedback implements SummaryFeedback {
  factory _SummaryFeedback({required final int ok, required final int hard}) =
      _$SummaryFeedbackImpl;

  factory _SummaryFeedback.fromJson(Map<String, dynamic> json) =
      _$SummaryFeedbackImpl.fromJson;

  @override
  int get ok;
  @override
  int get hard;

  /// Create a copy of SummaryFeedback
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SummaryFeedbackImplCopyWith<_$SummaryFeedbackImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
