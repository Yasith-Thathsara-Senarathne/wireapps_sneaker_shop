import 'package:flutter/material.dart';
import 'package:wireapps_sneaker_shop/utils/styles/colors/app_colors.dart';

class AppFilterOptionView<T> extends StatelessWidget {
  // variables

  final String title;

  final T value;

  final T groupValue;

  final EdgeInsetsGeometry padding;

  final double borderRadius;

  final Color activeColor;

  final Color inActiveColor;

  final double fontSize;

  final ValueSetter<T> onValueChanged;

  const AppFilterOptionView({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onValueChanged,
    this.padding = const EdgeInsets.symmetric(
      vertical: 4,
      horizontal: 6,
    ),
    this.borderRadius = 10.0,
    this.activeColor = AppColors.mineShaft,
    this.inActiveColor = AppColors.athensGray,
    this.fontSize = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onValueChanged(value);
      },
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: value == groupValue ? activeColor : inActiveColor,
          borderRadius: BorderRadius.circular(
            borderRadius,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: value == groupValue ? inActiveColor : activeColor,
              fontSize: fontSize,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
