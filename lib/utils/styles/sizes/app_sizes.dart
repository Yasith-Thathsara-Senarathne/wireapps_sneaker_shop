import 'package:flutter/material.dart';

abstract class AppSizes {
  // variables

  //please don't set this value directly
  //It has initlaize correct value when the tab bar creation
  //Use when you need add padding more than tab bar min(x,y).
  static double bottomContentPaddingWithTabBar = 0;

  static double get tabBarViewHeight => 80;

  static double get tabBarContentHeight => 87;

  // width
  static double width(BuildContext context, {double of = 1.0}) {
    try {
      return MediaQuery.of(context).size.width * of;
    } catch (exception) {
      return 0.0;
    }
  }

  // height
  static double height(BuildContext context, {double of = 1.0}) {
    try {
      return MediaQuery.of(context).size.height * of;
    } catch (exception) {
      return 0.0;
    }
  }

  // top padding
  static double topPadding(BuildContext context) {
    try {
      return MediaQuery.of(context).padding.top;
    } catch (exception) {
      return 0.0;
    }
  }

  // left padding
  static double leftPadding(BuildContext context) {
    try {
      return MediaQuery.of(context).padding.left;
    } catch (exception) {
      return 0.0;
    }
  }

  // right padding
  static double rightPadding(BuildContext context) {
    try {
      return MediaQuery.of(context).padding.right;
    } catch (exception) {
      return 0.0;
    }
  }

  // bottom padding
  static double bottomPadding(BuildContext context) {
    try {
      return MediaQuery.of(context).padding.bottom;
    } catch (exception) {
      return 0.0;
    }
  }

  static double setBottomPaddingGetTabBarContentHeight(BuildContext context) {
    double botomPadding = bottomPadding(context);

    bottomContentPaddingWithTabBar = (botomPadding + tabBarContentHeight + 50);

    return tabBarContentHeight;
  }
}
