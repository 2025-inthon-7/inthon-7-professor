// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

HomeState _$HomeStateFromJson(Map<String, dynamic> json) {
  return _HomeState.fromJson(json);
}

/// @nodoc
mixin _$HomeState {
  List<Course> get cources => throw _privateConstructorUsedError;
  Course? get selectedCourse => throw _privateConstructorUsedError;
  String get classSearchValue => throw _privateConstructorUsedError;
  bool get isStartingClass => throw _privateConstructorUsedError;

  /// Serializes this HomeState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call({
    List<Course> cources,
    Course? selectedCourse,
    String classSearchValue,
    bool isStartingClass,
  });

  $CourseCopyWith<$Res>? get selectedCourse;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cources = null,
    Object? selectedCourse = freezed,
    Object? classSearchValue = null,
    Object? isStartingClass = null,
  }) {
    return _then(
      _value.copyWith(
            cources: null == cources
                ? _value.cources
                : cources // ignore: cast_nullable_to_non_nullable
                      as List<Course>,
            selectedCourse: freezed == selectedCourse
                ? _value.selectedCourse
                : selectedCourse // ignore: cast_nullable_to_non_nullable
                      as Course?,
            classSearchValue: null == classSearchValue
                ? _value.classSearchValue
                : classSearchValue // ignore: cast_nullable_to_non_nullable
                      as String,
            isStartingClass: null == isStartingClass
                ? _value.isStartingClass
                : isStartingClass // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CourseCopyWith<$Res>? get selectedCourse {
    if (_value.selectedCourse == null) {
      return null;
    }

    return $CourseCopyWith<$Res>(_value.selectedCourse!, (value) {
      return _then(_value.copyWith(selectedCourse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
    _$HomeStateImpl value,
    $Res Function(_$HomeStateImpl) then,
  ) = __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Course> cources,
    Course? selectedCourse,
    String classSearchValue,
    bool isStartingClass,
  });

  @override
  $CourseCopyWith<$Res>? get selectedCourse;
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
    _$HomeStateImpl _value,
    $Res Function(_$HomeStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cources = null,
    Object? selectedCourse = freezed,
    Object? classSearchValue = null,
    Object? isStartingClass = null,
  }) {
    return _then(
      _$HomeStateImpl(
        cources: null == cources
            ? _value._cources
            : cources // ignore: cast_nullable_to_non_nullable
                  as List<Course>,
        selectedCourse: freezed == selectedCourse
            ? _value.selectedCourse
            : selectedCourse // ignore: cast_nullable_to_non_nullable
                  as Course?,
        classSearchValue: null == classSearchValue
            ? _value.classSearchValue
            : classSearchValue // ignore: cast_nullable_to_non_nullable
                  as String,
        isStartingClass: null == isStartingClass
            ? _value.isStartingClass
            : isStartingClass // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeStateImpl implements _HomeState {
  _$HomeStateImpl({
    final List<Course> cources = const [],
    this.selectedCourse,
    this.classSearchValue = '',
    this.isStartingClass = false,
  }) : _cources = cources;

  factory _$HomeStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeStateImplFromJson(json);

  final List<Course> _cources;
  @override
  @JsonKey()
  List<Course> get cources {
    if (_cources is EqualUnmodifiableListView) return _cources;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cources);
  }

  @override
  final Course? selectedCourse;
  @override
  @JsonKey()
  final String classSearchValue;
  @override
  @JsonKey()
  final bool isStartingClass;

  @override
  String toString() {
    return 'HomeState(cources: $cources, selectedCourse: $selectedCourse, classSearchValue: $classSearchValue, isStartingClass: $isStartingClass)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            const DeepCollectionEquality().equals(other._cources, _cources) &&
            (identical(other.selectedCourse, selectedCourse) ||
                other.selectedCourse == selectedCourse) &&
            (identical(other.classSearchValue, classSearchValue) ||
                other.classSearchValue == classSearchValue) &&
            (identical(other.isStartingClass, isStartingClass) ||
                other.isStartingClass == isStartingClass));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_cources),
    selectedCourse,
    classSearchValue,
    isStartingClass,
  );

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeStateImplToJson(this);
  }
}

abstract class _HomeState implements HomeState {
  factory _HomeState({
    final List<Course> cources,
    final Course? selectedCourse,
    final String classSearchValue,
    final bool isStartingClass,
  }) = _$HomeStateImpl;

  factory _HomeState.fromJson(Map<String, dynamic> json) =
      _$HomeStateImpl.fromJson;

  @override
  List<Course> get cources;
  @override
  Course? get selectedCourse;
  @override
  String get classSearchValue;
  @override
  bool get isStartingClass;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
