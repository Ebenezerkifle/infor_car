import 'package:flutter/material.dart';
import 'package:infor_car/ui/common/ui_helpers.dart';
import 'package:infor_car/ui/views/widgets/image_builder.dart';
import 'package:infor_car/ui/views/widgets/promotion_builder/promotion_widget_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../common/app_colors.dart';

class PromotionWidget extends StackedView<PromotionWidgetViewModel> {
  const PromotionWidget({super.key});

  @override
  Widget builder(
      BuildContext context, PromotionWidgetViewModel viewModel, Widget? child) {
    Widget pageItemBuilder(String image) {
      return ImageBuilder(
        image: image,
        height: screenHeight(context) * .2,
        width: screenWidth(context),
      );
    }

    Widget pointers(int length) {
      return Container(
          padding: const EdgeInsets.all(smallSize),
          width: screenWidth(context),
          alignment: Alignment.center,
          child: SmoothPageIndicator(
              controller: viewModel.controller,
              count: length,
              onDotClicked: (index) => viewModel.dotClickHandler(index),
              effect: const ExpandingDotsEffect(
                radius: 10,
                dotHeight: 8,
                dotWidth: smallSize,
                activeDotColor: primaryDarkColor,
                dotColor: grey40Color,
                // type: WormType.thin,
              )));
    }

    return SizedBox(
        height: screenHeight(context) * .25,
        child: Column(children: [
          Flexible(
            fit: FlexFit.loose,
            child: PageView(
                controller: viewModel.controller,
                children: List.generate(viewModel.images.length, (index) {
                  String e = viewModel.images[index];
                  return Builder(builder: (context) {
                    viewModel.setCurrentIndex(index);
                    return pageItemBuilder(e);
                  });
                }).toList()),
          ),
          pointers(viewModel.images.length),
          verticalSpaceSmall
        ]));
  }

  @override
  PromotionWidgetViewModel viewModelBuilder(BuildContext context) =>
      PromotionWidgetViewModel();
}
