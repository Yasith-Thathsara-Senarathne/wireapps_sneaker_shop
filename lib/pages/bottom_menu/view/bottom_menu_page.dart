import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:wireapps_sneaker_shop/pages/bottom_menu/controller/bottom_menu_controller.dart';
import 'package:wireapps_sneaker_shop/pages/bottom_menu/view/widgets/bottom_navigation_view.dart';
import 'package:wireapps_sneaker_shop/utils/styles/sizes/app_sizes.dart';

class BottomMenuPage extends StatefulWidget {
  const BottomMenuPage({super.key});

  @override
  State<BottomMenuPage> createState() => _BottomMenuPageState();
}

class _BottomMenuPageState extends State<BottomMenuPage> {
  // varibales

  final BottomMenuController _bottomMenuController =
      Get.put(BottomMenuController());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: OverflowBox(
          maxHeight: AppSizes.height(context),
          alignment: Alignment.topCenter,
          child: _bottomMenuController.activeScreen,
        ),
        bottomNavigationBar: BottomNavigationView(
          selectedIndex: _bottomMenuController.selectedIndex.value,
          menuBarViewTypeModelList:
              _bottomMenuController.menuBarViewTypeModelList,
          onMenuTapped: (value) {
            _bottomMenuController.selectedIndex.value = value;
          },
        ),
      ),
    );
  }
}
