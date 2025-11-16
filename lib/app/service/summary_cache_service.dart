import 'dart:convert';
import 'dart:developer';
import 'package:get_it/get_it.dart';
import 'package:inthon_7_professor/app/feature/classroom/logic/cached_summary.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SummaryCacheService {
  static SummaryCacheService get I => GetIt.I<SummaryCacheService>();

  static const String _cacheKey = 'cached_summaries';
  late final SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Save a summary to local cache
  Future<void> saveSummary(CachedSummary cachedSummary) async {
    try {
      final summaries = await getAllSummaries();

      // Remove existing summary with same sessionId if exists
      summaries.removeWhere((s) => s.sessionId == cachedSummary.sessionId);

      // Add new summary at the beginning
      summaries.insert(0, cachedSummary);

      // Keep only the last 50 summaries to avoid excessive storage
      if (summaries.length > 50) {
        summaries.removeRange(50, summaries.length);
      }

      final jsonList = summaries.map((s) => s.toJson()).toList();
      await _prefs.setString(_cacheKey, jsonEncode(jsonList));

      log('Summary saved to cache: ${cachedSummary.sessionId}');
    } catch (e) {
      log('Error saving summary to cache: $e');
    }
  }

  /// Get all cached summaries
  Future<List<CachedSummary>> getAllSummaries() async {
    try {
      final jsonString = _prefs.getString(_cacheKey);
      if (jsonString == null) return [];

      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList
          .map((json) => CachedSummary.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      log('Error reading summaries from cache: $e');
      return [];
    }
  }

  /// Get a specific summary by sessionId
  Future<CachedSummary?> getSummary(String sessionId) async {
    try {
      final summaries = await getAllSummaries();
      return summaries.firstWhere(
        (s) => s.sessionId == sessionId,
        orElse: () => throw Exception('Not found'),
      );
    } catch (e) {
      return null;
    }
  }

  /// Delete a specific summary
  Future<void> deleteSummary(String sessionId) async {
    try {
      final summaries = await getAllSummaries();
      summaries.removeWhere((s) => s.sessionId == sessionId);

      final jsonList = summaries.map((s) => s.toJson()).toList();
      await _prefs.setString(_cacheKey, jsonEncode(jsonList));

      log('Summary deleted from cache: $sessionId');
    } catch (e) {
      log('Error deleting summary from cache: $e');
    }
  }

  /// Clear all cached summaries
  Future<void> clearAll() async {
    try {
      await _prefs.remove(_cacheKey);
      log('All summaries cleared from cache');
    } catch (e) {
      log('Error clearing summaries from cache: $e');
    }
  }
}
