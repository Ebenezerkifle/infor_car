import 'package:flutter/material.dart';
import 'package:infor_car/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';

class PromotionWidgetViewModel extends BaseViewModel {
  final _controllers = PageController(initialPage: 0);
  get controller => _controllers;

  dotClickHandler(index) {
    _controllers.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    notifyListeners();
  }

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  List<String> images = [carTwo, carOne, carTwo];

  setCurrentIndex(int index) {
    _currentIndex = index;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }
}
