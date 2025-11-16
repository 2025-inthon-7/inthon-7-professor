import 'package:flutter/material.dart';
import 'package:inthon_7_professor/app/extension/build_context_x.dart';
import 'package:inthon_7_professor/app/feature/classroom/feed_event_dialog.dart';
import 'package:inthon_7_professor/app/feature/classroom/logic/event_type.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class FeedEventTitle extends StatelessWidget {
  const FeedEventTitle({super.key, required this.event});

  final EventType event;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (event.type == EType.info) return;
        showShadDialog(
          context: context,
          builder: (context) => FeedEventDialog(event: event),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: switch (event.type) {
          EType.info => Row(
            children: [
              const Icon(Icons.info_rounded, color: Colors.blue),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.content,
                      style: context.textTheme.p.copyWith(
                        color: Colors.blue,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '${event.timestamp.hour.toString().padLeft(2, '0')}:${event.timestamp.minute.toString().padLeft(2, '0')}',
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          EType.difficult => Row(
            children: [
              const Icon(Icons.warning_amber_rounded, color: Colors.red),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.content,
                      style: context.textTheme.p.copyWith(
                        color: Colors.red,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '${event.timestamp.hour.toString().padLeft(2, '0')}:${event.timestamp.minute.toString().padLeft(2, '0')}',
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
              ShadBadge.destructive(child: Text('${event.count}')),
            ],
          ),
          EType.easy => Row(
            children: [
              const Icon(Icons.check_circle_rounded, color: Colors.green),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.content,
                      style: context.textTheme.p.copyWith(
                        color: Colors.green,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '${event.timestamp.hour.toString().padLeft(2, '0')}:${event.timestamp.minute.toString().padLeft(2, '0')}',
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
              ShadBadge(child: Text('${event.count}')),
            ],
          ),
          EType.question => Row(
            children: [
              Icon(Icons.help, color: context.colorScheme.primary),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.content,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.small,
                    ),
                    Text(
                      '${event.timestamp.hour.toString().padLeft(2, '0')}:${event.timestamp.minute.toString().padLeft(2, '0')}',
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              ShadBadge(child: Text('${event.count}')),
            ],
          ),
        },
      ),
    );
  }
}
