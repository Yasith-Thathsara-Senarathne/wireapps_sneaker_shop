import 'package:wireapps_sneaker_shop/models/data_models/price_data_model.dart';
import 'package:wireapps_sneaker_shop/utils/enums.dart';
import 'package:wireapps_sneaker_shop/utils/utils.dart';

class ProductDataModel {
  // variables

  final String id;

  final String sku;

  final String name;

  final String brandName;

  final String mainImage;

  final PriceDataModel price;

  final List<ShoeSizeType> sizes;

  final String stockStatus;

  final ShoeColorType colour;

  final String description;

  ProductDataModel({
    required this.id,
    required this.sku,
    required this.name,
    required this.brandName,
    required this.mainImage,
    required this.price,
    required this.sizes,
    required this.stockStatus,
    required this.colour,
    required this.description,
  });

  factory ProductDataModel.fromJson(Map<String, dynamic> json) =>
      ProductDataModel(
        id: Utils.checkForNullJsonsString(jsonValue: json["id"]),
        sku: Utils.checkForNullJsonsString(jsonValue: json["SKU"]),
        name: Utils.checkForNullJsonsString(jsonValue: json["name"]),
        brandName: Utils.checkForNullJsonsString(jsonValue: json["brandName"]),
        mainImage: Utils.checkForNullJsonsString(jsonValue: json["mainImage"]),
        price: PriceDataModel.fromJson(json["price"]),
        sizes: List<ShoeSizeType>.from(
          json["sizes"].map(
            (x) => Utils.checkForNullJsonsShoeSizeEnumValue(jsonValue: x),
          ),
        ),
        stockStatus:
            Utils.checkForNullJsonsString(jsonValue: json["stockStatus"]),
        colour: Utils.checkForNullJsonsShoeColorEnumValue(
            jsonValue: json["colour"]),
        description:
            Utils.checkForNullJsonsString(jsonValue: json["description"]),
      );
}
