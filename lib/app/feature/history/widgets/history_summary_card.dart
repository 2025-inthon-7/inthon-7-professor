import 'package:flutter/material.dart';
import 'package:inthon_7_professor/app/feature/classroom/classroom_card.dart';
import 'package:inthon_7_professor/app/feature/classroom/logic/cached_summary.dart';
import 'package:inthon_7_professor/app/feature/home/widgets/summary_dialog.dart';
import 'package:inthon_7_professor/app/model/course.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:intl/intl.dart';

class HistorySummaryCard extends StatelessWidget {
  const HistorySummaryCard({
    super.key,
    required this.cachedSummary,
    required this.onDelete,
  });

  final CachedSummary cachedSummary;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final dateFormat = DateFormat('yyyy년 MM월 dd일 HH:mm');
    final summary = cachedSummary.summary;

    return ClassroomCard(
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => SummaryDialog(summary: summary),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          summary.course.displayName,
                          style: theme.textTheme.h4,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          dateFormat.format(summary.date),
                          style: theme.textTheme.muted,
                        ),
                      ],
                    ),
                  ),
                  ShadButton.ghost(
                    leading: const Icon(Icons.delete_outline, size: 20),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return ShadDialog(
                            title: const Text('삭제 확인'),
                            description: const SizedBox(
                              width: 250,
                              child: Text('이 수업 요약을 삭제하시겠습니까?'),
                            ),
                            actions: [
                              ShadButton.ghost(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('취소'),
                              ),
                              ShadButton.destructive(
                                onPressed: () {
                                  onDelete();
                                  Navigator.of(context).pop();
                                },
                                child: const Text('삭제'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ShadSeparator.horizontal(),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _StatItem(
                      icon: Icons.thumb_up,
                      label: '이해했어요',
                      value: '${summary.feedback.ok}명',
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _StatItem(
                      icon: Icons.thumb_down,
                      label: '어려워요',
                      value: '${summary.feedback.hard}명',
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _StatItem(
                      icon: Icons.question_answer,
                      label: '질문',
                      value: '${summary.question_count}개',
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              if (summary.important_moments.isNotEmpty) ...[
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 16,
                      color: theme.colorScheme.mutedForeground,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '중요 포인트 ${summary.important_moments.length}개',
                      style: theme.textTheme.small,
                    ),
                  ],
                ),
              ],
              const SizedBox(height: 12),
              Text(
                '저장됨: ${dateFormat.format(cachedSummary.cachedAt)}',
                style: theme.textTheme.small.copyWith(
                  color: theme.colorScheme.mutedForeground,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return Column(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 4),
        Text(value, style: theme.textTheme.p),
        Text(label, style: theme.textTheme.small),
      ],
    );
  }
}
