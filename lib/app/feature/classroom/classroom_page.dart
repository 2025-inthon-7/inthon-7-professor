import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inthon_7_professor/app/feature/classroom/classroom_captured_screen.dart';
import 'package:inthon_7_professor/app/feature/classroom/classroom_control_panel.dart';
import 'package:inthon_7_professor/app/feature/classroom/classroom_feed_panel.dart';
import 'package:inthon_7_professor/app/feature/classroom/classroom_info_panel.dart';
import 'package:inthon_7_professor/app/feature/classroom/logic/event_provider.dart';
import 'package:inthon_7_professor/app/feature/classroom/logic/event_type.dart';
import 'package:inthon_7_professor/app/feature/classroom/logic/pip_provider.dart';
import 'package:inthon_7_professor/app/feature/home/logic/home_provider.dart';

class ClassroomPage extends ConsumerStatefulWidget {
  const ClassroomPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ClassroomPageState();
}

class _ClassroomPageState extends ConsumerState<ClassroomPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final startEvent = EventType(
        type: EType.info,
        content: '수업이 시작되었습니다.',
        timestamp: DateTime.now(),
        count: 0,
      );
      ref.read(eventProvider.notifier).startClass(startEvent);
      ref.read(pipProvider.notifier).startPIPMode([startEvent]);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeProvider);
    return Scaffold(
      backgroundColor: const Color(0xFFE5EBF1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            children: const [
              Expanded(
                child: Column(
                  children: [
                    ClassroomCapturedScreen(),
                    SizedBox(height: 17),
                    Expanded(child: ClassroomInfoPanel()),
                  ],
                ),
              ),
              SizedBox(width: 17),
              SizedBox(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(child: ClassroomFeedPanel()),
                    SizedBox(height: 17),
                    ClassroomControlPanel(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
