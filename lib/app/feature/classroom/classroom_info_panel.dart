import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inthon_7_professor/app/extension/build_context_x.dart';
import 'package:inthon_7_professor/app/feature/classroom/classroom_card.dart';
import 'package:inthon_7_professor/app/feature/classroom/classroom_difficulty_chart.dart';
import 'package:inthon_7_professor/app/feature/home/logic/home_provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ClassroomInfoPanel extends ConsumerStatefulWidget {
  const ClassroomInfoPanel({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ClassroomInfoPanelState();
}

class _ClassroomInfoPanelState extends ConsumerState<ClassroomInfoPanel> {
  Timer? timer;
  int elapsedSeconds = 0;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      elapsedSeconds++;
      setState(() {});
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  String get elapsedTime {
    if (timer == null) return "00:00:00";
    final elapsed = Duration(seconds: elapsedSeconds);
    final hours = elapsed.inHours.toString().padLeft(2, '0');
    final minutes = (elapsed.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (elapsed.inSeconds % 60).toString().padLeft(2, '0');
    return "$hours:$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeProvider);
    return ClassroomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 17.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(state.className, style: context.textTheme.h3),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 5),
                  child: Text("COSE-322-01", style: context.textTheme.small),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "수업 진행 중",
                    style: context.textTheme.small.copyWith(
                      color: context.colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Align(
                  alignment: Alignment.topRight,
                  child: ShadBadge(
                    child: Text(
                      elapsedTime,
                      style: context.textTheme.small.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          Align(
            alignment: Alignment.centerRight,
            child: Text("실시간 난이도", style: context.textTheme.small),
          ),
          const SizedBox(height: 8),
          const Expanded(child: ClassroomDifficultyChart()),
        ],
      ),
    );
  }
}
