import 'package:flutter/material.dart';

class MenuBarViewTypeModel {
  // variables

  final IconData iconData;

  final Color aciveColor;

  final Color inActiveColor;

  final Widget page;

  const MenuBarViewTypeModel({
    required this.iconData,
    required this.aciveColor,
    required this.inActiveColor,
    required this.page,
  });
}
