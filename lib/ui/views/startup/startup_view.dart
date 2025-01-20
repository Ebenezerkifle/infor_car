import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:infor_car/ui/common/app_colors.dart';
import 'package:infor_car/ui/common/app_text_style.dart';
import 'package:stacked/stacked.dart';
import 'package:infor_car/ui/common/ui_helpers.dart';

import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
                height: screenHeight(context),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('INFO',
                                style: extraBold.copyWith(
                                    color: lineBlackColor, fontSize: 40)),
                            Text('CAR',
                                style: extraBold.copyWith(
                                    color: primaryColor, fontSize: 40))
                          ])
                    ])),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: mediumSize),
              child: LinearProgressIndicator(
                minHeight: tinySize,
                borderRadius: BorderRadius.circular(middleSize),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(BuildContext context) => StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
