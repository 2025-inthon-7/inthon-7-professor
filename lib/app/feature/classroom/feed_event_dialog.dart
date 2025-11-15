import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:inthon_7_professor/app/extension/build_context_x.dart';
import 'package:inthon_7_professor/app/feature/classroom/logic/event_type.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class FeedEventDialog extends StatelessWidget {
  const FeedEventDialog({Key? key, required this.event}) : super(key: key);

  final EventType event;

  @override
  Widget build(BuildContext context) {
    return ShadDialog(
      constraints: const BoxConstraints(maxWidth: 800),
      title: Text(switch (event.type) {
        EType.difficult => '${event.count}명의 학생들이 아래 내용을 어려워하고 있어요',
        EType.easy => '${event.count}명의 학생들이 아래 내용을 잘 이해하고 있어요.',
        EType.question => '새로운 질문이 도착했어요',
        EType.info => '알림',
      }),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 800,
            child: event.imageData.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.memory(
                      Uint8List.fromList(event.imageData),
                      fit: BoxFit.contain,
                    ),
                  )
                : Container(),
          ),
          SizedBox(height: 12),
          Text(event.content, style: context.textTheme.h4),
        ],
      ),
    );
  }
}
