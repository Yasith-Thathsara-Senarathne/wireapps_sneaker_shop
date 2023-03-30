import 'package:get/get.dart';
import 'package:wireapps_sneaker_shop/pages/product_detail/controller/product_detail_controller.dart';

class ProductDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDetailController>(
      () => ProductDetailController(),
    );
  }
}
