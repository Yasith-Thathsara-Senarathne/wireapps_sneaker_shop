import 'package:flutter/material.dart';
import 'package:wireapps_sneaker_shop/utils/styles/colors/app_colors.dart';

abstract class AppTheme {
  // variables

  // theme data
  static ThemeData themeData = ThemeData(
    splashColor: AppColors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.white,
    fontFamily: 'Poppins',
    canvasColor: AppColors.white,
    appBarTheme: const AppBarTheme(
      color: AppColors.white,
      elevation: 0,
      centerTitle: false,
    ),
  );
}
