import 'package:get/get.dart';
import 'package:wireapps_sneaker_shop/models/data_models/product_data_model.dart';
import 'package:wireapps_sneaker_shop/services/api_services/remote_services.dart';
import 'package:wireapps_sneaker_shop/utils/enums.dart';
import 'package:wireapps_sneaker_shop/utils/utils.dart';

class HomeController extends GetxController {
  // variables

  // obs variables

  // loading
  var loading = false.obs;

  // product list
  var productList = [].obs;

  // fetch products
  Future<RemoteResponseType> fetchProducts() async {
    try {
      loading.value = true;

      productList.clear();

      bool hasConnection = await Utils.hasConnection();

      if (!hasConnection) {
        return RemoteResponseType.noInternet;
      }

      final result = await RemoteServices.products();

      if (result == null || result.isEmpty) {
        return RemoteResponseType.emptyData;
      }

      productList.addAll(result);

      return RemoteResponseType.success;
    } catch (exception) {
      return RemoteResponseType.failed;
    } finally {
      loading.value = false;
    }
  }
}
