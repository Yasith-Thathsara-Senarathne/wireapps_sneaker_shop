import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wireapps_sneaker_shop/routes/app_pages.dart';
import 'package:wireapps_sneaker_shop/utils/styles/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const SneakerShopApp(),
  );
}

class SneakerShopApp extends StatelessWidget {
  const SneakerShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sneaker Shop',
      theme: AppTheme.themeData,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
