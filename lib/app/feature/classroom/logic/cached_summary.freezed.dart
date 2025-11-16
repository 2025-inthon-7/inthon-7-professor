// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cached_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CachedSummary _$CachedSummaryFromJson(Map<String, dynamic> json) {
  return _CachedSummary.fromJson(json);
}

/// @nodoc
mixin _$CachedSummary {
  String get sessionId => throw _privateConstructorUsedError;
  Summary get summary => throw _privateConstructorUsedError;
  DateTime get cachedAt => throw _privateConstructorUsedError;

  /// Serializes this CachedSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CachedSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CachedSummaryCopyWith<CachedSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CachedSummaryCopyWith<$Res> {
  factory $CachedSummaryCopyWith(
    CachedSummary value,
    $Res Function(CachedSummary) then,
  ) = _$CachedSummaryCopyWithImpl<$Res, CachedSummary>;
  @useResult
  $Res call({String sessionId, Summary summary, DateTime cachedAt});

  $SummaryCopyWith<$Res> get summary;
}

/// @nodoc
class _$CachedSummaryCopyWithImpl<$Res, $Val extends CachedSummary>
    implements $CachedSummaryCopyWith<$Res> {
  _$CachedSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CachedSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? summary = null,
    Object? cachedAt = null,
  }) {
    return _then(
      _value.copyWith(
            sessionId: null == sessionId
                ? _value.sessionId
                : sessionId // ignore: cast_nullable_to_non_nullable
                      as String,
            summary: null == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as Summary,
            cachedAt: null == cachedAt
                ? _value.cachedAt
                : cachedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }

  /// Create a copy of CachedSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SummaryCopyWith<$Res> get summary {
    return $SummaryCopyWith<$Res>(_value.summary, (value) {
      return _then(_value.copyWith(summary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CachedSummaryImplCopyWith<$Res>
    implements $CachedSummaryCopyWith<$Res> {
  factory _$$CachedSummaryImplCopyWith(
    _$CachedSummaryImpl value,
    $Res Function(_$CachedSummaryImpl) then,
  ) = __$$CachedSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String sessionId, Summary summary, DateTime cachedAt});

  @override
  $SummaryCopyWith<$Res> get summary;
}

/// @nodoc
class __$$CachedSummaryImplCopyWithImpl<$Res>
    extends _$CachedSummaryCopyWithImpl<$Res, _$CachedSummaryImpl>
    implements _$$CachedSummaryImplCopyWith<$Res> {
  __$$CachedSummaryImplCopyWithImpl(
    _$CachedSummaryImpl _value,
    $Res Function(_$CachedSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CachedSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? summary = null,
    Object? cachedAt = null,
  }) {
    return _then(
      _$CachedSummaryImpl(
        sessionId: null == sessionId
            ? _value.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as String,
        summary: null == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as Summary,
        cachedAt: null == cachedAt
            ? _value.cachedAt
            : cachedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CachedSummaryImpl implements _CachedSummary {
  _$CachedSummaryImpl({
    required this.sessionId,
    required this.summary,
    required this.cachedAt,
  });

  factory _$CachedSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CachedSummaryImplFromJson(json);

  @override
  final String sessionId;
  @override
  final Summary summary;
  @override
  final DateTime cachedAt;

  @override
  String toString() {
    return 'CachedSummary(sessionId: $sessionId, summary: $summary, cachedAt: $cachedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CachedSummaryImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.cachedAt, cachedAt) ||
                other.cachedAt == cachedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, sessionId, summary, cachedAt);

  /// Create a copy of CachedSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CachedSummaryImplCopyWith<_$CachedSummaryImpl> get copyWith =>
      __$$CachedSummaryImplCopyWithImpl<_$CachedSummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CachedSummaryImplToJson(this);
  }
}

abstract class _CachedSummary implements CachedSummary {
  factory _CachedSummary({
    required final String sessionId,
    required final Summary summary,
    required final DateTime cachedAt,
  }) = _$CachedSummaryImpl;

  factory _CachedSummary.fromJson(Map<String, dynamic> json) =
      _$CachedSummaryImpl.fromJson;

  @override
  String get sessionId;
  @override
  Summary get summary;
  @override
  DateTime get cachedAt;

  /// Create a copy of CachedSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CachedSummaryImplCopyWith<_$CachedSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
