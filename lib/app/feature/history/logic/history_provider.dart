import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inthon_7_professor/app/feature/history/logic/history_state.dart';
import 'package:inthon_7_professor/app/service/summary_cache_service.dart';

final historyProvider = NotifierProvider<HistoryProvider, HistoryState>(
  HistoryProvider.new,
);

class HistoryProvider extends Notifier<HistoryState> {
  @override
  build() {
    // Load summaries when provider is created
    loadSummaries();
    return HistoryState();
  }

  Future<void> loadSummaries() async {
    state = state.copyWith(isLoading: true);
    try {
      final summaries = await SummaryCacheService.I.getAllSummaries();
      state = state.copyWith(summaries: summaries, isLoading: false);
    } catch (e) {
      log('Error loading summaries: $e');
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> deleteSummary(String sessionId) async {
    try {
      await SummaryCacheService.I.deleteSummary(sessionId);
      await loadSummaries();
    } catch (e) {
      log('Error deleting summary: $e');
    }
  }

  Future<void> clearAll() async {
    try {
      await SummaryCacheService.I.clearAll();
      state = state.copyWith(summaries: []);
    } catch (e) {
      log('Error clearing summaries: $e');
    }
  }
}
