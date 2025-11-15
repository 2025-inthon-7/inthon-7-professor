// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Summary _$SummaryFromJson(Map<String, dynamic> json) {
  return _Summary.fromJson(json);
}

/// @nodoc
mixin _$Summary {
  DateTime get date => throw _privateConstructorUsedError;
  Course get course => throw _privateConstructorUsedError;
  SummaryFeedback get feedback => throw _privateConstructorUsedError;
  int get question_count => throw _privateConstructorUsedError;
  List<SummaryImportant> get important_moments =>
      throw _privateConstructorUsedError;

  /// Serializes this Summary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Summary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SummaryCopyWith<Summary> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SummaryCopyWith<$Res> {
  factory $SummaryCopyWith(Summary value, $Res Function(Summary) then) =
      _$SummaryCopyWithImpl<$Res, Summary>;
  @useResult
  $Res call({
    DateTime date,
    Course course,
    SummaryFeedback feedback,
    int question_count,
    List<SummaryImportant> important_moments,
  });

  $CourseCopyWith<$Res> get course;
  $SummaryFeedbackCopyWith<$Res> get feedback;
}

/// @nodoc
class _$SummaryCopyWithImpl<$Res, $Val extends Summary>
    implements $SummaryCopyWith<$Res> {
  _$SummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Summary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? course = null,
    Object? feedback = null,
    Object? question_count = null,
    Object? important_moments = null,
  }) {
    return _then(
      _value.copyWith(
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            course: null == course
                ? _value.course
                : course // ignore: cast_nullable_to_non_nullable
                      as Course,
            feedback: null == feedback
                ? _value.feedback
                : feedback // ignore: cast_nullable_to_non_nullable
                      as SummaryFeedback,
            question_count: null == question_count
                ? _value.question_count
                : question_count // ignore: cast_nullable_to_non_nullable
                      as int,
            important_moments: null == important_moments
                ? _value.important_moments
                : important_moments // ignore: cast_nullable_to_non_nullable
                      as List<SummaryImportant>,
          )
          as $Val,
    );
  }

  /// Create a copy of Summary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CourseCopyWith<$Res> get course {
    return $CourseCopyWith<$Res>(_value.course, (value) {
      return _then(_value.copyWith(course: value) as $Val);
    });
  }

  /// Create a copy of Summary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SummaryFeedbackCopyWith<$Res> get feedback {
    return $SummaryFeedbackCopyWith<$Res>(_value.feedback, (value) {
      return _then(_value.copyWith(feedback: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SummaryImplCopyWith<$Res> implements $SummaryCopyWith<$Res> {
  factory _$$SummaryImplCopyWith(
    _$SummaryImpl value,
    $Res Function(_$SummaryImpl) then,
  ) = __$$SummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DateTime date,
    Course course,
    SummaryFeedback feedback,
    int question_count,
    List<SummaryImportant> important_moments,
  });

  @override
  $CourseCopyWith<$Res> get course;
  @override
  $SummaryFeedbackCopyWith<$Res> get feedback;
}

/// @nodoc
class __$$SummaryImplCopyWithImpl<$Res>
    extends _$SummaryCopyWithImpl<$Res, _$SummaryImpl>
    implements _$$SummaryImplCopyWith<$Res> {
  __$$SummaryImplCopyWithImpl(
    _$SummaryImpl _value,
    $Res Function(_$SummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Summary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? course = null,
    Object? feedback = null,
    Object? question_count = null,
    Object? important_moments = null,
  }) {
    return _then(
      _$SummaryImpl(
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        course: null == course
            ? _value.course
            : course // ignore: cast_nullable_to_non_nullable
                  as Course,
        feedback: null == feedback
            ? _value.feedback
            : feedback // ignore: cast_nullable_to_non_nullable
                  as SummaryFeedback,
        question_count: null == question_count
            ? _value.question_count
            : question_count // ignore: cast_nullable_to_non_nullable
                  as int,
        important_moments: null == important_moments
            ? _value._important_moments
            : important_moments // ignore: cast_nullable_to_non_nullable
                  as List<SummaryImportant>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SummaryImpl implements _Summary {
  _$SummaryImpl({
    required this.date,
    required this.course,
    required this.feedback,
    required this.question_count,
    final List<SummaryImportant> important_moments = const [],
  }) : _important_moments = important_moments;

  factory _$SummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$SummaryImplFromJson(json);

  @override
  final DateTime date;
  @override
  final Course course;
  @override
  final SummaryFeedback feedback;
  @override
  final int question_count;
  final List<SummaryImportant> _important_moments;
  @override
  @JsonKey()
  List<SummaryImportant> get important_moments {
    if (_important_moments is EqualUnmodifiableListView)
      return _important_moments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_important_moments);
  }

  @override
  String toString() {
    return 'Summary(date: $date, course: $course, feedback: $feedback, question_count: $question_count, important_moments: $important_moments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SummaryImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.course, course) || other.course == course) &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback) &&
            (identical(other.question_count, question_count) ||
                other.question_count == question_count) &&
            const DeepCollectionEquality().equals(
              other._important_moments,
              _important_moments,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    date,
    course,
    feedback,
    question_count,
    const DeepCollectionEquality().hash(_important_moments),
  );

  /// Create a copy of Summary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SummaryImplCopyWith<_$SummaryImpl> get copyWith =>
      __$$SummaryImplCopyWithImpl<_$SummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SummaryImplToJson(this);
  }
}

abstract class _Summary implements Summary {
  factory _Summary({
    required final DateTime date,
    required final Course course,
    required final SummaryFeedback feedback,
    required final int question_count,
    final List<SummaryImportant> important_moments,
  }) = _$SummaryImpl;

  factory _Summary.fromJson(Map<String, dynamic> json) = _$SummaryImpl.fromJson;

  @override
  DateTime get date;
  @override
  Course get course;
  @override
  SummaryFeedback get feedback;
  @override
  int get question_count;
  @override
  List<SummaryImportant> get important_moments;

  /// Create a copy of Summary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SummaryImplCopyWith<_$SummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
