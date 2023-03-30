import 'package:get/get.dart';
import 'package:wireapps_sneaker_shop/pages/favorite/controller/favorite_controller.dart';

class FavoriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoriteController>(
      () => FavoriteController(),
    );
  }
}
