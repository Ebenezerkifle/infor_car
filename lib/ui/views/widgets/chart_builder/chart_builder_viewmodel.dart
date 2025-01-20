import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:infor_car/ui/common/app_colors.dart';
import 'package:infor_car/ui/common/app_text_style.dart';
import 'package:stacked/stacked.dart';

class ChartBuilderViewModel extends BaseViewModel {
  LineTouchData lineTouchData() =>
      const LineTouchData(handleBuiltInTouches: true);

  FlGridData gridData() => FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (double _) =>
            const FlLine(color: lineColor, strokeWidth: .3),
        getDrawingVerticalLine: (double _) =>
            const FlLine(color: lineColor, strokeWidth: .3),
      );

  FlTitlesData titlesData() => FlTitlesData(
        bottomTitles: AxisTitles(sideTitles: bottomTitles()),
        rightTitles:
            const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(sideTitles: leftTitles()),
      );

  SideTitles bottomTitles() => SideTitles(
        getTitlesWidget: bottomTitleWidgets,
        interval: 1,
        reservedSize: 32,
        showTitles: true,
      );

  SideTitleWidget bottomTitleWidgets(double value, TitleMeta meta) {
    String text = switch (value.toInt()) {
      0 => '6am',
      1 => '7am',
      2 => '8am',
      3 => '9am',
      4 => '10am',
      5 => '11am',
      6 => '12am',
      7 => '1pm',
      8 => '2pm',
      9 => '3pm',
      10 => '4pm',
      11 => '5pm',
      12 => '6pm',
      _ => '',
    };

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: Text(text,
          style: ultraLight.copyWith(color: grey80Color, fontSize: 8)),
    );
  }

  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        interval: 1,
        reservedSize: 40,
        showTitles: true,
      );

  Text leftTitleWidgets(double value, TitleMeta meta) {
    String text = switch (value.toInt()) {
      1 => '10',
      2 => '20',
      3 => '30',
      4 => '40',
      5 => '50',
      6 => '60',
      7 => '70',
      8 => '80',
      9 => '90',
      10 => '100',
      _ => '',
    };

    return Text(text,
        textAlign: TextAlign.center,
        style: ultraLight.copyWith(color: grey80Color));
  }

  FlBorderData borderData() => FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(
            color: const Color(0xFF50E4FF).withOpacity(0.2),
            width: 4,
          ),
          left: const BorderSide(color: Colors.transparent),
          right: const BorderSide(color: Colors.transparent),
          top: const BorderSide(color: Colors.transparent),
        ),
      );

  List<LineChartBarData> lineBarsData() => [
        lineChartBarDataCurrentWeek(),
        lineChartBarDataPreviousWeek(),
      ];

  LineChartBarData lineChartBarDataCurrentWeek() => LineChartBarData(
        isCurved: true,
        curveSmoothness: 0,
        color: primaryDarkColor,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: true),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(0, 1),
          FlSpot(1, 0),
          FlSpot(2, 2),
          FlSpot(3, 2),
          FlSpot(4, 3),
          FlSpot(5, 1),
          FlSpot(6, 0),
          FlSpot(7, 1),
          FlSpot(8, 0),
          FlSpot(9, 2),
          FlSpot(10, 2),
          FlSpot(11, 3),
          FlSpot(12, 1),
        ],
      );

  LineChartBarData lineChartBarDataPreviousWeek() => LineChartBarData(
        isCurved: true,
        curveSmoothness: 0,
        color: errorColor,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: true),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(0, 0),
          FlSpot(1, 1),
          FlSpot(2, 2),
          FlSpot(3, 4),
          FlSpot(4, 5),
          FlSpot(5, 6),
          FlSpot(6, 7),
          FlSpot(7, 8),
          FlSpot(8, 9),
          FlSpot(9, 0),
          FlSpot(10, 1),
          FlSpot(11, 2),
          FlSpot(12, 3),
        ],
      );

  LineChartData get lineChartData => LineChartData(
        lineTouchData: lineTouchData(),
        gridData: gridData(),
        titlesData: titlesData(),
        borderData: borderData(),
        lineBarsData: lineBarsData(),
        minX: 0,
        maxX: 12,
        minY: 0,
        maxY: 10,
      );
}
