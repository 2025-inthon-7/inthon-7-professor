import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inthon_7_professor/app/extension/build_context_x.dart';
import 'package:inthon_7_professor/app/feature/classroom/classroom_captured_screen.dart';
import 'package:inthon_7_professor/app/feature/classroom/classroom_card.dart';
import 'package:inthon_7_professor/app/feature/classroom/classroom_control_panel.dart';
import 'package:inthon_7_professor/app/feature/classroom/classroom_difficulty_chart.dart';
import 'package:inthon_7_professor/app/feature/classroom/classroom_feed_panel.dart';
import 'package:inthon_7_professor/app/feature/classroom/classroom_info_panel.dart';
import 'package:inthon_7_professor/app/feature/home/logic/home_provider.dart';
import 'package:inthon_7_professor/app/routing/router_service.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:uuid/uuid.dart';

class ClassroomPage extends ConsumerStatefulWidget {
  const ClassroomPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ClassroomPageState();
}

class _ClassroomPageState extends ConsumerState<ClassroomPage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeProvider);
    return Scaffold(
      backgroundColor: const Color(0xFFE5EBF1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            children: [
              const Expanded(
                child: Column(
                  children: [
                    ClassroomCapturedScreen(),
                    SizedBox(height: 17),
                    Expanded(child: ClassroomInfoPanel()),
                  ],
                ),
              ),
              const SizedBox(width: 17),
              SizedBox(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(child: ClassroomFeedPanel()),
                    SizedBox(height: 17),
                    const ClassroomControlPanel(),
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
