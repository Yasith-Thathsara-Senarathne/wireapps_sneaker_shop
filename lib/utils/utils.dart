import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wireapps_sneaker_shop/utils/constants.dart';
import 'package:wireapps_sneaker_shop/utils/enums.dart';
import 'package:wireapps_sneaker_shop/utils/extensions.dart';
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
          return AppSizes.width(context) >= Constants.minDeviceHeight
              ? AppSizes.width(context, of: minFraction)
              : AppSizes.width(context, of: maxFraction);
        case DeviceMeasureType.height:
          return AppSizes.height(context) >= Constants.minDeviceHeight
              ? AppSizes.height(context, of: minFraction)
              : AppSizes.height(context, of: maxFraction);
        default:
          return 0.0;
      }
    } catch (exception) {
      return 0.0;
    }
  }

  // check for connection
  static Future<bool> hasConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  // check null json values for strings
  static String checkForNullJsonsString({required dynamic jsonValue}) {
    try {
      if (jsonValue == '' || jsonValue == "" || jsonValue == null) {
        return '';
      }

      if (jsonValue is String) {
        return jsonValue;
      }

      return '';
    } catch (exception) {
      return '';
    }
  }

  // check null json values for double
  static double checkForNullJsonsDouble({required dynamic jsonValue}) {
    try {
      if (jsonValue == '' || jsonValue == "" || jsonValue == null) {
        return 0.00;
      }

      return double.parse(jsonValue);
    } catch (exception) {
      return 0.00;
    }
  }

  // currency enum value
  static CurrencyType checkForNullJsonsCurrencyEnumValue(
      {required dynamic jsonValue}) {
    try {
      if (jsonValue == '' || jsonValue == "" || jsonValue == null) {
        return CurrencyType.none;
      }

      for (CurrencyType item in CurrencyType.values) {
        if (item.convertValue.toLowerCase() == jsonValue.toLowerCase()) {
          return item;
        }
      }
    } catch (exception) {
      return CurrencyType.none;
    }
    return CurrencyType.none;
  }

  // shoe size enum value
  static ShoeSizeType checkForNullJsonsShoeSizeEnumValue(
      {required dynamic jsonValue}) {
    try {
      if (jsonValue == '' || jsonValue == "" || jsonValue == null) {
        return ShoeSizeType.none;
      }

      for (ShoeSizeType item in ShoeSizeType.values) {
        if (item.convertValue.toLowerCase() == jsonValue.toLowerCase()) {
          return item;
        }
      }
    } catch (exception) {
      return ShoeSizeType.none;
    }
    return ShoeSizeType.none;
  }

  // shoe color enum value
  static ShoeColorType checkForNullJsonsShoeColorEnumValue(
      {required dynamic jsonValue}) {
    try {
      if (jsonValue == '' || jsonValue == "" || jsonValue == null) {
        return ShoeColorType.none;
      }

      for (ShoeColorType item in ShoeColorType.values) {
        if (item.convertValue.toLowerCase() == jsonValue.toLowerCase()) {
          return item;
        }
      }
    } catch (exception) {
      return ShoeColorType.none;
    }
    return ShoeColorType.none;
  }
}
