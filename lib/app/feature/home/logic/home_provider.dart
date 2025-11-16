import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inthon_7_professor/app/api/api_service.dart';
import 'package:inthon_7_professor/app/feature/classroom/logic/cached_summary.dart';
import 'package:inthon_7_professor/app/feature/classroom/logic/event_provider.dart';
import 'package:inthon_7_professor/app/feature/classroom/logic/pip_provider.dart';
import 'package:inthon_7_professor/app/feature/classroom/logic/summary.dart';
import 'package:inthon_7_professor/app/feature/home/logic/home_state.dart';
import 'package:inthon_7_professor/app/model/course.dart';
import 'package:inthon_7_professor/app/routing/router_service.dart';
import 'package:inthon_7_professor/app/service/screen_capture_service.dart';
import 'package:inthon_7_professor/app/service/summary_cache_service.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:web_socket/web_socket.dart';

final homeProvider = NotifierProvider<HomeProvider, HomeState>(
  HomeProvider.new,
);

class HomeProvider extends Notifier<HomeState> {
  WebSocket? socket;

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

  void sendHardFeedback() async {
    final image = await ScreenCaptureService.I.captureFrame();
    if (image == null || state.currentCourseSession == null) return;
    log('Sending hard feedback with image size: ${image.length}');
    ApiService.I.sendHardFeedback(
      sessionId: state.currentCourseSession!.id,
      imageBytes: image,
    );
  }

  Future<bool> startClass() async {
    if (state.selectedCourse == null) return false;
    state = state.copyWith(isStartingClass: true);
    final service = ScreenCaptureService.I;
    final success = await service.startScreenCapture();
    final res = await ApiService.I.getTodayCourseSession(
      state.selectedCourse!.code,
    );
    state = state.copyWith(isStartingClass: false);
    return res.fold(
      onSuccess: (data) async {
        state = state.copyWith(currentCourseSession: data);
        socket = await WebSocket.connect(
          Uri.parse(
            'wss://inthon-njg.darkerai.com/ws/session/${data.id}/teacher/',
          ),
        );
        ref.read(eventProvider.notifier).listenSocket(socket);
        RouterService.I.showToast('수업이 성공적으로 시작되었습니다!');
        return success;
      },
      onFailure: (error) {
        log('getTodayCourseSession error: $error');
        service.stopScreenCapture();
        RouterService.I.showToast('수업 시작에 실패했습니다.');

        return false;
      },
    );
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

  void sendImportantNotification() async {
    final image = await ScreenCaptureService.I.captureFrame();
    if (image == null || state.currentCourseSession == null) return;
    ApiService.I.sendImportantNotification(
      sessionId: state.currentCourseSession!.id,
      imageBytes: image,
    );
  }

  void sendQuestionImage({required int id}) async {
    final image = await ScreenCaptureService.I.captureFrame();
    if (image == null || state.currentCourseSession == null) return;

    ApiService.I.sendQuestionImage(questionId: id, imageBytes: image);
  }

  Future<void> endClass() async {
    final service = ScreenCaptureService.I;
    service.stopScreenCapture();
    ref.read(pipProvider.notifier).closePIPMode();
    if (state.currentCourseSession != null) {
      await ApiService.I.endCourseSession(
        sessionId: state.currentCourseSession!.id,
      );
    }
    state = state.copyWith(selectedCourse: null, classSearchValue: '');
    socket?.close();
    socket = null;
    RouterService.I.showToast('수업이 종료되었습니다.');
  }

  Future<Summary?> getSummary(String sessionId) async {
    final res = await ApiService.I.getSummary(sessionId: sessionId);
    return res.fold(
      onSuccess: (data) async {
        // Cache the summary
        final cachedSummary = CachedSummary(
          sessionId: sessionId,
          summary: data,
          cachedAt: DateTime.now(),
        );
        await SummaryCacheService.I.saveSummary(cachedSummary);
        return data;
      },
      onFailure: (error) {
        log('getSummary error: $error');
        return null;
      },
    );
  }
}
