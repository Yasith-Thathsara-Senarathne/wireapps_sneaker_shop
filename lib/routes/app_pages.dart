import 'package:get/route_manager.dart';
import 'package:wireapps_sneaker_shop/pages/bottom_menu/binding/bottom_menu_binding.dart';
import 'package:wireapps_sneaker_shop/pages/bottom_menu/view/bottom_menu_page.dart';
import 'package:wireapps_sneaker_shop/pages/cart/binding/cart_binding.dart';
import 'package:wireapps_sneaker_shop/pages/cart/view/cart_page.dart';
import 'package:wireapps_sneaker_shop/pages/product_detail/binding/product_detail_binding.dart';
import 'package:wireapps_sneaker_shop/pages/product_detail/view/product_detail_page.dart';
import 'package:wireapps_sneaker_shop/routes/routes.dart';

class AppPages {
  // initial route
  static String get initial {
    return Routes.BOTTOM_MENU;
  }

  // routes
  static final List<GetPage> routes = [
    // bottom menu page
    GetPage(
      name: Routes.BOTTOM_MENU,
      page: () => const BottomMenuPage(),
      binding: BottomMenuBinding(),
      transition: Transition.fadeIn,
    ),

    // product detail page
    GetPage(
      name: Routes.PRODUCT_DETAIL,
      page: () => const ProductDetailPage(),
      binding: ProductDetailBinding(),
      transition: Transition.rightToLeft,
    ),

    // cart page
    GetPage(
      name: Routes.CART,
      page: () => const CartPage(),
      binding: CartBinding(),
      transition: Transition.rightToLeft,
    ),
  ];
}
