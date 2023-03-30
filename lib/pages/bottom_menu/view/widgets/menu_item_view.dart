import 'package:flutter/material.dart';
import 'package:wireapps_sneaker_shop/models/viewtype_models/menu_bar_viewtype_model.dart';

class MenuItemView extends StatelessWidget {
  // variables

  final MenuBarViewTypeModel menuBarViewTypeModel;

  final bool isSelected;

  const MenuItemView({
    super.key,
    required this.menuBarViewTypeModel,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isSelected) {
      return Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: menuBarViewTypeModel.inActiveColor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Icon(
          menuBarViewTypeModel.iconData,
          size: 28,
          color: menuBarViewTypeModel.aciveColor,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(18),
      child: Icon(
        menuBarViewTypeModel.iconData,
        size: 28,
        color: menuBarViewTypeModel.inActiveColor,
      ),
    );
  }
}
