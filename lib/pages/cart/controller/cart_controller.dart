import 'package:get/get.dart';
import 'package:wireapps_sneaker_shop/utils/utils.dart';

class CartController extends GetxController {
  // loading
  var loading = false.obs;

  // product list
  var cartProductList = [].obs;

  // fetch products
  Future<void> fetchCartProducts() async {
    try {
      loading.value = true;

      cartProductList.clear();

      cartProductList.addAll(Utils.itemsOnCart);

      return;
    } catch (exception) {
      return;
    } finally {
      loading.value = false;
    }
  }
}
