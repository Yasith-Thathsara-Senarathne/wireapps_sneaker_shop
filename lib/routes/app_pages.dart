import 'package:get/route_manager.dart';
import 'package:wireapps_sneaker_shop/pages/bottom_menu/binding/bottom_menu_binding.dart';
import 'package:wireapps_sneaker_shop/pages/bottom_menu/view/bottom_menu_page.dart';
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
  ];
}
