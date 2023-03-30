import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wireapps_sneaker_shop/models/viewtype_models/menu_bar_viewtype_model.dart';
import 'package:wireapps_sneaker_shop/pages/cart/view/cart_page.dart';
import 'package:wireapps_sneaker_shop/pages/favorite/view/favorite_page.dart';
import 'package:wireapps_sneaker_shop/pages/home/view/home_page.dart';
import 'package:wireapps_sneaker_shop/pages/profile/view/profile_page.dart';
import 'package:wireapps_sneaker_shop/utils/styles/colors/app_colors.dart';

class BottomMenuController extends GetxController {
  // variables

  Widget get activeScreen => menuBarViewTypeModelList[selectedIndex.value].page;

  // obs variables

  var menuBarViewTypeModelList = <MenuBarViewTypeModel>[].obs;

  var selectedIndex = 0.obs;

  @override
  void onInit() {
    menuBarViewTypeModelList.clear();

    menuBarViewTypeModelList.value = [
      // home page
      const MenuBarViewTypeModel(
        iconData: Icons.home_outlined,
        aciveColor: AppColors.mineShaft,
        inActiveColor: AppColors.white,
        page: HomePage(),
      ),

      // // favorite page
      // const MenuBarViewTypeModel(
      //   iconData: Icons.favorite_border_rounded,
      //   aciveColor: AppColors.mineShaft,
      //   inActiveColor: AppColors.white,
      //   page: FavoritePage(),
      // ),

      // // cart page
      // const MenuBarViewTypeModel(
      //   iconData: Icons.shopping_bag_outlined,
      //   aciveColor: AppColors.mineShaft,
      //   inActiveColor: AppColors.white,
      //   page: CartPage(),
      // ),

      // profile page
      const MenuBarViewTypeModel(
        iconData: Icons.person_outline_rounded,
        aciveColor: AppColors.mineShaft,
        inActiveColor: AppColors.white,
        page: ProfilePage(),
      ),
    ];

    super.onInit();
  }
}
