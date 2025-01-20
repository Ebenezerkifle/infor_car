import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:infor_car/models/feul_model.dart';
import 'package:infor_car/providers/data_provider.dart';
import 'package:infor_car/ui/common/app_colors.dart';
import 'package:infor_car/ui/common/app_text_style.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/app.locator.dart';

class ChartBuilderViewModel extends ReactiveViewModel {
  final _dataProvider = locator<DataProvider>();

  ChartBuilderViewModel() {
    _init();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_dataProvider];

  _init() async {
    setBusy(true);
    await _dataProvider.getGraphData();
    setBusy(false);
  }

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
    // String text = switch (value.toInt()) {
    //   0 => '6am',
    //   1 => '7am',
    //   2 => '8am',
    //   3 => '9am',
    //   4 => '10am',
    //   5 => '11am',
    //   6 => '12am',
    //   7 => '1pm',
    //   8 => '2pm',
    //   9 => '3pm',
    //   10 => '4pm',
    //   11 => '5pm',
    //   12 => '6pm',
    //   _ => '',
    // };
    var feuldata = _dataProvider.batteryGraph;

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: Text(feuldata[value.toInt()].hour ?? '',
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
        spots: _batteryData(),
      );

  List<FlSpot> _batteryData() {
    List<FlSpot> listData = [];
    List<GraphModel> batteryData = _dataProvider.batteryGraph;
    for (int i = 0; i < 12; i++) {
      var flSpot = FlSpot(i + 0, ((batteryData[i].maxValue ?? 0) / 10) + 0.0);
      listData.add(flSpot);
    }
    return listData;
  }

  LineChartBarData lineChartBarDataPreviousWeek() => LineChartBarData(
        isCurved: true,
        curveSmoothness: 0,
        color: errorColor,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: true),
        belowBarData: BarAreaData(show: false),
        spots: _feulData(),
      );

  List<FlSpot> _feulData() {
    List<FlSpot> listData = [];
    List<GraphModel> feulGraph = _dataProvider.feulGraph;
    for (int i = 0; i < 12; i++) {
      var flSpot = FlSpot(i + 0, ((feulGraph[i].maxValue ?? 0) / 10) + 0.0);
      listData.add(flSpot);
    }
    return listData;
  }

  LineChartData get lineChartData => LineChartData(
        lineTouchData: lineTouchData(),
        gridData: gridData(),
        titlesData: titlesData(),
        borderData: borderData(),
        lineBarsData: lineBarsData(),
        minX: 0,
        maxX: 11,
        minY: 0,
        maxY: 10,
      );
}
