import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wireapps_sneaker_shop/models/data_models/product_data_model.dart';
import 'package:wireapps_sneaker_shop/models/viewtype_models/cart_viewtype_model.dart';
import 'package:wireapps_sneaker_shop/utils/constants.dart';
import 'package:wireapps_sneaker_shop/utils/enums.dart';
import 'package:wireapps_sneaker_shop/utils/extensions.dart';
import 'package:wireapps_sneaker_shop/utils/styles/colors/app_colors.dart';
import 'package:wireapps_sneaker_shop/utils/styles/sizes/app_sizes.dart';

abstract class Utils {
  // variables
  static List<ProductDataModel> itemsOnCart = [];

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

  // show snack bar
  static void showSnackBar({
    required BuildContext context,
    required String alertMessage,
    bool isError = true,
  }) {
    final snackBar = SnackBar(
      content: Text(
        alertMessage,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 18,
          fontWeight: FontWeight.normal,
        ),
      ),
      backgroundColor: isError ? AppColors.cinnabar : AppColors.teal,
      padding: const EdgeInsets.all(20),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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

  static void addToCart(
      ProductDataModel productDataModel, BuildContext context) {
    try {
      bool contains = itemsOnCart.contains(productDataModel);

      if (contains == true) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();

        showSnackBar(
          context: context,
          alertMessage: 'Product is already in the cart.',
        );

        return;
      }

      itemsOnCart.add(productDataModel);

      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      showSnackBar(
        context: context,
        alertMessage: 'Product added to cart.',
        isError: false,
      );

      return;
    } catch (exception) {
      return;
    }
  }

  static void removeFromCart(
      ProductDataModel productDataModel, BuildContext context) {
    try {
      bool contains = itemsOnCart.contains(productDataModel);

      if (contains == true) {
        itemsOnCart.remove(productDataModel);

        ScaffoldMessenger.of(context).hideCurrentSnackBar();

        showSnackBar(
          context: context,
          alertMessage: 'Product removed from the cart.',
          isError: false,
        );

        return;
      }

      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      showSnackBar(
        context: context,
        alertMessage: 'Product is not in the cart.',
        isError: false,
      );

      return;
    } catch (exception) {
      return;
    }
  }

  static String sumOfItemsOnBag() {
    try {
      double sumPrice = 0.0;

      CurrencyType currencyType = CurrencyType.none;

      for (ProductDataModel productDataModel in itemsOnCart) {
        currencyType = productDataModel.price.currency;

        sumPrice = sumPrice + productDataModel.price.amount;
      }

      return '${currencyType.symboleValue}${sumPrice.toStringAsFixed(2)}';
    } catch (exception) {
      return '0.00';
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
