import 'package:wireapps_sneaker_shop/utils/enums.dart';

extension CurrencyTypeExtension on CurrencyType {
  String get convertValue {
    switch (this) {
      case CurrencyType.gbp:
        return 'GBP';

      case CurrencyType.usd:
        return 'USD';

      default:
        return 'GBP';
    }
  }

  String get symboleValue {
    switch (this) {
      case CurrencyType.gbp:
        return '£';

      case CurrencyType.usd:
        return '\$';

      default:
        return '£';
    }
  }
}

extension ShoeSizeTypeExtension on ShoeSizeType {
  String get convertValue {
    switch (this) {
      case ShoeSizeType.eight:
        return '8';

      case ShoeSizeType.nine:
        return '9';

      case ShoeSizeType.ten:
        return '10';

      case ShoeSizeType.eleven:
        return '11';
      default:
        return '0';
    }
  }
}

extension ShoeColorTypeeExtension on ShoeColorType {
  String get convertValue {
    switch (this) {
      case ShoeColorType.blue:
        return 'blue';

      case ShoeColorType.black:
        return 'black';

      case ShoeColorType.purple:
        return 'purple';

      case ShoeColorType.green:
        return 'green';

      case ShoeColorType.yellow:
        return 'yellow';

      case ShoeColorType.multiColoured:
        return 'multicoloured';
      default:
        return 'none';
    }
  }

  // String get convertValue {
  //   switch (this) {
  //     case ShoeColorType.blue:
  //       return 'blue';

  //     case ShoeColorType.black:
  //       return 'black';

  //     case ShoeColorType.purple:
  //       return 'purple';

  //     case ShoeColorType.green:
  //       return 'green';

  //     case ShoeColorType.yellow:
  //       return 'yellow';

  //     case ShoeColorType.multiColoured:
  //       return 'multicoloured';
  //     default:
  //       return 'none';
  //   }
  // }
}
