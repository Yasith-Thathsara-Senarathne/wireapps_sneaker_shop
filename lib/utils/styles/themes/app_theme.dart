import 'package:flutter/material.dart';
import 'package:wireapps_sneaker_shop/utils/styles/colors/app_colors.dart';

abstract class AppTheme {
  // variables

  // theme data
  static ThemeData themeData = ThemeData(
    splashColor: AppColors.athensGray,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.athensGray,
    fontFamily: 'Poppins',
    canvasColor: AppColors.athensGray,
    appBarTheme: const AppBarTheme(
      color: AppColors.athensGray,
      elevation: 0,
      centerTitle: false,
    ),
  );
}
