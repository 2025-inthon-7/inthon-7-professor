import 'dart:async';
import 'dart:developer';
import 'dart:js_interop';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;

class ScreenCaptureService {
  web.MediaStream? _stream;
  web.HTMLVideoElement? _videoElement;

  // 화면 공유 시작
  Future<void> startScreenCapture() async {
    try {
      // getDisplayMedia 호출
      final mediaDevices = web.window.navigator.mediaDevices;

      final constraints =
          <String, JSAny?>{
                'video': <String, JSAny?>{'cursor': 'always'.toJS}.jsify(),
                'audio': false.toJS,
              }.jsify()
              as web.DisplayMediaStreamOptions;

      _stream = await mediaDevices.getDisplayMedia(constraints).toDart;

      // video 엘리먼트 생성 및 스트림 연결
      _videoElement =
          web.document.createElement('video') as web.HTMLVideoElement
            ..srcObject = _stream
            ..autoplay = true
            ..muted = true;

      // 비디오가 로드될 때까지 대기 (이벤트 리스너 방식)
      await _waitForVideoLoad();
      _videoElement!.play();

      log('화면 캡처 시작 성공');
    } catch (e) {
      log('화면 캡처 시작 실패: $e');
    }
  }

  // Video 로드 대기 헬퍼 함수
  Future<void> _waitForVideoLoad() async {
    final completer = Completer<void>();

    void onLoadedMetadata(web.Event event) {
      completer.complete();
    }

    _videoElement!.addEventListener('loadedmetadata', onLoadedMetadata.toJS);

    await completer.future;
    _videoElement!.removeEventListener('loadedmetadata', onLoadedMetadata.toJS);
  }

  // 현재 프레임을 이미지로 캡처
  Future<Uint8List?> captureFrame() async {
    if (_videoElement == null || _stream == null) {
      log('화면 공유가 시작되지 않았습니다');
      return null;
    }

    try {
      final width = _videoElement!.videoWidth;
      final height = _videoElement!.videoHeight;

      if (width == 0 || height == 0) {
        log('비디오 크기가 유효하지 않습니다');
        return null;
      }

      // Canvas 생성
      final canvas =
          web.document.createElement('canvas') as web.HTMLCanvasElement
            ..width = width
            ..height = height;

      final ctx = canvas.getContext('2d') as web.CanvasRenderingContext2D;

      // 현재 비디오 프레임을 canvas에 그리기
      ctx.drawImage(_videoElement!, 0, 0);

      // Canvas를 Blob으로 변환
      final blob = await _canvasToBlob(canvas);

      if (blob == null) {
        log('Blob 생성 실패');
        return null;
      }

      // Blob을 Uint8List로 변환
      final arrayBuffer = await blob.arrayBuffer().toDart;
      final uint8List = arrayBuffer.toDart.asUint8List();

      return uint8List;
    } catch (e) {
      log('프레임 캡처 실패: $e');
      return null;
    }
  }

  Future<web.Blob?> _canvasToBlob(web.HTMLCanvasElement canvas) async {
    final completer = Completer<web.Blob?>();

    void blobCallback(web.Blob? blob) {
      completer.complete(blob);
    }

    // type은 String, quality는 double (0.0 ~ 1.0)
    canvas.toBlob(blobCallback.toJS, 'image/png', 1.0.toJS);

    return completer.future;
  }

  // 화면 공유 중지
  void stopScreenCapture() {
    if (_stream != null) {
      final tracks = _stream!.getTracks().toDart;
      for (var i = 0; i < tracks.length; i++) {
        tracks[i].stop();
      }
    }
    _videoElement?.srcObject = null;
    _stream = null;
    _videoElement = null;
  }

  // Video Element getter (프리뷰용)
  web.HTMLVideoElement? get videoElement => _videoElement;
}
