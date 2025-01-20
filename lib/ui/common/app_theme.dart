import 'package:flutter/material.dart';
import 'package:infor_car/ui/common/app_colors.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
    fontFamily: 'PlusJakartaSans',
    primaryColor: primaryColor,
    secondaryHeaderColor: primaryDarkColor,
    disabledColor: const Color(0xFFBABFC4),
    highlightColor: secondaryColor,
    brightness: Brightness.light,
    hintColor: grey40Color,
    cardColor: whiteColor,
    scaffoldBackgroundColor: whiteColor,
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: primaryColor)),
    colorScheme: const ColorScheme.light(
            primary: primaryColor, secondary: primaryDarkColor)
        .copyWith(surface: whiteColor)
        .copyWith(error: errorColor),
  );
}
