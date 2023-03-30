import 'package:wireapps_sneaker_shop/utils/enums.dart';
import 'package:wireapps_sneaker_shop/utils/utils.dart';

class PriceDataModel {
  // variables

  final double amount;

  final CurrencyType currency;

  PriceDataModel({
    required this.amount,
    required this.currency,
  });

  factory PriceDataModel.fromJson(Map<String, dynamic> json) => PriceDataModel(
        amount: Utils.checkForNullJsonsDouble(jsonValue: json["amount"]),
        currency: Utils.checkForNullJsonsCurrencyEnumValue(
            jsonValue: json["currency"]),
      );
}
