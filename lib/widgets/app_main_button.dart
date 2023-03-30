import 'package:flutter/material.dart';
import 'package:wireapps_sneaker_shop/utils/styles/colors/app_colors.dart';

class AppMainButton extends StatelessWidget {
  // variables
  final String title;

  final Color titleColor;

  final Color bgColor;

  final double fontSize;

  final FontWeight fontWeight;

  final VoidCallback onTapped;

  const AppMainButton({
    super.key,
    required this.title,
    required this.onTapped,
    this.titleColor = AppColors.athensGray,
    this.bgColor = AppColors.mineShaft,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w500,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTapped();
      },
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.zero,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 18,
        ),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: titleColor,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
