// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CourseSession _$CourseSessionFromJson(Map<String, dynamic> json) {
  return _CourseSession.fromJson(json);
}

/// @nodoc
mixin _$CourseSession {
  String get id => throw _privateConstructorUsedError;
  Course get course => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  bool get is_active => throw _privateConstructorUsedError;

  /// Serializes this CourseSession to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CourseSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CourseSessionCopyWith<CourseSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseSessionCopyWith<$Res> {
  factory $CourseSessionCopyWith(
    CourseSession value,
    $Res Function(CourseSession) then,
  ) = _$CourseSessionCopyWithImpl<$Res, CourseSession>;
  @useResult
  $Res call({String id, Course course, String date, bool is_active});

  $CourseCopyWith<$Res> get course;
}

/// @nodoc
class _$CourseSessionCopyWithImpl<$Res, $Val extends CourseSession>
    implements $CourseSessionCopyWith<$Res> {
  _$CourseSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CourseSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? course = null,
    Object? date = null,
    Object? is_active = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            course: null == course
                ? _value.course
                : course // ignore: cast_nullable_to_non_nullable
                      as Course,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as String,
            is_active: null == is_active
                ? _value.is_active
                : is_active // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }

  /// Create a copy of CourseSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CourseCopyWith<$Res> get course {
    return $CourseCopyWith<$Res>(_value.course, (value) {
      return _then(_value.copyWith(course: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CourseSessionImplCopyWith<$Res>
    implements $CourseSessionCopyWith<$Res> {
  factory _$$CourseSessionImplCopyWith(
    _$CourseSessionImpl value,
    $Res Function(_$CourseSessionImpl) then,
  ) = __$$CourseSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, Course course, String date, bool is_active});

  @override
  $CourseCopyWith<$Res> get course;
}

/// @nodoc
class __$$CourseSessionImplCopyWithImpl<$Res>
    extends _$CourseSessionCopyWithImpl<$Res, _$CourseSessionImpl>
    implements _$$CourseSessionImplCopyWith<$Res> {
  __$$CourseSessionImplCopyWithImpl(
    _$CourseSessionImpl _value,
    $Res Function(_$CourseSessionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CourseSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? course = null,
    Object? date = null,
    Object? is_active = null,
  }) {
    return _then(
      _$CourseSessionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        course: null == course
            ? _value.course
            : course // ignore: cast_nullable_to_non_nullable
                  as Course,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as String,
        is_active: null == is_active
            ? _value.is_active
            : is_active // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseSessionImpl implements _CourseSession {
  _$CourseSessionImpl({
    required this.id,
    required this.course,
    required this.date,
    required this.is_active,
  });

  factory _$CourseSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseSessionImplFromJson(json);

  @override
  final String id;
  @override
  final Course course;
  @override
  final String date;
  @override
  final bool is_active;

  @override
  String toString() {
    return 'CourseSession(id: $id, course: $course, date: $date, is_active: $is_active)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseSessionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.course, course) || other.course == course) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.is_active, is_active) ||
                other.is_active == is_active));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, course, date, is_active);

  /// Create a copy of CourseSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseSessionImplCopyWith<_$CourseSessionImpl> get copyWith =>
      __$$CourseSessionImplCopyWithImpl<_$CourseSessionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseSessionImplToJson(this);
  }
}

abstract class _CourseSession implements CourseSession {
  factory _CourseSession({
    required final String id,
    required final Course course,
    required final String date,
    required final bool is_active,
  }) = _$CourseSessionImpl;

  factory _CourseSession.fromJson(Map<String, dynamic> json) =
      _$CourseSessionImpl.fromJson;

  @override
  String get id;
  @override
  Course get course;
  @override
  String get date;
  @override
  bool get is_active;

  /// Create a copy of CourseSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseSessionImplCopyWith<_$CourseSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
