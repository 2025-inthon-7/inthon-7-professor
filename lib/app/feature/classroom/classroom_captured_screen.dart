import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inthon_7_professor/app/extension/build_context_x.dart';
import 'package:inthon_7_professor/app/feature/home/logic/home_provider.dart';
import 'package:uuid/enums.dart';
import 'package:uuid/uuid.dart';

class ClassroomCapturedScreen extends ConsumerStatefulWidget {
  const ClassroomCapturedScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ClassroomCapturedScreenState();
}

class _ClassroomCapturedScreenState
    extends ConsumerState<ClassroomCapturedScreen> {
  Uint8List? capturedImage;
  Timer? _captureTimer;

  @override
  void initState() {
    super.initState();
    // _captureTimer = Timer.periodic(
    //   const Duration(seconds: 3),
    //   (_) => _capture(),
    // );
    WidgetsBinding.instance.addPostFrameCallback((_) => _capture());
  }

  void _capture() async {
    final image = await ref.read(homeProvider.notifier).getCapturedScreen();
    if (image != null) {
      setState(() {
        capturedImage = image;
      });
    }
  }

  @override
  void dispose() {
    _captureTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: Container(
          key: ValueKey(
            const Uuid().v5(
              Namespace.url.value,
              (capturedImage ?? Uint8List(0)).toString(),
            ),
          ),
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
            image: capturedImage != null
                ? DecorationImage(
                    image: MemoryImage(capturedImage!),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
