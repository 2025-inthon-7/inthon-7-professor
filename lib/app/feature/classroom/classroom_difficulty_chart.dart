import 'dart:developer';
import 'dart:math' show max;

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inthon_7_professor/app/extension/build_context_x.dart';
import 'package:inthon_7_professor/app/feature/classroom/logic/event_provider.dart';
import 'package:inthon_7_professor/app/feature/classroom/logic/event_type.dart';

/// Data point for difficulty chart
class DifficultyPoint {
  final DateTime time;
  final int difficulty;

  DifficultyPoint({required this.time, required this.difficulty});
}

class ClassroomDifficultyChart extends ConsumerWidget {
  const ClassroomDifficultyChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Dummy data for testing
    final now = DateTime.now();
    List<DifficultyPoint> data = [];
    final eventState = ref.watch(eventProvider);

    // info 이벤트 찾기 (시작점)
    DateTime startTime = () {
      for (var event in eventState.events) {
        if (event.type == EType.info) {
          return event.timestamp;
        }
      }
      return now;
    }();

    // 시작 시간을 분 단위로 truncate
    DateTime currentMinute = DateTime(
      startTime.year,
      startTime.month,
      startTime.day,
      startTime.hour,
      startTime.minute,
    );

    // 현재 시간까지 1분 간격으로 Map 초기화
    Map<DateTime, int> minuteGroups = {};
    DateTime endTime = now;

    while (currentMinute.isBefore(endTime) ||
        currentMinute.isAtSameMomentAs(endTime)) {
      minuteGroups[currentMinute] = 0;
      currentMinute = currentMinute.add(Duration(minutes: 1));
    }

    // 이벤트들을 처리하여 해당 분에 difficulty 누적
    for (var event in eventState.events) {
      if (event.type == EType.info) {
        continue; // info는 시작점으로만 사용하므로 skip
      }

      // timestamp를 분 단위로 truncate
      DateTime minuteKey = DateTime(
        event.timestamp.year,
        event.timestamp.month,
        event.timestamp.day,
        event.timestamp.hour,
        event.timestamp.minute,
      );

      // 해당 분이 범위 내에 있는지 확인
      if (minuteGroups.containsKey(minuteKey)) {
        if (event.type == EType.difficult) {
          minuteGroups[minuteKey] = minuteGroups[minuteKey]! + event.count;
        } else if (event.type == EType.easy) {
          minuteGroups[minuteKey] = minuteGroups[minuteKey]! - event.count;
        }
      }
    }

    // Map을 DifficultyPoint 리스트로 변환 (시간 순)
    var sortedMinutes = minuteGroups.keys.toList()..sort();
    for (var minute in sortedMinutes) {
      data.add(
        DifficultyPoint(time: minute, difficulty: minuteGroups[minute]!),
      );
    }

    return DifficultyLineChart(data: data);
  }
}

class DifficultyLineChart extends StatelessWidget {
  final List<DifficultyPoint> data;

  const DifficultyLineChart({super.key, required this.data});

  static const List<Color> gradientColors = [
    Colors.blue,
    Colors.blue,
    Colors.green,
  ];

  @override
  Widget build(BuildContext context) {
    return LineChart(_buildChartData(context));
  }

  LineChartData _buildChartData(BuildContext context) {
    final spots = data.asMap().entries.map((entry) {
      return FlSpot(entry.key.toDouble(), entry.value.difficulty.toDouble());
    }).toList();

    double minY = -10;
    double maxY = 10;

    if (data.isNotEmpty) {
      final difficulties = data.map((d) => d.difficulty).toList();
      final dataMin = difficulties.reduce((a, b) => a < b ? a : b).toDouble();
      final dataMax = difficulties.reduce((a, b) => a > b ? a : b).toDouble();
      minY = (dataMin).floorToDouble();
      maxY = (dataMax).ceilToDouble();

      final maxVal = max(dataMax.abs(), dataMin.abs());
      minY = -maxVal;
      maxY = maxVal;
      if (minY == 0) minY = -1;
      if (maxY == 0) maxY = 1;
    }

    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,

        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          if (value == 0) {
            return const FlLine(color: Colors.black, strokeWidth: 2);
          }
          return const FlLine(color: Colors.black12, strokeWidth: 1);
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(color: Colors.black12, strokeWidth: 1);
        },
      ),

      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 20,
            interval: 1,
            getTitlesWidget: (value, meta) => _buildBottomTitle(value, meta),
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: (value, meta) => _buildLeftTitle(value, meta),
            reservedSize: 30,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 75,
      minY: minY,
      maxY: maxY,
      lineBarsData: spots.isEmpty
          ? []
          : [
              LineChartBarData(
                spots: spots,
                isCurved: true,
                gradient: const LinearGradient(
                  colors: gradientColors,
                  stops: [0.0, 0.7, 1.0],
                ),
                barWidth: 3,
                isStrokeCapRound: true,
                dotData: FlDotData(
                  show: true,
                  getDotPainter: (spot, percent, barData, index) {
                    return FlDotCirclePainter(
                      radius: 3,
                      color: percent >= 100 ? Colors.green : Colors.blue,
                      strokeWidth: 1,
                      strokeColor: Colors.white,
                    );
                  },
                ),
                belowBarData: BarAreaData(show: false),
              ),
            ],
      lineTouchData: LineTouchData(
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((spot) {
              final dataPoint = data[spot.spotIndex];
              return LineTooltipItem(
                '${dataPoint.time.hour}:${dataPoint.time.minute.toString().padLeft(2, '0')}\n${dataPoint.difficulty > 0 ? '+' : ''}${dataPoint.difficulty}',
                const TextStyle(color: Colors.white),
              );
            }).toList();
          },
        ),
      ),
    );
  }

  Widget _buildBottomTitle(double value, TitleMeta meta) {
    if (data.isEmpty) return const SizedBox.shrink();

    final index = value.toInt();
    if (index < 0 || index >= data.length || index < data.length - 1) {
      return const SizedBox.shrink();
    }

    final time = data[index].time;
    final text = '${time.hour}:${time.minute.toString().padLeft(2, '0')}';

    return SideTitleWidget(
      meta: meta,
      child: Text(
        text,
        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildLeftTitle(double value, TitleMeta meta) {
    const style = TextStyle(fontWeight: FontWeight.bold, fontSize: 13);

    final intValue = value.toInt();
    String text = '';

    if (intValue == 0) {
      text = '0';
    } else if (intValue % 2 == 0) {
      text = intValue > 0 ? '+$intValue' : '$intValue';
    }

    return Padding(
      padding: const EdgeInsets.only(right: 4.0),
      child: Text(text, style: style, textAlign: TextAlign.right),
    );
  }

  Color _getLineColor(List<FlSpot> spots) {
    if (spots.isEmpty) return Colors.blue;

    final lastValue = spots.last.y;
    if (lastValue > 0) {
      return Colors.green;
    } else if (lastValue < 0) {
      return Colors.red;
    } else {
      return Colors.blue;
    }
  }
}
