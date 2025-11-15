import 'package:dio/dio.dart';
import 'package:inthon_7_professor/app/api/dio_client.dart';
import 'package:inthon_7_professor/app/api/result.dart';
import 'package:inthon_7_professor/app/auth/auth_service.dart';
import 'package:get_it/get_it.dart';
import 'package:inthon_7_professor/app/model/course.dart';
import 'package:inthon_7_professor/app/model/course_session.dart';

class ApiService {
  static ApiService get I => GetIt.I<ApiService>();

  late final MyDio _dio;

  void setAuthService(AuthService authService) =>
      _dio.setAuthService(authService);

  ApiService() {
    _dio = MyDio(dio: Dio());
  }

  Future<Result<List<Course>>> getCourses() => _dio.get(
    '/courses',
    fromJson: (data) => [for (final item in data) Course.fromJson(item)],
  );

  Future<Result<CourseSession>> getTodayCourseSession(String courseId) =>
      _dio.get(
        '/api/courses/$courseId/today-session/',
        fromJson: (data) => CourseSession.fromJson(data),
      );
}
