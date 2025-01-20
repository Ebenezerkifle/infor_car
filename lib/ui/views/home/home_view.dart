import 'package:flutter/material.dart';
import 'package:infor_car/ui/common/ui_helpers.dart';
import 'package:infor_car/ui/views/home/widget/top_widget.dart';
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
    return const Scaffold(
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: mediumSize),
                child: Column(children: [
                  verticalSpaceMiddle,
                  TopWidget(),
                  verticalSpaceMiddle
                ]))));
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
