import 'dart:convert';

import 'package:wireapps_sneaker_shop/models/data_models/product_data_model.dart';

class ListAPIResponseModel<T> {
  // variables

  final String? result;

  final List<T>? data;

  ListAPIResponseModel({
    this.result,
    this.data,
  });

  // ignore: missing_return
  ListAPIResponseModel convertToGenaricModelType(String jsonString) {
    final jsonObj = json.decode(jsonString);

    switch (T) {
      case ProductDataModel:
        return ListAPIResponseModel(
          result: jsonObj["result"],
          data: List<ProductDataModel>.from(
            jsonObj["data"].map(
              (x) => ProductDataModel.fromJson(x),
            ),
          ),
        );
      default:
        return ListAPIResponseModel(
          result: "",
          data: [],
        );
    }
  }
}
