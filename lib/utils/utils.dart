import 'package:flutter/material.dart';
import 'package:wireapps_sneaker_shop/utils/constants.dart';
import 'package:wireapps_sneaker_shop/utils/enums.dart';
import 'package:wireapps_sneaker_shop/utils/styles/sizes/app_sizes.dart';

abstract class Utils {
  // variables

  // check minimum device height & return responsive sizes
  static double responsiveSize(
    BuildContext context, {
    DeviceMeasureType deviceMeasureType = DeviceMeasureType.none,
    double minFraction = 1.0,
    double maxFraction = 1.0,
  }) {
    try {
      switch (deviceMeasureType) {
        case DeviceMeasureType.width:
          return AppSizes.width(context) > Constants.minDeviceHeight
              ? AppSizes.width(context, of: minFraction)
              : AppSizes.width(context, of: maxFraction);
        case DeviceMeasureType.height:
          return AppSizes.height(context) > Constants.minDeviceHeight
              ? AppSizes.height(context, of: minFraction)
              : AppSizes.height(context, of: maxFraction);
        default:
          return 0.0;
      }
    } catch (exception) {
      return 0.0;
    }
  }
}
