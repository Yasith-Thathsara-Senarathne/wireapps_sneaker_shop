import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wireapps_sneaker_shop/models/data_models/product_data_model.dart';
import 'package:wireapps_sneaker_shop/services/api_services/api_paths.dart';
import 'package:wireapps_sneaker_shop/services/api_services/response_models/list_api_response_model.dart';

abstract class RemoteServices {
  // variables

  static var client = http.Client();

  static var headers = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    'Accept': '*/*',
    'Accept-Encoding': 'gzip, deflate, br',
  };

  static var timeOut = const Duration(seconds: 30);

  // home
  static Future<List<ProductDataModel?>> products() async {
    try {
      final productListURL = Uri.https(
        APIPaths.baseAuthority,
        APIPaths.products,
      );

      final response = await client
          .get(
            productListURL,
            headers: headers,
          )
          .timeout(
            timeOut,
          );

      if (response.statusCode == 200) {
        final jsonString = utf8.decode(response.bodyBytes);

        final apiResponse = ListAPIResponseModel<ProductDataModel>()
            .convertToGenaricModelType(jsonString);

        return apiResponse.data as List<ProductDataModel>;
      }

      return [];
    } catch (exception) {
      rethrow;
    }
  }
}
