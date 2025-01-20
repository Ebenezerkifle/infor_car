import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infor_car/ui/common/app_colors.dart';
import 'package:infor_car/ui/common/app_text_style.dart';
import 'package:infor_car/ui/common/ui_helpers.dart';
import 'package:infor_car/ui/views/home/widget/top_widget.dart';
import 'package:infor_car/ui/views/widgets/chart_builder/chart_builder_view.dart';
import 'package:infor_car/ui/views/widgets/custom_circular_progress.dart';
import 'package:infor_car/ui/views/widgets/custom_container.dart';
import 'package:infor_car/ui/views/widgets/icon_decore_widget.dart';
import 'package:infor_car/ui/views/widgets/promotion_widget.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: mediumSize),
                child: Column(children: [
                  verticalSpaceMiddle,
                  const TopWidget(),
                  verticalSpaceMedium,
                  const PromotionWidget(),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        smallDetailsBuilder('Feul Level',
                            const CustomCircularProgress(value: 38)),
                        smallDetailsBuilder('Battery Level',
                            const CustomCircularProgress(value: 89))
                      ]),
                  verticalSpaceMedium,
                  const Text('Feul and Battery Usage', style: light),
                  verticalSpaceSmall,
                  const ChartBuilderView(),
                ]))));
  }

  Widget smallDetailsBuilder(String title, Widget detail) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CustomContainer(
            padding: const EdgeInsets.symmetric(
                vertical: smallSize, horizontal: middleSize),
            color: secondaryColor,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title, style: regular.copyWith(color: primaryDarkColor)),
              verticalSpaceSmall,
              detail
            ])),
        Positioned(
          bottom: tinySize,
          right: tinySize,
          child: IconDecoreWidget(
            icon: FontAwesomeIcons.plus,
            onTap: () {},
            forgroundColor: whiteColor,
            backgroundColor: primaryDarkColor,
            iconSize: middleSize,
            circle: true,
          ),
        )
      ],
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
