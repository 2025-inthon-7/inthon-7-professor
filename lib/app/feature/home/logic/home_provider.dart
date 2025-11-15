import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inthon_7_professor/app/feature/home/logic/home_state.dart';
import 'package:inthon_7_professor/app/service/screen_capture_service.dart';

final homeProvider = NotifierProvider<HomeProvider, HomeState>(
  HomeProvider.new,
);

class HomeProvider extends Notifier<HomeState> {
  late ScreenCaptureService service;

  @override
  build() {
    return HomeState();
  }

  void onSearchClassName(String searchValue) {
    log('onSearchClassName: $searchValue');
    state = state.copyWith(classSearchValue: searchValue);
  }

  void onSelectClassName(String className) {
    log('onSelectClassName: $className');
    state = state.copyWith(className: className);
  }

  Future<bool> startClass() async {
    state = state.copyWith(isStartingClass: true);
    service = ScreenCaptureService();
    final success = await service.startScreenCapture();
    await Future.delayed(const Duration(milliseconds: 10));
    state = state.copyWith(isStartingClass: false);
    return success;
  }

  void reSelectScreen() async {
    service.stopScreenCapture();
    await service.startScreenCapture();
    await Future.delayed(const Duration(milliseconds: 10));
  }

  Future<Uint8List?> getCapturedScreen() async {
    return await service.captureFrame();
  }

  void sendImportantNotification() {}

  void endClass() {
    service.stopScreenCapture();
    state = state.copyWith(className: '', classSearchValue: '');
  }
}
