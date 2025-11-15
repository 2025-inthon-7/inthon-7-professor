import 'dart:ui_web' as ui_web;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inthon_7_professor/app/extension/build_context_x.dart';
import 'package:inthon_7_professor/app/service/screen_capture_service.dart';
import 'package:uuid/uuid.dart';

class ClassroomCapturedScreen extends ConsumerStatefulWidget {
  const ClassroomCapturedScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ClassroomCapturedScreenState();
}

class _ClassroomCapturedScreenState
    extends ConsumerState<ClassroomCapturedScreen> {
  String? _viewType;
  bool _isVideoReady = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _setupVideo());
  }

  void _setupVideo() {
    final videoElement = ScreenCaptureService.I.videoElement;

    if (videoElement != null) {
      // Unique view type 생성
      _viewType = 'video-${const Uuid().v4()}';

      // Video element를 Flutter에 등록
      ui_web.platformViewRegistry.registerViewFactory(_viewType!, (int viewId) {
        // 스타일 적용
        videoElement.style.width = '100%';
        videoElement.style.height = '100%';
        videoElement.style.objectFit = 'contain';

        return videoElement;
      });

      setState(() {
        _isVideoReady = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: context.colorScheme.muted),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(13),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
          color: Colors.black,
        ),
        clipBehavior: Clip.antiAlias,
        child: _isVideoReady && _viewType != null
            ? HtmlElementView(viewType: _viewType!)
            : Center(
                child: Text(
                  '화면 공유를 시작해주세요',
                  style: TextStyle(color: context.colorScheme.mutedForeground),
                ),
              ),
      ),
    );
  }
}
