import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:inthon_7_professor/app/feature/classroom/classroom_card.dart';
import 'package:inthon_7_professor/app/feature/classroom/logic/summary.dart';
import 'package:inthon_7_professor/app/model/course.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:intl/intl.dart';

class SummaryDialog extends StatelessWidget {
  const SummaryDialog({Key? key, required this.summary}) : super(key: key);

  final Summary summary;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final dateFormat = DateFormat('yyyy년 MM월 dd일');
    final timeFormat = DateFormat('HH:mm');

    return ShadDialog(
      title: Text('수업 요약'),
      description: Text(summary.course.displayName),
      actions: [
        ShadButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('닫기'),
        ),
      ],
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            // 날짜 정보
            _buildInfoRow(
              context,
              icon: Icons.calendar_today,
              label: '수업 날짜',
              value: dateFormat.format(summary.date),
            ),

            ShadSeparator.horizontal(),

            // 피드백 통계
            Text('학생 피드백', style: theme.textTheme.h4),
            Row(
              spacing: 12,
              children: [
                Expanded(
                  child: ClassroomCard(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Icon(Icons.thumb_up, color: Colors.green, size: 32),
                          SizedBox(height: 8),
                          Text(
                            '${summary.feedback.ok}명',
                            style: theme.textTheme.h3,
                          ),
                          Text('이해했어요', style: theme.textTheme.muted),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ClassroomCard(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Icon(Icons.thumb_down, color: Colors.red, size: 32),
                          SizedBox(height: 8),
                          Text(
                            '${summary.feedback.hard}명',
                            style: theme.textTheme.h3,
                          ),
                          Text('어려워요', style: theme.textTheme.muted),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            ClassroomCard(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(Icons.question_answer, size: 24),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('질문 개수', style: theme.textTheme.muted),
                          Text(
                            '${summary.question_count}개',
                            style: theme.textTheme.h3,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            if (summary.important_moments.isNotEmpty) ...[
              Text('중요한 포인트', style: theme.textTheme.h4),
              ...summary.important_moments.map((moment) {
                if (moment.capture_url == null && moment.note.isEmpty) {
                  return SizedBox.shrink();
                }
                return ClassroomCard(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 200,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl: moment.capture_url!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 8,
                          children: [
                            Row(
                              children: [
                                if (moment.is_hardest)
                                  ShadBadge.destructive(
                                    child: Text('가장 어려웠던 순간'),
                                  ),
                                Spacer(),
                                Text(
                                  timeFormat.format(moment.created_at),
                                  style: theme.textTheme.small,
                                ),
                              ],
                            ),
                            if (moment.note.isNotEmpty)
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.muted,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  moment.note,
                                  style: theme.textTheme.muted,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    final theme = ShadTheme.of(context);
    return Row(
      children: [
        Icon(icon, size: 20),
        SizedBox(width: 8),
        Text('$label: ', style: theme.textTheme.muted),
        Text(value, style: theme.textTheme.p),
      ],
    );
  }
}
