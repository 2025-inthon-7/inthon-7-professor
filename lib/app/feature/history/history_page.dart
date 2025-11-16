import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:inthon_7_professor/app/feature/classroom/classroom_card.dart';
import 'package:inthon_7_professor/app/feature/history/logic/history_provider.dart';
import 'package:inthon_7_professor/app/feature/history/widgets/history_summary_card.dart';
import 'package:inthon_7_professor/app/routing/router_service.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class HistoryPage extends ConsumerWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ShadTheme.of(context);
    final historyState = ref.watch(historyProvider);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  ShadButton.ghost(
                    leading: const Icon(Icons.arrow_back),
                    onPressed: () {
                      context.go(Routes.home);
                    },
                  ),
                  const SizedBox(width: 12),
                  Text('수업 요약 기록', style: theme.textTheme.h4),
                  const Spacer(),
                  if (historyState.summaries.isNotEmpty)
                    ShadButton.outline(
                      leading: const Icon(Icons.delete_outline),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return ShadDialog(
                              title: const Text('전체 삭제'),
                              description: const SizedBox(
                                width: 250,
                                child: Text('모든 수업 요약 기록을 삭제하시겠습니까?'),
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
                                    ref
                                        .read(historyProvider.notifier)
                                        .clearAll();
                                    Navigator.of(context).pop();
                                    RouterService.I.showToast(
                                      '모든 기록이 삭제되었습니다.',
                                    );
                                  },
                                  child: const Text('삭제'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: const Text('전체 삭제'),
                    ),
                  const SizedBox(width: 12),
                  ShadButton(
                    leading: const Icon(Icons.refresh),
                    onPressed: () {
                      ref.read(historyProvider.notifier).loadSummaries();
                    },
                    child: const Text('새로고침'),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Content
              Expanded(
                child: historyState.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : historyState.summaries.isEmpty
                    ? Center(
                        child: ClassroomCard(
                          child: Padding(
                            padding: const EdgeInsets.all(48.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.history,
                                  size: 64,
                                  color: theme.colorScheme.mutedForeground,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  '저장된 수업 요약이 없습니다',
                                  style: theme.textTheme.h4,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '수업을 종료하면 요약이 자동으로 저장됩니다',
                                  style: theme.textTheme.muted,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : ListView.separated(
                        itemCount: historyState.summaries.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final cachedSummary = historyState.summaries[index];
                          return HistorySummaryCard(
                            cachedSummary: cachedSummary,
                            onDelete: () {
                              ref
                                  .read(historyProvider.notifier)
                                  .deleteSummary(cachedSummary.sessionId);
                              RouterService.I.showToast('기록이 삭제되었습니다.');
                            },
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
