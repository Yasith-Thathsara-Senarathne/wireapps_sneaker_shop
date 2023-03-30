import 'package:wireapps_sneaker_shop/models/data_models/product_data_model.dart';
import 'package:wireapps_sneaker_shop/utils/enums.dart';

class CartViewTypeModel {
  // variables

  final ProductDataModel productDataModel;

  final ShoeSizeType shoeSizeType;

  final int noOfItems;

  CartViewTypeModel({
    required this.productDataModel,
    required this.shoeSizeType,
    required this.noOfItems,
  });
}
