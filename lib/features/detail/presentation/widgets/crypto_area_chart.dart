import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:crypto_app/core/constants/colors.dart';

class CryptoAreaChart extends StatelessWidget {
  const CryptoAreaChart({super.key});

  @override
  Widget build(BuildContext context) {
    final spots = <FlSpot>[
      FlSpot(0, 2000),
      FlSpot(1, 3000),
      FlSpot(2, 1500),
      FlSpot(3, 3000),
      FlSpot(4, 6000),
      FlSpot(5, 9000),
      FlSpot(6, 11500),
      FlSpot(7, 10000),
    ];

    return AspectRatio(
      aspectRatio: 1.7,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 7,
          minY: 0,
          maxY: 15000,

          lineTouchData: LineTouchData(
            enabled: true,
            touchTooltipData: LineTouchTooltipData(
              getTooltipColor: (spot) => AppColors.orangeLight,
            ),
          ),

          gridData: FlGridData(
            show: true,
            drawVerticalLine: true,
            horizontalInterval: 3000,
            getDrawingHorizontalLine: (y) => FlLine(
              color: Colors.grey.withValues(alpha: 0.2),
              strokeWidth: 1,
            ),
            getDrawingVerticalLine: (x) => FlLine(
              color: Colors.grey.withValues(alpha: 0.2),
              strokeWidth: 1,
            ),
          ),

          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 1,
                reservedSize: 40,
                getTitlesWidget: (value, meta) {
                  const days = [
                    'Mon',
                    'Tue',
                    'Wed',
                    'Thu',
                    'Fri',
                    'Sat',
                    'Sun',
                    'Mon',
                  ];
                  const dates = [
                    '15',
                    '16',
                    '17',
                    '18',
                    '19',
                    '20',
                    '21',
                    '22',
                  ];
                  final idx = value.toInt();
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        days[idx],
                        style: TextStyle(
                          color: AppColors.myGrey2,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        dates[idx],
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 3000,
                reservedSize: 40,
                getTitlesWidget: (value, meta) {
                  return Text(
                    '${(value ~/ 1000)}k',
                    style: TextStyle(color: AppColors.myGrey2, fontSize: 12),
                  );
                },
              ),
            ),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),

          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
          ),

          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              color: AppColors.orange,
              barWidth: 4,
              dotData: FlDotData(show: true),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.orange.withValues(alpha: 0.4),
                    AppColors.orange.withValues(alpha: 0.05),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
