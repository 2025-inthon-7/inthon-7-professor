import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:inthon_7_professor/app/feature/classroom/classroom_card.dart';
import 'package:inthon_7_professor/app/feature/classroom/classroom_feed_help_dialog.dart';
import 'package:inthon_7_professor/app/feature/classroom/feed_event_title.dart';
import 'package:inthon_7_professor/app/feature/classroom/logic/event_provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ClassroomFeedPanel extends ConsumerStatefulWidget {
  const ClassroomFeedPanel({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ClassroomFeedPanelState();
}

class _ClassroomFeedPanelState extends ConsumerState<ClassroomFeedPanel> {
  @override
  Widget build(BuildContext context) {
    final events = ref.watch(eventProvider).events;
    return ClassroomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  '실시간 학생 피드',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              ShadIconButton.ghost(
                icon: const Icon(Icons.help),
                onPressed: () {
                  showShadDialog(
                    context: context,
                    builder: (c) => const ClassroomFeedHelpDialog(),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 10, width: double.maxFinite),
          Expanded(
            child: AnimationLimiter(
              child: ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index) {
                  final event = events[index];

                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: FeedEventTitle(event: event),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
