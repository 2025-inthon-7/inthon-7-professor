import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inthon_7_professor/app/feature/classroom/classroom_card.dart';
import 'package:inthon_7_professor/app/feature/classroom/logic/pip_provider.dart';
import 'package:inthon_7_professor/app/feature/home/logic/home_provider.dart';
import 'package:inthon_7_professor/app/routing/router_service.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ClassroomControlPanel extends ConsumerWidget {
  const ClassroomControlPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClassroomCard(
      child: Column(
        children: [
          ShadButton(
            width: double.maxFinite,
            leading: const Icon(Icons.notifications),
            backgroundColor: Colors.orange,
            onPressed: () {
              // ref.read(homeProvider.notifier).sendImportantNotification();
              //TODO
              // ref.read(pipProvider.notifier).sendEventsToPip();
              // ref.read(pipProvider.notifier).closePIPMode();
            },
            child: const Text('중요 알림 보내기'),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: ShadButton(
                  backgroundColor: Colors.green,
                  leading: const Icon(Icons.refresh),
                  enabled: !ref.watch(pipProvider).isInPipMode,
                  width: double.maxFinite,
                  onPressed: () {
                    ref.read(pipProvider.notifier).startPIPMode();
                  },
                  child: const Text('수업 재개'),
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: ShadButton.destructive(
                  leading: const Icon(Icons.stop_circle),
                  width: double.maxFinite,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return ShadDialog(
                          title: const Text('수업 종료'),
                          description: const SizedBox(
                            width: 250,
                            child: Text('수업을 종료하시겠습니까?'),
                          ),
                          actions: [
                            ShadButton.ghost(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('취소'),
                            ),
                            ShadButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                ref.read(homeProvider.notifier).endClass();
                                ref.read(pipProvider.notifier).closePIPMode();
                                context.go(Routes.home);
                              },
                              child: const Text('확인'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text('수업 종료'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
