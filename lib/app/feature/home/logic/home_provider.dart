import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inthon_7_professor/app/api/api_service.dart';
import 'package:inthon_7_professor/app/feature/home/logic/home_state.dart';
import 'package:inthon_7_professor/app/model/course.dart';
import 'package:inthon_7_professor/app/service/screen_capture_service.dart';

final homeProvider = NotifierProvider<HomeProvider, HomeState>(
  HomeProvider.new,
);

class HomeProvider extends Notifier<HomeState> {
  @override
  build() {
    return HomeState();
  }

  void getCources() async {
    final res = await ApiService.I.getCourses();
    res.fold(
      onSuccess: (data) {
        state = state.copyWith(cources: data);
      },
      onFailure: (error) {
        log('getCourses error: $error');
      },
    );
  }

  void onSearchClassName(String searchValue) {
    log('onSearchClassName: $searchValue');
    state = state.copyWith(classSearchValue: searchValue);
  }

  void onSelectCourse(Course course) {
    state = state.copyWith(selectedCourse: course);
  }

  Future<bool> startClass() async {
    state = state.copyWith(isStartingClass: true);
    final service = ScreenCaptureService.I;
    final success = await service.startScreenCapture();
    await Future.delayed(const Duration(milliseconds: 10));
    state = state.copyWith(isStartingClass: false);
    return success;
  }

  void reSelectScreen() async {
    final service = ScreenCaptureService.I;
    service.stopScreenCapture();
    await service.startScreenCapture();
    await Future.delayed(const Duration(milliseconds: 10));
  }

  Future<Uint8List?> getCapturedScreen() async {
    final service = ScreenCaptureService.I;
    return await service.captureFrame();
  }

  void sendImportantNotification() {}

  void endClass() {
    final service = ScreenCaptureService.I;
    service.stopScreenCapture();
    state = state.copyWith(selectedCourse: null, classSearchValue: '');
  }
}
