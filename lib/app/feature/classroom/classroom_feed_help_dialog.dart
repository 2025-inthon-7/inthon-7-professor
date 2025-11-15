import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ClassroomFeedHelpDialog extends StatelessWidget {
  const ClassroomFeedHelpDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShadDialog(
      title: const Text('실시간 학생 피드 도움말'),
      description: const SizedBox(
        width: 300,
        child: Text(
          '실시간 학생 피드는 학생들이 수업 중에 보내는 피드백을 실시간으로 확인할 수 있는 기능입니다.\n\n'
          '피드에는 학생들의 질문이나 이해도 관련 알림이 포함될 수 있으며, 이를 통해 교수자는 수업 진행 방식을 조정하고 학생들의 참여를 높일 수 있습니다.\n\n',
        ),
      ),
      actions: [
        ShadButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('닫기'),
        ),
      ],
    );
  }
}
