import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:infor_car/ui/common/app_colors.dart';
import 'package:infor_car/ui/common/app_text_style.dart';
import 'package:infor_car/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'package:infor_car/ui/views/widgets/chart_builder/chart_builder_viewmodel.dart';

class ChartBuilderView extends StackedView<ChartBuilderViewModel> {
  const ChartBuilderView({super.key});

  _widget(String title, Color color) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title, style: ultraLight.copyWith(fontSize: 9)),
        horizontalSpaceSmall,
        Container(
          width: 50,
          height: tinySize,
          decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(
                Radius.circular(tinySize),
              )),
        ),
      ],
    );
  }

  @override
  Widget builder(
      BuildContext context, ChartBuilderViewModel viewModel, Widget? child) {
    return Container(
      height: screenHeight(context) * .35,
      color: secondaryColor,
      padding: const EdgeInsets.symmetric(
          vertical: smallSize, horizontal: smallSize),
      child: Column(children: [
        Expanded(child: LineChart(viewModel.lineChartData)),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          _widget('Feul', errorColor),
          horizontalSpaceSmall,
          _widget('Battery', primaryDarkColor)
        ])
      ]),
    );
  }

  @override
  ChartBuilderViewModel viewModelBuilder(BuildContext context) =>
      ChartBuilderViewModel();
}
