import 'package:get/get.dart';
import 'package:wireapps_sneaker_shop/pages/bottom_menu/controller/bottom_menu_controller.dart';

class BottomMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomMenuController>(
      () => BottomMenuController(),
    );
  }
}
