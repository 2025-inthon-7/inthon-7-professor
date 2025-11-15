// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pip_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PipState _$PipStateFromJson(Map<String, dynamic> json) {
  return _PipState.fromJson(json);
}

/// @nodoc
mixin _$PipState {
  bool get isInPipMode => throw _privateConstructorUsedError;

  /// Serializes this PipState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PipState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PipStateCopyWith<PipState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PipStateCopyWith<$Res> {
  factory $PipStateCopyWith(PipState value, $Res Function(PipState) then) =
      _$PipStateCopyWithImpl<$Res, PipState>;
  @useResult
  $Res call({bool isInPipMode});
}

/// @nodoc
class _$PipStateCopyWithImpl<$Res, $Val extends PipState>
    implements $PipStateCopyWith<$Res> {
  _$PipStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PipState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isInPipMode = null}) {
    return _then(
      _value.copyWith(
            isInPipMode: null == isInPipMode
                ? _value.isInPipMode
                : isInPipMode // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PipStateImplCopyWith<$Res>
    implements $PipStateCopyWith<$Res> {
  factory _$$PipStateImplCopyWith(
    _$PipStateImpl value,
    $Res Function(_$PipStateImpl) then,
  ) = __$$PipStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isInPipMode});
}

/// @nodoc
class __$$PipStateImplCopyWithImpl<$Res>
    extends _$PipStateCopyWithImpl<$Res, _$PipStateImpl>
    implements _$$PipStateImplCopyWith<$Res> {
  __$$PipStateImplCopyWithImpl(
    _$PipStateImpl _value,
    $Res Function(_$PipStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PipState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isInPipMode = null}) {
    return _then(
      _$PipStateImpl(
        isInPipMode: null == isInPipMode
            ? _value.isInPipMode
            : isInPipMode // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PipStateImpl implements _PipState {
  _$PipStateImpl({required this.isInPipMode});

  factory _$PipStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$PipStateImplFromJson(json);

  @override
  final bool isInPipMode;

  @override
  String toString() {
    return 'PipState(isInPipMode: $isInPipMode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PipStateImpl &&
            (identical(other.isInPipMode, isInPipMode) ||
                other.isInPipMode == isInPipMode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isInPipMode);

  /// Create a copy of PipState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PipStateImplCopyWith<_$PipStateImpl> get copyWith =>
      __$$PipStateImplCopyWithImpl<_$PipStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PipStateImplToJson(this);
  }
}

abstract class _PipState implements PipState {
  factory _PipState({required final bool isInPipMode}) = _$PipStateImpl;

  factory _PipState.fromJson(Map<String, dynamic> json) =
      _$PipStateImpl.fromJson;

  @override
  bool get isInPipMode;

  /// Create a copy of PipState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PipStateImplCopyWith<_$PipStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
